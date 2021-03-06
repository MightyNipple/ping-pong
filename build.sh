#!/bin/bash
ObjOutDir=build/obj/
BinOutDir=build/

mkdir -p $BinOutDir
mkdir -p $ObjOutDir

CommonDefines="-D_CRT_SECURE_NO_WARNINGS -DWIN32_LEAN_AND_MEAN -DPLATFORM_WINDOWS -DUNICODE -D_UNICODE"
CommonCompilerFlags="-std=c++17 -ffast-math -fno-rtti -fno-exceptions -static-libgcc -static-libstdc++ -fno-strict-aliasing -Werror -Wno-switch"
DebugCompilerFlags="-O0 -fno-inline-functions -g"
ReleaseCompilerFlags="-O2 -finline-functions -g"
PlatformLinkerFlags="-lgdi32 -lopengl32 -luser32 -lwinmm"
GameLinkerFlags=""

ConfigCompilerFlags=$DebugCompilerFlags

clang++ -save-temps=obj -DPLATFORM_CODE -o $BinOutDir/win32_pong.exe $CommonDefines $IncludeDirs $CommonCompilerFlags $ConfigCompilerFlags src/platform/Win32Platform.cpp $PlatformLinkerFlags
clang++ -save-temps=obj -o $BinOutDir/pong.dll $CommonDefines $IncludeDirs $CommonCompilerFlags $ConfigCompilerFlags src/Game.cpp -shared  $GameLinkerFlags
