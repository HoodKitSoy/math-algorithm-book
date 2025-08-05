#include <stdio.h>

int main() {
    // 1. 入力処理
    int n;
    scanf("%d", &n);

    // 2. 階乗計算
    long long result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }

    // 3. 出力処理
    printf("%lld\n", result);

    return 0;
}