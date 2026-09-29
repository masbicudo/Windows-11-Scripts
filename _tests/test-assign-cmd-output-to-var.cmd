@echo off
FOR /F "tokens=*" %%A IN ('dir "."') DO (
    SET var=%%A
)
ECHO %var%
pause