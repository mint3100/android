@echo off
title Delete Active X Tool
mode con:cols=82 lines=30
setlocal enabledelayedexpansion
cls

:Start
echo.
echo.
echo      �١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١�
echo      ��                         Delete Active X Tool                       ��
echo      ��                                                                    ��
echo      ��               Offline Updater�� ����ѵ� �߻��� �� �ִ�            ��
echo      ��                    Dll������ �ذ��� �� �ֽ��ϴ�                    ��
echo      ��  Script made Mir                                                   ��
echo      �١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١١�
echo.
echo.
echo      SkyUpdate.ocx�� ��ϰ� Self Update Active X�� ������ �ݴϴ�
echo      Log.dll������ �߻��Ұ�� ����� �ּ���
echo.
echo.
pause
regsvr32 /u /s File\SkyUpdate.ocx
File\busybox rm -f C:\Windows\Downloaded Program Files\SkyUpdate.inf
echo.
echo      -------------------------------------------------------------
echo      ��� �۾��� �Ϸ�Ǿ����ϴ� �ƹ�Ű�� �����ø� �� â�� �����ϴ�
echo      -------------------------------------------------------------
echo.
pause