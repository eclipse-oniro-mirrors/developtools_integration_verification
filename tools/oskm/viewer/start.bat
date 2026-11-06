@echo off
rem oskm viewer 离线启动脚本 (Windows)
rem 把 knowledge.db 放在 viewer\dist\ 旁边，运行此脚本
cd /d "%~dp0"
set PORT=8765
echo oskm viewer -^> http://localhost:%PORT%
echo 按 Ctrl+C 退出
python -m http.server %PORT%
