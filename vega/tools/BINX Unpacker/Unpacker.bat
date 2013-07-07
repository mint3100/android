@echo off
title BINX Unpacker
setlocal enabledelayedexpansion
set binx=�����Ǿ� ���� ����

:Start
echo.
echo.
echo      ^������: Mir ^ �۾��� BINX���� ��: %binx%
echo.
echo      �� ���� BINX������ ����(Unpack)�� �� �ִ� �� �Դϴ�
echo      binx������ BINX������ �־��ּ���
echo.
echo      ��ġ�� ���� ���α׷�
echo      [Net Framework 4.0�̻�, Microsoft Visual Studio 2010 ��Ű��]
echo      �� ���α׷��� ��ġ�Ǿ� �־�� �մϴ�
echo.
echo      �غ� �Ϸ�Ǽ̴ٸ� �ƹ� ��ư�� �����ּ���
pause
goto choosebinx

:choosebinx
cls
echo      ^������: Mir ^ �۾��� BINX���� ��: %binx%
echo.

set /A count=0
FOR %%F IN (BINX/*.binx) DO (
set /A count+=1
set a!count!=%%F
if /I !count! LEQ 9 (echo ^- !count!  - %%F )
if /I !count! GTR 10 (echo ^- !count! - %%F )
)

echo.
set /P choose=�۾��� BINX������ �����ϼ���: %=%
if /I %choose%==0 (goto start)
if /I %choose% GTR !count! (goto chc)
if /I %choose% LSS 1 (goto chc)
set binx=!a%choose%!
goto binx

:binx
cls
echo      ^������: Mir ^ �۾��� BINX���� ��: %binx%
echo.
echo      BINX�� BIN���� ��ȯ�ϴ� �۾��� ��ġ�� �ֽ��ϴ�
echo.
cd other
regsvr32 SkyUpdate.ocx
SkyBinTool "../BINX/%binx%" "../BINX/%binx%.bin"
echo      BINX������ BIN���� ��ȯ�߽��ϴ�
echo      ���� BIN������ ��ü�մϴ�.
cd ../BINX
Extract -i %binx%.bin -o BINXfile -l -e
echo.
echo      BINX ���ذ� �Ϸ�Ǿ����ϴ�
echo      �ƹ�Ű�� �����ø� ���α׷��� ����˴ϴ�
pause
exit