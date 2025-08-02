#include <iostream>
#include <algorithm>

int main() {
    // 1. 入力処理
    int n, s;
    std::cin >> n >> s;

    // 2. 最適化された計算
    int count = 0;
    for (int r = 1; r <= n; r++) {
        int max_b = std::min(n, s - r);
        count += std::max(0, max_b);
    }

    // 3. 出力処理
    std::cout << count << std::endl;

    return 0;
}