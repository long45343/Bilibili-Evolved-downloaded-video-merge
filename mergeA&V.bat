@echo off
set "fileBaseName=%~n1"
if not exist "%fileBaseName%.m4a" goto :fileNotFound
if not exist "%fileBaseName%.mp4" goto :fileNotFound
ffmpeg -i "%fileBaseName%.mp4" -i "%fileBaseName%.m4a" -codec copy "%~n1-2.mp4"
del "%fileBaseName%.mp4"
del "%fileBaseName%.m4a"
ren "%fileBaseName%-2.mp4" "%fileBaseName%.mp4"
pause
exit
:flacprocess
ffmpeg -i "%fileBaseName%.mp4" -i "%fileBaseName%.flac" -codec copy "%fileBaseName%-2.mp4"
del "%fileBaseName%.mp4"
del "%fileBaseName%.flac"
ren "%fileBaseName%-2.mp4" "%fileBaseName%.mp4"
pause
exit
:fileNotFound
if exist "%fileBaseName%.flac" goto :flacprocess
echo �����ļ���ʽ����/�����ļ����ֲ�һ��/ֻ��һ���ļ���
pause
exit
