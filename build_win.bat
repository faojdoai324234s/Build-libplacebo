@echo off
setlocal EnableDelayedExpansion

REM Download latest libplacebo
git clone --recursive https://github.com/haasn/libplacebo

REM Setup the project files
mkdir include
xcopy /y /v /s /e libplacebo 
rmdir /s /q libplacebo
xcopy /y /v /s /e src\include include
rmdir /s /q src\include

REM Build Debug configuration
cmake -B build -D vulkan=disabled -D shaderc=disabled
cmake --build build --config Debug

exit /b
