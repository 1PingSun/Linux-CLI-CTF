#!/bin/bash

# 檢查是否提供了深度作為參數
if [ -z "$1" ]; then
    echo "請提供資料夾深度作為參數。"
    exit 1
fi

# 讀取深度參數
depth=$1

# 設置資料夾名稱列表
folder_names=("Mikhail" "Aleksandr" "Yevgeni" "Sergey" "Vasili" "Mariya" "Yuli" "Tatyana" "Arkadi" "Gregor")

# 從當前目錄開始創建資料夾
current_path=$(pwd)

# 迴圈創建指定深度的資料夾
for ((i=1; i<=depth; i++))
do
    # 取資料夾名稱列表中的元素，並根據當前層數選擇對應的名稱
    folder_name=${folder_names[((i-1) % 10)]}

    # 更新當前路徑
    current_path="$current_path/$folder_name"

    # 創建該路徑
    mkdir -p "$current_path"
done

echo "成功創建深度為 $depth 的資料夾結構。"