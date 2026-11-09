#!/usr/bin/env bash
# oskm viewer 离线启动脚本
# 用法：把 knowledge.db 放在 viewer/dist/ 旁边，运行此脚本
# 浏览器自动打开 http://localhost:8765
cd "$(dirname "$0")"
PORT=8765
echo "oskm viewer → http://localhost:$PORT"
echo "按 Ctrl+C 退出"
python3 -m http.server $PORT
