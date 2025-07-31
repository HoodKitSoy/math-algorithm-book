#include <iostream>
#include <vector>

int main() {
    // 1. 個数の入力処理
    int n;
    std::cin >> n;

    // 2. 配列の入力処理
    std::vector<int> a(n);
    for (int i = 0; i < n; i++) {
        std::cin >> a[i];
    }

    // 3. 合計計算処理
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += a[i];
    }

    // 4. 剰余計算処理
    int result = sum % 100;

    // 5. 出力処理
    std::cout << result << std::endl;

    return 0;
}