# 008 - Brute Force 1

## 問題文

赤・青のカードが各1枚ずつあり、あなたはそれぞれのカードに1以上 $N$ 以下の整数を1つ書き込みます。
カードに書かれた整数の合計が $S$ 以下となる書き方は、いくつありますか？

### 制約

- $1 \leq N \leq 1000$
- $1 \leq S \leq 2000$
- 入力はすべて整数

### 入力

入力は以下の形式で標準入力から与えられます。

```
N S
```

### 出力

答えを出力してください。

### 入力例 1

```
3 4
```

### 出力例 1

```
6
```

合計が4以下となる書き込み方は、以下の6通りです。

- 赤のカードに1を書き込み、青のカードに1を書き込む（合計：2）
- 赤のカードに1を書き込み、青のカードに2を書き込む（合計：3）
- 赤のカードに1を書き込み、青のカードに3を書き込む（合計：4）
- 赤のカードに2を書き込み、青のカードに1を書き込む（合計：3）
- 赤のカードに2を書き込み、青のカードに2を書き込む（合計：4）
- 赤のカードに3を書き込み、青のカードに1を書き込む（合計：4）

### 入力例 2

```
869 120
```

### 出力例 2

```
7140
```

-----

## 解説

この問題は、**最適化された全探索**で効率的に解くことができます。単純な二重ループではなく、数学的な考察により計算量を削減したアプローチを用います。

### 問題の整理

赤のカードに書く数を $r$、青のカードに書く数を $b$ とすると、以下の条件を満たす $(r, b)$ のペアの個数を求める問題です：

- $1 \leq r \leq N$
- $1 \leq b \leq N$  
- $r + b \leq S$

### 最適なアルゴリズム

各 $r$ に対して、条件を満たす $b$ の個数を直接計算します。

**アルゴリズム：**
1. $r$ を $1$ から $N$ まで順番に試す
2. 各 $r$ に対して、$b$ の取りうる値の範囲を計算する
   - $b$ は $1$ 以上 $N$ 以下でなければならない
   - $r + b \leq S$ より $b \leq S - r$ でなければならない
   - したがって $b$ は $1$ 以上 $\min(N, S - r)$ 以下の範囲
3. この範囲が有効（下限 ≤ 上限）なら、その範囲内の整数の個数を加算
4. 全ての $r$ について合計する

**数式表現：**
$$\text{答え} = \sum_{r=1}^{N} \max(0, \min(N, S-r))$$

**時間計算量：** $O(N)$  
**空間計算量：** $O(1)$

このアプローチにより、$O(N^2)$ の二重ループを $O(N)$ の単一ループに最適化できます。

-----

## 各言語の実装詳細

### C言語

```c
#include <stdio.h>

int min(int a, int b) {
    return (a < b) ? a : b;
}

int max(int a, int b) {
    return (a > b) ? a : b;
}

int main() {
    // 1. 入力処理
    int n, s;
    scanf("%d %d", &n, &s);

    // 2. 最適化された計算
    int count = 0;
    for (int r = 1; r <= n; r++) {
        int max_b = min(n, s - r);
        count += max(0, max_b);
    }

    // 3. 出力処理
    printf("%d\n", count);

    return 0;
}
```

**解説:**

- `min()` と `max()` 関数を自前で実装しています。
- 各 $r$ に対して、有効な $b$ の個数を直接計算します。
- $\max(0, \text{max\_b})$ により、無効な範囲（負の個数）を0にしています。

### C++

```cpp
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
```

**解説:**

- `std::min()` と `std::max()` を使用しています。
- C++の標準ライブラリを活用した簡潔な実装です。

### C#

```csharp
using System;

class Program {
    static void Main() {
        // 1. 入力処理
        string[] input = Console.ReadLine().Split(' ');
        int n = int.Parse(input[0]);
        int s = int.Parse(input[1]);

        // 2. 最適化された計算
        int count = 0;
        for (int r = 1; r <= n; r++) {
            int maxB = Math.Min(n, s - r);
            count += Math.Max(0, maxB);
        }

        // 3. 出力処理
        Console.WriteLine(count);
    }
}
```

**解説:**

- `Math.Min()` と `Math.Max()` を使用しています。
- C#の標準的な入力処理と計算を組み合わせています。

### Java

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        int n = sc.nextInt();
        int s = sc.nextInt();

        // 2. 最適化された計算
        int count = 0;
        for (int r = 1; r <= n; r++) {
            int maxB = Math.min(n, s - r);
            count += Math.max(0, maxB);
        }

        // 3. 出力処理
        System.out.println(count);
        
        sc.close();
    }
}
```

**解説:**

- `Math.min()` と `Math.max()` を使って効率的に計算しています。
- 各 $r$ に対して有効な $b$ の範囲を直接計算します。

### Rust

```rust
use std::io;
use std::cmp;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let numbers: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    
    let n = numbers[0];
    let s = numbers[1];

    // 2. 最適化された計算
    let mut count = 0;
    for r in 1..=n {
        let max_b = cmp::min(n, s - r);
        count += cmp::max(0, max_b);
    }

    // 3. 出力処理
    println!("{}", count);
}
```

**解説:**

- `1..=n` の範囲記法を使用しています。
- `cmp::min()` と `cmp::max()` で最小値・最大値を計算しています。
- Rustの所有権システムに配慮した実装です。

### Go

```go
package main

import "fmt"

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}

func main() {
    // 1. 入力処理
    var n, s int
    fmt.Scan(&n, &s)

    // 2. 最適化された計算
    count := 0
    for r := 1; r <= n; r++ {
        maxB := min(n, s-r)
        count += max(0, maxB)
    }

    // 3. 出力処理
    fmt.Println(count)
}
```

**解説:**

- Goには組み込みの `min`, `max` 関数がないため、自前で実装しています。
- シンプルで読みやすい最適化されたアプローチを使用しています。

### Python

```python
# 1. 入力処理
n, s = map(int, input().split())

# 2. 最適化された計算
count = 0
for r in range(1, n + 1):
    max_b = min(n, s - r)
    count += max(0, max_b)

# 3. 出力処理
print(count)
```

**解説:**

- `range(1, n + 1)` で1から $n$ までの範囲を作成します。
- Pythonの組み込み関数 `min()` と `max()` を使用しています。
- 非常に簡潔なコードで実装できます。

### JavaScript (Node.js)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line) => {
    // 1. 入力処理
    const [n, s] = line.trim().split(' ').map(Number);

    // 2. 最適化された計算
    let count = 0;
    for (let r = 1; r <= n; r++) {
        const maxB = Math.min(n, s - r);
        count += Math.max(0, maxB);
    }

    // 3. 出力処理
    console.log(count);
    
    rl.close();
});
```

**解説:**

- `Math.min()` と `Math.max()` を使った最適化されたアプローチです。
- 分割代入を使って入力を処理しています。

### TypeScript

```typescript
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line: string) => {
    // 1. 入力処理
    const [n, s]: number[] = line.trim().split(' ').map(Number);

    // 2. 最適化された計算
    let count: number = 0;
    for (let r: number = 1; r <= n; r++) {
        const maxB: number = Math.min(n, s - r);
        count += Math.max(0, maxB);
    }

    // 3. 出力処理
    console.log(count);
    
    rl.close();
});
```

**解説:**

- 型注釈により型安全性を確保しています。
- `Math.min()` と `Math.max()` を使った最適化されたアプローチです。

-----

## アルゴリズムの詳細分析

### 核心的なアイデア

二重ループで全ての $(r, b)$ のペアを調べる代わりに、各 $r$ に対して**条件を満たす $b$ の個数を直接計算**します。

### 数学的考察

各 $r$ $(1 \leq r \leq N)$ に対して：

1. **$b$ の制約条件：**
   - $1 \leq b \leq N$（カードの値の範囲）
   - $b \leq S - r$（合計がS以下という条件）

2. **有効な $b$ の範囲：**
   - 下限：$1$
   - 上限：$\min(N, S - r)$

3. **有効な $b$ の個数：**
   - 上限が1以上なら：$\min(N, S - r)$ 個
   - 上限が1未満なら：$0$ 個
   - つまり：$\max(0, \min(N, S - r))$ 個

### 具体例での検証

**入力例1：** $N = 3, S = 4$

| $r$ | $S - r$ | $\min(N, S-r)$ | $\max(0, \min(N, S-r))$ |
|-----|---------|----------------|-------------------------|
| 1   | 3       | $\min(3, 3) = 3$ | $\max(0, 3) = 3$ |
| 2   | 2       | $\min(3, 2) = 2$ | $\max(0, 2) = 2$ |
| 3   | 1       | $\min(3, 1) = 1$ | $\max(0, 1) = 1$ |

合計：$3 + 2 + 1 = 6$ 個

-----

## 計算量の分析

### 時間計算量

- **ループ回数：** $N$ 回
- **各ループでの処理：** 定数時間 $O(1)$
- **全体：** $O(N)$

### 空間計算量

- **使用する変数：** 定数個
- **全体：** $O(1)$

### 制約による実行時間

- $N \leq 1000$ なので、最大1000回のループ
- 実行時間：約0.001秒程度（非常に高速）

-----

## 学習のポイント

この問題を通して学べる重要な概念は以下の通りです。

1. **計算量の最適化**: $O(N^2)$ から $O(N)$ への改善
2. **数学的思考**: 二重ループを数学的考察で単一ループに変換
3. **境界条件の処理**: $\max(0, \text{value})$ による無効値の排除
4. **全探索の効率化**: 単純な全探索から最適化された探索への発展
5. **問題の本質理解**: 条件を満たす組み合わせの数え上げ

この最適化されたアプローチは、より大きな制約の問題や、類似の組み合わせ問題にも応用できる重要な技法です。単純な全探索から一歩進んだ効率的な解法を学ぶ良い例となっています。