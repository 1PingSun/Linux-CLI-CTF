# Linux-CLI-CTF

## Linux Target Machine
1. Clone the repo
    ```sh
    git clone https://github.com/1PingSun/Linux-CLI-CTF.git
    ```

2. Build Docker
    * If your computer is x86_64:
        ```sh
        docker build -t my-ssh-enabled-ubuntu .
        ```
    * If your computer is Apple Silicon
        ```sh
        docker build --platform linux/amd64 -t my-x86-app .
        ```

3. Run Docker
    * If your computer is x86_64:
        ```sh
        docker run -d -p 2222:22 my-ssh-enabled-ubuntu
        ```
    * If your computer is Apple Silicon
        ```sh
        docker run --platform linux/amd64 -d -p 2222:22 --name my-x86-app-container my-x86-app
        ```

4. Connect the target machine
    ```
    ssh stu{ID}@localhost -p 2222
    ```

## CTF Challenge

### Welcome
#### Message of the Challenge
```
請登入 SSH 主機並拿到旗子。

Flag 格式：`/P!ng\\{.*?\\}/`
```

#### Write-up
1. 連線靶機，即可得到 Flag：P!ng{welcome_to_the_ctf}

#### Flag
`P!ng{welcome_to_the_ctf}`

### Matryoshka Doll
#### Message of the Challenge
```
找到俄羅斯娃娃（Matryoshka Doll）裡的秘密

Flag 格式：`/P!ng\\{.*?\\}/`
```

#### Write-up
1. 使用 tab 鍵進入資料夾 `Mikhail` 的最深層，即可找到名為 `P!ng{Secret_In_Matryoshka_Doll}` 的檔案，此檔名即為 Flag。

#### Flag
`P!ng{Secret_In_Matryoshka_Doll}`

### The Ghost User
#### Message of the Challenge
```
請在 `/home` 中找到幽靈使用者。

Flag 格式：`/P!ng\\{.*?\\}/`
```

#### Write-up
1. 查看 `/home` 存在的資料夾。
    ```
    ls /home
    ```
2. 找到名為 `P!ng{you_found_the_ghost}` 的資料夾，即為 Flag。

#### Flag
`P!ng{you_found_the_ghost}`

### Where is the cat?
#### Message of the Challenge
```
貓咪很可愛！

Flag 格式：`/P!ng\\{.*?\\}/`
```

#### Write-up
1. 在家目錄使用 cat 將 `Iam_a_cat` 檔案的內容顯示出來，即可獲得 Flag。

#### Flag
`P!ng{meow_meow_meow}`

### Give Me Permission
#### Message of the Challenge
```
`run_me` 檔好像沒有執行去權限欸 🤔

Flag 格式：`/P!ng\\{.*?\\}/`
```

#### Write-up
1. 賦予檔案執行權
    ```
    chmod +x run_me
    ```
2. 執行檔案，即可獲得 Flag
    ```
    ./run_me
    ```

#### Flag
`P!ng{execution_success}`

### Yummy Dumplings
#### Message of the Challenge

#### Write-up
1. 建立名為 `dumpling` 的資料夾
    ```
    mkdir dumpling
    ```
2. 進入資料夾並建立名為 `pork` 的檔案
    ```
    cd dumpling
    touch pork
    ```
3. 執行 `make_dumplings` 即可獲得 Flag
    ```
    cd ～
    ./make_dumplings
    ```

#### Flag
`P!ng{Yuloong_is_better_then_Bafang_Yunji}`

### Thief
#### Message of the Challenge
```
請在垃圾堆（`trash`）中找到鑰匙（`SECRET_KEY`）後，將鑰匙拷貝並貼上至檔案 `key` 中，最後執行 `open_the_dorr` 確認鑰匙是否正確無誤。

Flag 格式：`/P!ng\\{.*?\\}/`
```

#### Write-up
1. 使用 vim 打開 `trash` 檔
    ```
    vim trash
    ```
2. 在命令模式查詢字串 `SECRET_KEY`
    1. 在普通模式輸入：`/SECRET_KEY`
    2. 按下 Enter 鍵查詢
3. 在普通模式輸入 `yy` 複製整行密碼
4. 儲存並退出 vim 編輯介面：`:wq`
5. 建立 `key` 檔
    ```
    vim key
    ```
6. 在普通模式按下 `p` 鍵貼上密碼
7. 儲存並退出 vim 編輯介面：`:wq`
8. 執行 `open_the_door` 即可得到 Flag
    ```
    ./open_the_door
    ```

#### Flag
`P!ng{password-1234qwer}`

### Find a Needle in The Haystack
#### Message of the Challenge
```
乾草裡找一根針？
請下載附檔壓縮檔後解壓縮並在茫茫目錄中找到副檔名為 `.flag` 的檔案，接著在該檔中尋找 flag。

Flag 格式：`/P!ng\\{.*?\\}/
```

#### Write-up
1. 使用 `wget <url> -O filename` 下載題目附件壓縮檔。
2. 解壓縮
    ```
    tar -xvf filename
    ```
3. 使用 find 找到副檔名為 `.flag` 的檔案
    ```
    find . -name "*.flag"
    ```
4. 使用 grep 尋找 Flag 特徵，即可得到 Flag
    ```
    grep "ng{" filename
    ```

#### Flag
`P!ng{never_find_me}`