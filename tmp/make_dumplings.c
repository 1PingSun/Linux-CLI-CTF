#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>

#define PATH_MAX_LEN 4096

int main() {
    char current_dir[PATH_MAX_LEN];
    if (getcwd(current_dir, sizeof(current_dir)) == NULL) {
        perror("getcwd() error");
        return 1;
    }

    // 檢查 current_dir 的長度，確保不會超出緩衝區大小
    size_t dir_len = strlen(current_dir);
    if (dir_len + strlen("/dumpling") >= PATH_MAX_LEN || dir_len + strlen("/dumpling/pork") >= PATH_MAX_LEN) {
        fprintf(stderr, "Path length exceeds buffer size\n");
        return 1;
    }

    char test1_path[PATH_MAX_LEN];
    snprintf(test1_path, sizeof(test1_path), "%s/dumpling", current_dir);

    char test2_path[PATH_MAX_LEN];
    snprintf(test2_path, sizeof(test2_path), "%s/dumpling/pork", current_dir);

    struct stat st;

    if (stat(test1_path, &st) == 0 && S_ISDIR(st.st_mode)) {
        if (stat(test2_path, &st) == 0 && S_ISREG(st.st_mode)) {
            printf("P!ng{Yuloong_is_better_then_Bafang_Yunji}\n");
        } else {
            printf("水餃內沒有豬肉餡\n");
        }
    } else {
        printf("沒有水餃\n");
    }

    return 0;
}