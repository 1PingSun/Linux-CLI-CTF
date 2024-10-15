#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TARGET_STRING "G7!kL8v@3rT#sW2mY^9pQ5zX$1jH&4bN*6dF(0cV)7gB{8aJ}9lK[2xL]3mM|4nP<5oQ>6rS"
#define BUFFER_SIZE 4096

int main() {
    FILE *file;
    char buffer[BUFFER_SIZE];
    int found = 0;

    // 打開名為 "key" 的檔案
    file = fopen("key", "r");
    if (file == NULL) {
        perror("Where is the key?");
        return 1;
    }

    // 逐行讀取檔案內容並檢查是否包含目標字串
    while (fgets(buffer, BUFFER_SIZE, file) != NULL) {
        if (strstr(buffer, TARGET_STRING) != NULL) {
            found = 1;
            break;
        }
    }

    // 關閉檔案
    fclose(file);

    // 輸出結果
    if (found) {
        printf("Opened successfully\nThe flag is P!ng{password-1234qwer}\n");
    } else {
        printf("You can't open the door.\n");
    }

    return 0;
}