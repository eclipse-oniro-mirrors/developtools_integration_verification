@rem Copyright (c) 2026 Huawei Device Co., Ltd.
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem     http://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.

@echo off
setlocal enabledelayedexpansion
set "BASE_DIR=%~dp0"
set "TOOLS=%BASE_DIR%tools"
set "PYTHON=python"
cd /d "%BASE_DIR%"

echo ================================================================
echo  Debug Optimization Test Framework - Dependencies Installer
echo ================================================================
echo.

:: Check Python
where %PYTHON% >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found! Please install Python 3.8+ first.
    pause
    goto :eof
)

%PYTHON% -c "import sys; sys.exit(0 if sys.version_info >= (3, 8) else 1)"
if errorlevel 1 (
    echo [ERROR] Python 3.8 or higher version required!
    pause
    goto :eof
)

:: Check tools directory
if not exist "%TOOLS%" (
    echo [ERROR] "%TOOLS%" directory not exist
    pause
    goto :eof
)

echo [1/4] Uninstalling old xdevice/hypium packages...
for /f "tokens=1 delims= " %%a in ('%PYTHON% -m pip list 2^>nul ^| findstr /i "xdevice hypium"') do (
    echo   Uninstalling: %%a
    %PYTHON% -m pip uninstall -y %%a >nul 2>&1
)
echo   Done.
echo.

echo [2/4] Installing xdevice/hypium from local whl packages...
echo   Source: %TOOLS%
echo.
cd /d "%TOOLS%"
%PYTHON% install.py -g hypium_basic
if errorlevel 1 (
    echo.
    echo [WARNING] install.py failed, trying manual pip install...
    cd /d "%BASE_DIR%"
    %PYTHON% -m pip install --force-reinstall "%TOOLS%\xdevice-26.0.0.500-py3-none-any.whl"
    %PYTHON% -m pip install --force-reinstall "%TOOLS%\xdevice_devicetest-26.0.0.500-py3-none-any.whl"
    %PYTHON% -m pip install --force-reinstall "%TOOLS%\xdevice_ohos-26.0.0.500-py3-none-any.whl"
    %PYTHON% -m pip install --force-reinstall "%TOOLS%\hypium-26.0.0.500-py3-none-any.whl"
)
cd /d "%BASE_DIR%"
echo.

echo [3/4] Installing websockets...
%PYTHON% -m pip install websockets
if errorlevel 1 (
    echo [WARNING] Failed to install websockets, trying with mirror...
    %PYTHON% -m pip install websockets -i https://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
)
echo.

echo [4/4] Verifying installation...
echo.
set VERIFY_OK=1
%PYTHON% -c "import xdevice; print('  xdevice:        OK')"
if errorlevel 1 (
    echo   xdevice:        FAIL
    set VERIFY_OK=0
)
%PYTHON% -c "import devicetest; print('  devicetest:     OK')"
if errorlevel 1 (
    echo   devicetest:     FAIL
    set VERIFY_OK=0
)
%PYTHON% -c "from hypium import UiDriver; print('  hypium:         OK')"
if errorlevel 1 (
    echo   hypium:         FAIL
    set VERIFY_OK=0
)
%PYTHON% -c "import websockets; print('  websockets:     OK')"
if errorlevel 1 (
    echo   websockets:     FAIL
    set VERIFY_OK=0
)
echo.

if "%VERIFY_OK%"=="0" (
    echo ================================================================
    echo  Installation FAILED! Please check errors above.
    echo ================================================================
    exit /b 1
)

echo ================================================================
echo  Installation complete! Starting hypium...
echo ================================================================
%PYTHON% -m hypium
