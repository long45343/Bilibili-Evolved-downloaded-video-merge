@echo off
set "fileBaseName=%~n1"
if not exist "%fileBaseName%.m4a" goto :fileNotFound
if not exist "%fileBaseName%.mp4" goto :fileNotFound
ffmpeg -i %~n1.mp4 -i %~n1.m4a -codec copy %~n1-2.mp4
del %~n1.mp4
del %~n1.m4a
ren %~n1-2.mp4 %~n1.mp4
pause
exit
:flacprocess
ffmpeg -i %~n1.mp4 -i %~n1.flac -codec copy %~n1-2.mp4
del %~n1.mp4
del %~n1.flac
ren %~n1-2.mp4 %~n1.mp4
pause
exit
:fileNotFound
if exist "%fileBaseName%.flac" goto :flacprocess
echo 输入文件格式错误/两个文件名字不一样/只有一个文件！
pause
exit
