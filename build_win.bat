@echo off
setlocal EnableDelayedExpansion

REM Download latest libplacebo
git clone --recursive https://github.com/haasn/libplacebo

REM Setup the project files
mkdir include
xcopy /y /v /s /e libplacebo 
rmdir /s /q libplacebo
xcopy /y /v /s /e src\include include
echo "Listing mod..."
dir mod
copy /y /v mod/config_internal.h src
echo "Listing src..."
dir src
rmdir /s /q mod
rmdir /s /q src\include
rmdir /s /q src\tests

REM Build Debug configuration
cmake -B build
cmake --build build --config Debug

exit /b
