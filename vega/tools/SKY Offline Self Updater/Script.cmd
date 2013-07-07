@echo off
title SKY Offline Self Updater
mode con:cols=82 lines=30
setlocal enabledelayedexpansion
set binx=NOBINX
cls

:Start
echo.
echo.
echo      �١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١�
echo      ��                     SKY Offline Self Updater                       ��
echo      ��                                                                    ��
echo      ��          �� ���� ���ͳݿ� �������� �ʾƵ� BINX�� �̿��Ͽ�          ��
echo      ��           ���� ���׷��̵带 ����� �� �ְ� �ϴ� ���Դϴ�           ��
echo      ��                                                                    ��
echo      ��                 �� ���� ��� ������ ���� ������ �ּ���             ��
echo      ��                                                                    ��
echo      ��  Made by su_ky  /  Script made Mir                                 ��
echo      �١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١�
echo.
echo.
echo      ���� ���׷��̵带 �ϰ��� �ϴ� ����� �𵨸��� �����ּ��� (��:IM-A750K)
echo.
set /P model=����� �𵨸��� �Է��� �ּ���: %=%
set model=%model%
goto Model

:Model
cls
mkdir .\sky_update\%model%
echo.
echo.
echo      ���׷��̵� �� ���� "%model%" �Դϴ�
echo.
echo      sky_update������ ���ø� �Է��Ͻ� "%model%" ������ �����Ǿ� �����̴ϴ�
echo      �����ȿ� BINX������ �־��ֽŴ��� �������� ������ �ּ���
echo.
pause
goto obinx

:obinx
set /A count=0
FOR %%F IN (sky_update/%model%/*.binx) DO (
set /A count+=1
set tmpstore=%%~nF%%~xF
)
if %count%==1 (set binx=%tmpstore%)
if %binx%==NOBINX (goto BINX1)
goto inf1

:inf1
echo.
echo.
echo      ���� Ž�� ��� �ϳ��� BINX�� �߰ߵǾ����ϴ�
echo      BINX ���� �̸� : "%binx%"
echo.
echo      �ƹ� Ű�� ���� �������� �Ѿ �ּ���
echo.
pause
goto continue

:BINX1
cls
echo.
echo.
echo      Ž����� ������ 2���̻��� BINX�� �����մϴ�
echo      �Ʒ� ��Ͽ��� ����� BINX�� ������ �ּ���
echo.
echo.
echo      ----- BINX ���� ���
echo.
set /A count=0
FOR %%F IN (sky_update/%model%/*.binx) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo ^- !count!  - %%F )
if /I !count! GTR 10 (echo ^- !count! - %%F )
)
set /P INPUT=����� BINX������ ���ڸ� �Է��� �ּ���: %=%
if /I %INPUT% GTR !count! (goto chc)
if /I %INPUT% LSS 1 (goto chc)
set binx=!a%INPUT%!
goto BINX2

:BINX2
cls
echo.
echo.
echo      �������� BINX������ �����Ͽ����ϴ�
echo      BINX ���� �̸� : "%binx%"
echo.
echo      �ƹ� Ű�� ���� �������� �Ѿ �ּ���
echo.
pause
goto continue

:continue
cls
echo.
echo.
echo      [�۾��� �����մϴ�]
File\busybox echo "[%model%]" > ./sky_update/download.inf
File\busybox echo "Version=S1231153" >> ./sky_update/download.inf
File\busybox echo "FileName=%binx%" >> ./sky_update/download.inf
File\busybox echo "FSVersion=21" >> ./sky_update/download.inf
File\busybox echo "NVVersion=22" >> ./sky_update/download.inf
File\busybox echo "Size=433927235" >> ./sky_update/download.inf
File\busybox echo "CRC=26266" >> ./sky_update/download.inf
echo.
echo      download.inf ������ �Ϸ��߽��ϴ�
regsvr32 /s File\SkyUpdate.ocx
echo.
echo      SkyUpdate.ocx����� �Ϸ��߽��ϴ�
echo.
echo      HFS�� �����մϴ� ���α׷�â�� ���� ���ð� ��ȫ�� ������ Ŭ���� �ּ���
echo.
pause
start File\hfs sky_update
echo      ��ȫ�� ������ Ŭ���ϽŴ��� �ƹ�Ű�� �����ּ���
pause
echo.
echo      Self Upgradeâ�� ��Ÿ���ϴ� ��⸦ �����Ѵ��� "���׷��̵� ����"��ư�� �����ּ���
start http://localhost/sky_update/index.html
goto exit

:exit
echo.
echo      ���� Log.dll���� ������ �߻��Ѵٸ� Del_ActiveX.cmd�� ������ �ּ���
echo.
echo      -------------------------------------------------------------
echo      ��� �۾��� �Ϸ�Ǿ����ϴ� �ƹ�Ű�� �����ø� �� â�� �����ϴ�
echo      -------------------------------------------------------------
pause
exit