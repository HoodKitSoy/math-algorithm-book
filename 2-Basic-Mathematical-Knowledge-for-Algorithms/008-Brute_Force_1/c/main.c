#include <stdio.h>

int min(int a, int b) {
    return (a < b) ? a : b;
}

int max(int a, int b) {
    return (a > b) ? a : b;
}

int main() {
    // 1. 入力処理
    int n, s;
    scanf("%d %d", &n, &s);

    // 2. 最適化された計算
    int count = 0;
    for (int r = 1; r <= n; r++) {
        int max_b = min(n, s - r);
        count += max(0, max_b);
    }

    // 3. 出力処理
    printf("%d\n", count);

    return 0;
}