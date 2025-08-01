# 007 - Number of Multiples 1

## 問題文

$N$ 以下の正の整数の中で、$X$ の倍数または $Y$ の倍数であるものの個数はいくつありますか？

### 制約

- $1 \leq N \leq 10^6$
- $1 \leq X < Y \leq 10^6$
- 入力はすべて整数

### 入力

入力は以下の形式で標準入力から与えられます。

```
N X Y
```

### 出力

答えを出力してください。

### 入力例 1

```
15 3 5
```

### 出力例 1

```
7
```

15以下の正の整数の中で3または5の倍数であるものは 3, 5, 6, 9, 10, 12, 15 の7個であるため、7と出力すれば正解です。

### 入力例 2

```
1000000 11 13
```

### 出力例 2

```
160839
```

-----

## 解説

この問題は、**包除原理（Inclusion-Exclusion Principle）**を用いて効率的に解くことができる数学的な問題です。単純に1から$N$まで全ての数をチェックする方法では、$N$が最大$10^6$の場合に時間がかかりすぎる可能性があります。

### 包除原理による解法

$N$ 以下の正の整数の中で、「$X$ の倍数または $Y$ の倍数」の個数を求めるには：

$$|A \cup B| = |A| + |B| - |A \cap B|$$

ここで：
- $A$：$X$ の倍数の集合
- $B$：$Y$ の倍数の集合
- $A \cap B$：$X$ と $Y$ の両方の倍数の集合（つまり $\text{lcm}(X, Y)$ の倍数）

### 各集合の要素数の計算

1. **$X$ の倍数の個数**：$\lfloor N / X \rfloor$
2. **$Y$ の倍数の個数**：$\lfloor N / Y \rfloor$
3. **$X$ と $Y$ の両方の倍数の個数**：$\lfloor N / \text{lcm}(X, Y) \rfloor$

### 最小公倍数（LCM）の計算

$\text{lcm}(X, Y) = \frac{X \times Y}{\gcd(X, Y)}$

ここで $\gcd(X, Y)$ は $X$ と $Y$ の最大公約数です。

### アルゴリズムの手順

1. **入力処理**：$N$, $X$, $Y$ を読み込む
2. **GCD計算**：ユークリッドの互除法で $\gcd(X, Y)$ を求める
3. **LCM計算**：$\text{lcm}(X, Y) = \frac{X \times Y}{\gcd(X, Y)}$ を計算
4. **包除原理適用**：$\lfloor N / X \rfloor + \lfloor N / Y \rfloor - \lfloor N / \text{lcm}(X, Y) \rfloor$ を計算
5. **結果出力**

-----

## 各言語の実装詳細

### C言語

```c
#include <stdio.h>

// ユークリッドの互除法でGCDを計算
long long gcd(long long a, long long b) {
    while (b != 0) {
        long long temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

// LCMを計算
long long lcm(long long a, long long b) {
    return (a / gcd(a, b)) * b;  // オーバーフロー対策
}

int main() {
    // 1. 入力処理
    long long n, x, y;
    scanf("%lld %lld %lld", &n, &x, &y);

    // 2. LCM計算
    long long lcm_xy = lcm(x, y);

    // 3. 包除原理適用
    long long count_x = n / x;           // Xの倍数の個数
    long long count_y = n / y;           // Yの倍数の個数
    long long count_both = n / lcm_xy;   // 両方の倍数の個数

    long long result = count_x + count_y - count_both;

    // 4. 出力処理
    printf("%lld\n", result);

    return 0;
}
```

**解説:**

- `long long`型を使用して大きな数値に対応します。
- LCM計算時に `(a / gcd(a, b)) * b` の順序でオーバーフローを防いでいます。
- 整数除算 `/` により自動的に床関数（floor）が適用されます。

### C++

```cpp
#include <iostream>
#include <algorithm>

long long gcd(long long a, long long b) {
    while (b != 0) {
        long long temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

long long lcm(long long a, long long b) {
    return (a / gcd(a, b)) * b;
}

int main() {
    // 1. 入力処理
    long long n, x, y;
    std::cin >> n >> x >> y;

    // 2. LCM計算
    long long lcm_xy = lcm(x, y);

    // 3. 包除原理適用
    long long result = n / x + n / y - n / lcm_xy;

    // 4. 出力処理
    std::cout << result << std::endl;

    return 0;
}
```

**解説:**

- C++14以降では `std::gcd` も使用可能ですが、自前実装で確実性を保ちます。
- より簡潔な計算式で同じ結果を得られます。

### C#

```csharp
using System;

class Program {
    static long GCD(long a, long b) {
        while (b != 0) {
            long temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    static long LCM(long a, long b) {
        return (a / GCD(a, b)) * b;
    }

    static void Main() {
        // 1. 入力処理
        string[] input = Console.ReadLine().Split(' ');
        long n = long.Parse(input[0]);
        long x = long.Parse(input[1]);
        long y = long.Parse(input[2]);

        // 2. LCM計算
        long lcmXY = LCM(x, y);

        // 3. 包除原理適用
        long result = n / x + n / y - n / lcmXY;

        // 4. 出力処理
        Console.WriteLine(result);
    }
}
```

**解説:**

- `long`型（64bit整数）を使用しています。
- 静的メソッドとしてGCDとLCMを実装しています。

### Java

```java
import java.util.Scanner;

public class Main {
    static long gcd(long a, long b) {
        while (b != 0) {
            long temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    static long lcm(long a, long b) {
        return (a / gcd(a, b)) * b;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        long n = sc.nextLong();
        long x = sc.nextLong();
        long y = sc.nextLong();

        // 2. LCM計算
        long lcmXY = lcm(x, y);

        // 3. 包除原理適用
        long result = n / x + n / y - n / lcmXY;

        // 4. 出力処理
        System.out.println(result);
        
        sc.close();
    }
}
```

**解説:**

- Javaでは`long`型で64bit整数を扱います。
- 静的メソッドを使ってGCDとLCMを実装しています。

### Rust

```rust
use std::io;

fn gcd(mut a: u64, mut b: u64) -> u64 {
    while b != 0 {
        let temp = b;
        b = a % b;
        a = temp;
    }
    a
}

fn lcm(a: u64, b: u64) -> u64 {
    (a / gcd(a, b)) * b
}

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let numbers: Vec<u64> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    
    let n = numbers[0];
    let x = numbers[1];
    let y = numbers[2];

    // 2. LCM計算
    let lcm_xy = lcm(x, y);

    // 3. 包除原理適用
    let result = n / x + n / y - n / lcm_xy;

    // 4. 出力処理
    println!("{}", result);
}
```

**解説:**

- `u64`型（符号なし64bit整数）を使用しています。
- 関数型プログラミングのスタイルで入力を処理しています。

### Go

```go
package main

import "fmt"

func gcd(a, b int64) int64 {
    for b != 0 {
        a, b = b, a%b
    }
    return a
}

func lcm(a, b int64) int64 {
    return (a / gcd(a, b)) * b
}

func main() {
    // 1. 入力処理
    var n, x, y int64
    fmt.Scan(&n, &x, &y)

    // 2. LCM計算
    lcmXY := lcm(x, y)

    // 3. 包除原理適用
    result := n/x + n/y - n/lcmXY

    // 4. 出力処理
    fmt.Println(result)
}
```

**解説:**

- Goの多重代入を使ってGCDを簡潔に実装しています。
- `int64`型で64bit整数を扱います。

### Python

```python
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
```

**解説:**

- Pythonの`math.gcd()`を使用してGCDを計算します。
- `//`演算子で整数除算を行います。
- 非常に簡潔なコードで実装できます。

### JavaScript (Node.js)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function gcd(a, b) {
    while (b !== 0) {
        let temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

function lcm(a, b) {
    return Math.floor((a / gcd(a, b)) * b);
}

rl.on('line', (line) => {
    // 1. 入力処理
    const [n, x, y] = line.trim().split(' ').map(Number);

    // 2. LCM計算
    const lcmXY = lcm(x, y);

    // 3. 包除原理適用
    const result = Math.floor(n / x) + Math.floor(n / y) - Math.floor(n / lcmXY);

    // 4. 出力処理
    console.log(result);
    
    rl.close();
});
```

**解説:**

- JavaScriptでは明示的に`Math.floor()`を使って床関数を適用します。
- 大きな整数の計算では精度に注意が必要です。

### TypeScript

```typescript
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function gcd(a: number, b: number): number {
    while (b !== 0) {
        const temp: number = b;
        b = a % b;
        a = temp;
    }
    return a;
}

function lcm(a: number, b: number): number {
    return Math.floor((a / gcd(a, b)) * b);
}

rl.on('line', (line: string) => {
    // 1. 入力処理
    const [n, x, y]: number[] = line.trim().split(' ').map(Number);

    // 2. LCM計算
    const lcmXY: number = lcm(x, y);

    // 3. 包除原理適用
    const result: number = Math.floor(n / x) + Math.floor(n / y) - Math.floor(n / lcmXY);

    // 4. 出力処理
    console.log(result);
    
    rl.close();
});
```

**解説:**

- 型注釈により型安全性を確保しています。
- JavaScriptと同様の処理ですが、コンパイル時に型チェックが行われます。

-----

## 数学的背景

### 包除原理の理解

包除原理は集合論の基本的な定理で、複数の集合の和集合の要素数を求める際に使用されます。

**2つの集合の場合：**
$$|A \cup B| = |A| + |B| - |A \cap B|$$

**3つの集合の場合：**
$$|A \cup B \cup C| = |A| + |B| + |C| - |A \cap B| - |B \cap C| - |C \cap A| + |A \cap B \cap C|$$

### 倍数の個数計算

$N$ 以下の正の整数で $X$ の倍数の個数は $\lfloor N / X \rfloor$ です。

例：15以下で3の倍数
- 3, 6, 9, 12, 15 → 5個
- $\lfloor 15 / 3 \rfloor = 5$

### 最大公約数と最小公倍数

- **GCD（最大公約数）**：2つの数の共通する約数の最大値
- **LCM（最小公倍数）**：2つの数の共通する倍数の最小値
- **関係式**：$\gcd(a, b) \times \text{lcm}(a, b) = a \times b$

-----

## 計算量の分析

### 時間計算量

- **ユークリッドの互除法**：$O(\log \min(X, Y))$
- **全体の計算**：$O(\log \min(X, Y))$

### 空間計算量

- **メモリ使用量**：$O(1)$（定数空間）

### 素朴な解法との比較

- **素朴な解法**：1から$N$まで全てチェック → $O(N)$
- **包除原理**：数学的計算のみ → $O(\log \min(X, Y))$

$N = 10^6$ の場合、素朴な解法では100万回の処理が必要ですが、包除原理では数回の計算で済みます。

-----

## 学習のポイント

この問題を通して学べる重要な概念は以下の通りです。

1. **包除原理**: 集合の和集合を効率的に計算する数学的手法
2. **最大公約数・最小公倍数**: 数論の基本概念とその計算方法
3. **計算量の最適化**: 素朴な解法から効率的な解法への改善
4. **整数の性質**: 倍数と約数の関係性の理解
5. **オーバーフロー対策**: 大きな数値の計算における注意点

この問題は、単純に見えますが数学的な洞察が必要で、アルゴリズムの効率性を考える良い例となります。包除原理は他の多くの問題でも応用される重要な概念です。