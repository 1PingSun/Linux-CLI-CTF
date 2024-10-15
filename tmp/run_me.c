#include <stdio.h>

int main() {
    // 定義字串作為字元陣列
    char flag[] = "P!ng{execution_success}";

    // 迴圈印出每個字元
    for (int i = 0; flag[i] != '\0'; i++) {
        printf("%c", flag[i]);
    }

    // 換行
    printf("\n");

    return 0;
}