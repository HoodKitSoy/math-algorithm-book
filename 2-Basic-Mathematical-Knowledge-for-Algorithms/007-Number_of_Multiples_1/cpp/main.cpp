#include <iostream>
#include <algorithm>

long long gcd(long long a, long long b) {
    while (b != 0) {
        long long temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

long long lcm(long long a, long long b) {
    return (a / gcd(a, b)) * b;
}

int main() {
    // 1. 入力処理
    long long n, x, y;
    std::cin >> n >> x >> y;

    // 2. LCM計算
    long long lcm_xy = lcm(x, y);

    // 3. 包除原理適用
    long long result = n / x + n / y - n / lcm_xy;

    // 4. 出力処理
    std::cout << result << std::endl;

    return 0;
}