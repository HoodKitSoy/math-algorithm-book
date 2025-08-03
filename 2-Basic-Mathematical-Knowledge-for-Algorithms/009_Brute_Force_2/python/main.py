import sys

sys.setrecursionlimit(100000)  # 再帰制限を増やす

n = 0
s = 0
a = []
possible1 = []
found = False


# 前半部分の和を列挙し、possible1配列に記録
def generate1(idx, end_idx, current_sum):
    global found
    if current_sum > s:  # 枝刈り
        return
    if idx == end_idx:
        possible1[current_sum] = True
        return
    generate1(idx + 1, end_idx, current_sum)  # a[idx] を選ばない
    generate1(idx + 1, end_idx, current_sum + a[idx])  # a[idx] を選ぶ


# 後半部分の和を列挙し、答えを探索
def find_solution(idx, end_idx, current_sum):
    global found
    if found:  # 既に発見済みなら即終了
        return
    if current_sum > s:  # 枝刈り
        return
    if idx == end_idx:
        need = s - current_sum
        if 0 <= need <= s and possible1[need]:
            found = True
        return
    find_solution(idx + 1, end_idx, current_sum)  # a[idx] を選ばない
    find_solution(idx + 1, end_idx, current_sum + a[idx])  # a[idx] を選ぶ


# 1. 入力処理
n, s = map(int, input().split())
a = list(map(int, input().split()))

possible1 = [False] * (s + 1)

# 2. 前半と後半に分けて処理
half1_end = n // 2

generate1(0, half1_end, 0)
find_solution(half1_end, n, 0)

# 3. 結果出力
if found:
    print("Yes")
else:
    print("No")
