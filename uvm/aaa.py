import os
import re

header_dir = r"./"  # 修改为你的头文件目录

for root, _, files in os.walk(header_dir):
    for file in files:
        if file.endswith(".sv") or file.endswith(".svh"):
            filepath = os.path.join(root, file)
            with open(filepath, "r", encoding="utf-8") as f:
                content = f.read()

            # 跳过已有 include guard 或 #pragma once 的文件
            if re.search(r"#ifndef", content) or re.search(r"`define", content) or re.search(r"`endif", content):
                continue

            # 生成宏名：FILE_NAME_H
            macro = re.sub(r'[^a-zA-Z0-9]', '_', file.upper())
            guard = f"#ifndef {macro}\n`define {macro}\n\n"
            footer = f"\n`endif // {macro}"

            with open(filepath, "w", encoding="utf-8") as f:
                f.write(guard + content + footer)

            print(f"Added guard to {filepath}")