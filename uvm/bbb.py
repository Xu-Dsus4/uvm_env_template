# replace_in_files.py

import os
from pathlib import Path

# ==================== 配置区（你可以在这里修改参数）====================
ROOT_DIRECTORY = r"./"           # 要处理的根目录
OLD_STRING = "#endif"             # 要被替换的旧字符串
NEW_STRING = "`endif"             # 新字符串
FILE_EXTENSIONS = {'.sv', '.svh'}  # 指定要处理的文件类型，设为 None 表示处理所有文件
ENABLE_BACKUP = False                      # 是否备份原文件（重命名为 .bak）
# ======================================================================

def replace_in_file(file_path):
    """在单个文件中进行字符串替换"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        if OLD_STRING not in content:
            return False  # 未包含目标字符串，无需替换

        new_content = content.replace(OLD_STRING, NEW_STRING)

        # 备份原文件
        if ENABLE_BACKUP:
            backup_path = str(file_path) + ".bak"
            if not os.path.exists(backup_path):
                os.rename(file_path, backup_path)
            else:
                print(f"警告: 备份文件已存在，跳过备份: {backup_path}")
                return  # 避免覆盖已有备份
        else:
            # 无备份，直接覆盖
            pass

        # 写入新内容
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)

        print(f"已替换: {file_path}")
        return True

    except Exception as e:
        print(f"处理失败 (跳过): {file_path} | 错误: {e}")
        # 如果备份了但写入失败，尝试恢复
        if ENABLE_BACKUP:
            try:
                os.rename(str(file_path) + ".bak", file_path)
                print(f"已恢复: {file_path}")
            except:
                print(f"严重: 写入失败且无法恢复: {file_path}")
        return False

def batch_replace():
    root_path = Path(ROOT_DIRECTORY)

    if not root_path.exists():
        print(f"错误: 路径不存在: {root_path}")
        return

    if not root_path.is_dir():
        print(f"错误: 路径不是目录: {root_path}")
        return

    count = 0
    for file_path in root_path.rglob("*"):
        if file_path.is_file():
            # 过滤扩展名
            if FILE_EXTENSIONS and file_path.suffix.lower() not in FILE_EXTENSIONS:
                continue

            if replace_in_file(file_path):
                count += 1

    print(f"\n✅ 完成！共替换 {count} 个文件。")

# ==================== 主程序 ====================
if __name__ == "__main__":
    print("开始批量替换...")
    print(f"路径: {ROOT_DIRECTORY}")
    print(f"替换: '{OLD_STRING}' → '{NEW_STRING}'")
    print(f"文件类型: {FILE_EXTENSIONS if FILE_EXTENSIONS else '所有文件'}")
    print(f"备份: {'是' if ENABLE_BACKUP else '否'}")
    print("-" * 50)

    batch_replace()

    print("-" * 50)
    print("批量替换结束。")