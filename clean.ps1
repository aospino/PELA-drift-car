# PELA - 3D Printed LEGO-compatible parametric blocks
#
# Clean the STL models to remove any artifacts and re-save in binary format
# This operation is not needed if 'make.ps1 -clean' flag is run. If you did not
# do this, for example because of high RAM requirements of cleaning, you can use
# this script separately and possibly on a different computer.
#
# See http://PELAblocks.org for more information
# 
# Part of https://github.com/LEGO-prototypes/PELA-parametric-blocks

param (
    [String]$name
)

Write-Output "======= Clean Mesh $name"
Invoke-Expression "meshlabserver.exe -i $name -o $name -s ./PELA-parmetric-blocks/clean1.mlx"
Invoke-Expression "meshlabserver.exe -i $name -o $name -s ./PELA-parmetric-blocks/clean2.mlx"
Invoke-Expression "meshlabserver.exe -i $name -o $name -s ./PELA-parmetric-blocks/clean3.mlx"
Invoke-Expression "meshlabserver.exe -i $name -o $name -s ./PELA-parmetric-blocks/clean4.mlx"
Invoke-Expression "meshlabserver.exe -i $name -o $name -s ./PELA-parmetric-blocks/clean5.mlx"
Invoke-Expression "meshlabserver.exe -i $name -o $name -s ./PELA-parmetric-blocks/clean6.mlx"
Write-Output ""
