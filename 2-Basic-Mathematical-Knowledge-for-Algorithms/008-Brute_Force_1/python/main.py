# 1. 入力処理
n, s = map(int, input().split())

# 2. 最適化された計算
count = 0
for r in range(1, n + 1):
    max_b = min(n, s - r)
    count += max(0, max_b)

# 3. 出力処理
print(count)