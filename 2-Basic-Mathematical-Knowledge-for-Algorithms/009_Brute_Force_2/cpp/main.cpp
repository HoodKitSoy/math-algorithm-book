#include <iostream>
#include <vector>

int n;
long long s;
std::vector<int> a;
std::vector<bool> possible1;
bool found = false;

// 前半部分の和を列挙し、possible1配列に記録
void generate1(int idx, int end_idx, long long current_sum) {
    if (current_sum > s) { // 枝刈り
        return;
    }
    if (idx == end_idx) {
        possible1[current_sum] = true;
        return;
    }
    generate1(idx + 1, end_idx, current_sum); // a[idx] を選ばない
    generate1(idx + 1, end_idx, current_sum + a[idx]); // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
void find_solution(int idx, int end_idx, long long current_sum) {
    if (found) return; // 既に発見済みなら即終了
    if (current_sum > s) { // 枝刈り
        return;
    }
    if (idx == end_idx) {
        long long need = s - current_sum;
        if (need >= 0 && need <= s && possible1[need]) {
            found = true;
        }
        return;
    }
    find_solution(idx + 1, end_idx, current_sum); // a[idx] を選ばない
    find_solution(idx + 1, end_idx, current_sum + a[idx]); // a[idx] を選ぶ
}

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(NULL);
    
    // 1. 入力処理
    std::cin >> n >> s;
    a.resize(n);
    for (int i = 0; i < n; ++i) {
        std::cin >> a[i];
    }
    
    possible1.resize(s + 1, false);
    
    // 2. 前半と後半に分けて処理
    int half1_end = n / 2;
    
    generate1(0, half1_end, 0);
    find_solution(half1_end, n, 0);
    
    // 3. 結果出力
    if (found) {
        std::cout << "Yes" << std::endl;
    } else {
        std::cout << "No" << std::endl;
    }
    
    return 0;
}