#include <stdio.h>

int main() {
    // 1.　個数の入力処理
    int n;
    scanf("%d", &n);

    // 2. 配列の入力処理
    int a[50]; // 制約からNは最大50
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }

    // 3. 合計計算処理
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += a[i];
    }

    // 4. 出力処理
    printf("%d\n", sum);

    return 0;
}