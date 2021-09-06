@echo off 
pushd "%~dp0"

set /p outExt="Output extension (jpg, png, svg): "
set /p numShapes="Number of shapes: "
set /p setMode="Shapes: one or more (use space between them): rectangle rotated_rectangle triangle ellipse rotated_ellipse circle line quadratic_bezier polyline: "
set /p numCandidate="Number of shape candidates, less is faster but has lower accuracy, default is 500 : "
set /p numMutates="Number of shape mutates, less is faster but has lower accuracy, default is 100 : "

echo;
for %%G in ("in\*.*") do (
    echo Encoding "%%~G" ...
    geometrize.exe -i "%%~G" -o "out\%%~nG.%outExt%" -s %numShapes% -t "%setMode%" -c %numCandidate% -m %numMutates% >nul 2>&1
)

echo;
echo Done! Press any key to continue ...
popd
exit >nul 2>&1