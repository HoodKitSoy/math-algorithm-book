#include <stdio.h>

int main() {
    // 1. 入力処理
    int a1, a2, a3;
    scanf("%d %d %d", &a1, &a2, &a3);

    // 2. 計算処理
    int sum = a1 + a2 + a3;
    
    // 3. 出力処理
    printf("%d\n", sum);

    return 0;
}