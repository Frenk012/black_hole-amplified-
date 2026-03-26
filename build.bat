@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64

echo === CONFIGURING ===
cmake -B build -S . -DCMAKE_TOOLCHAIN_FILE=C:\vcpkg\scripts\buildsystems\vcpkg.cmake -G "NMake Makefiles" > build_log.txt 2>&1
type build_log.txt
if errorlevel 1 goto :fail

echo === BUILDING ===
cmake --build build > build_log2.txt 2>&1
type build_log2.txt
if errorlevel 1 goto :fail

echo === BUILD SUCCEEDED ===
pause
goto :eof

:fail
echo === BUILD FAILED ===
pause
