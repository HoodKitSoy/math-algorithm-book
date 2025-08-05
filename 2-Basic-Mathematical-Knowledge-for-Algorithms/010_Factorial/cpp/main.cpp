#include <iostream>

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(nullptr);
    
    // 1. 入力処理
    int n;
    std::cin >> n;

    // 2. 階乗計算
    long long result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }

    // 3. 出力処理
    std::cout << result << '\n';

    return 0;
}