#include <stdio.h>

int main() {
    // 1. 入力処理
    int a1, a2, a3;
    scanf("%d %d %d", &a1, &a2, &a3);

    // 2. 積計算処理
    int product = a1 * a2 * a3;
    
    // 3. 出力処理
    printf("%d\n", product);

    return 0;
}