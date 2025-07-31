# 1. 個数の入力処理
n = int(input())

# 2. 配列の入力処理
a = list(map(int, input().split()))

# 3. 合計計算処理
sum_result = sum(a)

# 4. 剰余計算処理
result = sum_result % 100

# 5. 出力処理
print(result)
