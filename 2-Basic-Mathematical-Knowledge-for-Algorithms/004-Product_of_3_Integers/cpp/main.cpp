#include <iostream>

int main() {
    // 1. 入力処理
    int a1, a2, a3;
    std::cin >> a1 >> a2 >> a3;

    // 2. 積計算処理
    int product = a1 * a2 * a3;

    // 3. 出力処理
    std::cout << product << std::endl;

    return 0;
}