# 1. 入力処理
n = int(input())

# 2. 階乗計算
result = 1
for i in range(1, n + 1):
    result *= i

# 3. 出力処理
print(result)