# PELA - 3D Printed LEGO-compatible drift car
#
# Generate a set of objects calibrated for your printer by changes to PELA-print-parameters.scad
# See http://driftcar.PELAblocks.org for more information
# 
# Part of https://github.com/LEGO-compatible-gadgets/PELA-drift-car
#
# The parameters turn on generation of various features. Note that STLs are .gitignore so you can create them
# locally without impacting publishing. Published PNGs and STLs are generated in this project.

param (
    [switch]$stl = $false, # Generate models with current print calibration (.gitignore)
    [switch]$png = $false, # Generate preview images for the website
    [switch]$clean = $false, # Clean some model defects and re-save as binary STL (1/2 the size)
    [switch]$publish = $false, # Publish the result back to the github and the web when done
    [String]$outdir = "."         # In what based directory are generated STL and PNG files written
)

Function FormatElapsedTime($ts) {
    $elapsedTime = ""

    if ( $ts.Minutes -gt 0 ) {
        $elapsedTime = [String]::Format( "{0:00}m {1:00}.{2:00}s", $ts.Minutes, $ts.Seconds, $ts.Milliseconds / 10 );
    }
    else {
        $elapsedTime = [String]::Format( "{0:00}.{1:00}s", $ts.Seconds, $ts.Milliseconds / 10 );
    }

    if ($ts.Hours -eq 0 -and $ts.Minutes -eq 0 -and $ts.Seconds -eq 0) {
        $elapsedTime = [String]::Format("{0:00}ms", $ts.Milliseconds);
    }

    if ($ts.Milliseconds -eq 0) {
        $elapsedTime = [String]::Format("{0}ms", $ts.TotalMilliseconds);
    }

    return $elapsedTime
}

Function render($path, $name) {
    Write-Output ""
    $start = Get-Date
    Write-Output $start
    if ($stl) {
        Write-Output "Render $outdir\$name as STL"
        Remove-Item .\$name.stl 2> $null
        Invoke-Expression "openscad -o $name.stl $path\$name.scad"
        Write-Output "STL Render time: $elapsed for $name"
    }

    if ($clean) {
        Invoke-Expression ".\PELA-parametric-blocks\clean.ps1 $name.stl"
    }

    if ($stl) {
        if ($outdir -NE ".") {
            Move-Item .\$name.stl $outdir
        }
        $elapsed = FormatElapsedTime ((Get-Date) - $start)
    }

    if ($png) {
        render-png $path $name
    }
    Write-Output ""    
}

# Create a PNG from the .scad file (slow, not pretty, but no Python or POVRay needed)
Function render-png($path, $name) {
    Write-Output "Render $outdir\$name as PNG"
    $start = Get-Date
    Write-Output $start
    Remove-Item .\$name.png 2> $null
    Invoke-Expression "openscad --render -o $name.png $path\$name.scad"
    Remove-Item $outdir\images\$name.png 2> $null
    Move-Item .\$name.png $outdir\images\
    $elapsed = FormatElapsedTime ((Get-Date) - $start)
    Write-Output "PNG Render time: $elapsed for $name"
    Write-Output ""
}

Write-Output "Generating PELA Blocks"
Write-Output "======================"
Write-Output Get-Date

if ($stl) {
    Write-Output "Removing old STL files"
    $extras += " -stl"
}

if ($clean) {
    Write-Output "Cleaning STL files as they are created"
    $extras += " -clean"
}
if ($png) {
    Write-Output "Removing old PNG files"
    $extras += " -png"
}


render ".\" "riser"


Write-Output Get-Date

if ($publish) {
    Write-Output "Publishing PELA Blocks"
    Write-Output "======================"
    git status
    git add *.scad
    git add *.png
    git add *.stl
    git commit -m "Publish"
    git push
    git status
}
