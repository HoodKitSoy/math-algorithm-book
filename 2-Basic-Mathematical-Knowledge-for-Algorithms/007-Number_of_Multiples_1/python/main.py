import math

# 1. 入力処理
n, x, y = map(int, input().split())

# 2. LCM計算
def lcm(a, b):
    return (a * b) // math.gcd(a, b)

lcm_xy = lcm(x, y)

# 3. 包除原理適用
result = n // x + n // y - n // lcm_xy

# 4. 出力処理
print(result)