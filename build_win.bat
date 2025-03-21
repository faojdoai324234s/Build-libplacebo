@echo off
setlocal EnableDelayedExpansion

REM Download latest libplacebo
git clone --recursive https://github.com/haasn/libplacebo

mkdir libplacebo\build

DIR=libplacebo\build
cd libplacebo
meson $DIR
$ meson configure $DIR

exit /b
