#include <stdio.h>

// ユークリッドの互除法でGCDを計算
long long gcd(long long a, long long b) {
    while (b != 0) {
        long long temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

// LCMを計算
long long lcm(long long a, long long b) {
    return (a / gcd(a, b)) * b;  // オーバーフロー対策
}

int main() {
    // 1. 入力処理
    long long n, x, y;
    scanf("%lld %lld %lld", &n, &x, &y);

    // 2. LCM計算
    long long lcm_xy = lcm(x, y);

    // 3. 包除原理適用
    long long count_x = n / x;           // Xの倍数の個数
    long long count_y = n / y;           // Yの倍数の個数
    long long count_both = n / lcm_xy;   // 両方の倍数の個数

    long long result = count_x + count_y - count_both;

    // 4. 出力処理
    printf("%lld\n", result);

    return 0;
}