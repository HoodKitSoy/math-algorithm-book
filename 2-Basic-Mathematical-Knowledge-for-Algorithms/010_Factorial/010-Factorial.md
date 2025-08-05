# 010 - Factorial

## 問題文

$N!$ の値を求めてください。

### 制約

- $1 \leq N \leq 20$
- $N$ は整数

### 入力

入力は以下の形式で標準入力から与えられます。

```
N
```

### 出力

答えを出力してください。

### 入力例 1

```
5
```

### 出力例 1

```
120
```

$5! = 5 \times 4 \times 3 \times 2 \times 1 = 120$ なので、120と出力すれば正解となります。

-----

## 解説

この問題は**階乗（Factorial）**の計算問題です。$N! = N \times (N-1) \times (N-2) \times \cdots \times 2 \times 1$ を計算します。

### 最適なアルゴリズム：単純ループ計算

最もシンプルで効率的な手法は、1から$N$まで順番に掛け算していく方法です。

**アルゴリズムの手順：**
1. 結果を格納する変数を1で初期化
2. 1から$N$まで順番に掛け算
3. 結果を出力

**計算量：**
- 時間：$O(N)$
- 空間：$O(1)$

$N \leq 20$ という制約では、このシンプルなアプローチで十分高速に処理できます。

-----

## 各言語の実装詳細

### C言語

```c
#include <stdio.h>

int main() {
    // 1. 入力処理
    int n;
    scanf("%d", &n);

    // 2. 階乗計算
    long long result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }

    // 3. 出力処理
    printf("%lld\n", result);

    return 0;
}
```

**解説:**

- `long long`型で20!まで安全に計算
- シンプルなforループで1からnまで乗算
- 効率的で理解しやすい実装

### C++

```cpp
#include <iostream>

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(nullptr);
    
    // 1. 入力処理
    int n;
    std::cin >> n;

    // 2. 階乗計算
    long long result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }

    // 3. 出力処理
    std::cout << result << '\n';

    return 0;
}
```

**解説:**

- 高速I/O設定で入出力を最適化
- `'\n'`使用でバッファフラッシュを回避
- C++の標準的な最適化を適用

### C#

```csharp
using System;

class Program {
    static void Main() {
        // 1. 入力処理
        int n = int.Parse(Console.ReadLine());

        // 2. 階乗計算
        long result = 1;
        for (int i = 1; i <= n; i++) {
            result *= i;
        }

        // 3. 出力処理
        Console.WriteLine(result);
    }
}
```

**解説:**

- `long`型（64bit整数）で20!まで対応
- C#の標準的なループ構文を使用
- 簡潔で読みやすい実装

### Java

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        int n = sc.nextInt();

        // 2. 階乗計算
        long result = 1;
        for (int i = 1; i <= n; i++) {
            result *= i;
        }

        // 3. 出力処理
        System.out.println(result);
        
        sc.close();
    }
}
```

**解説:**

- `long`型で20!まで安全に処理
- 標準的なScanner入力処理
- Javaの基本的なループ構文

### Rust

```rust
use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: u32 = input.trim().parse().expect("Please enter a number");

    // 2. 階乗計算
    let mut result: u64 = 1;
    for i in 1..=n {
        result *= i as u64;
    }

    // 3. 出力処理
    println!("{}", result);
}
```

**解説:**

- `u64`型（符号なし64bit整数）を使用
- `1..=n`の範囲記法でインクルーシブ範囲を指定
- 型安全性を保ちつつ効率的な実装

### Go

```go
package main

import "fmt"

func main() {
    // 1. 入力処理
    var n int
    fmt.Scan(&n)

    // 2. 階乗計算
    result := uint64(1)
    for i := 1; i <= n; i++ {
        result *= uint64(i)
    }

    // 3. 出力処理
    fmt.Println(result)
}
```

**解説:**

- `uint64`型で符号なし64bit整数を使用
- `:=`演算子による変数宣言と初期化
- Goの簡潔な文法を活用

### Python

```python
# 1. 入力処理
n = int(input())

# 2. 階乗計算
result = 1
for i in range(1, n + 1):
    result *= i

# 3. 出力処理
print(result)
```

**解説:**

- 任意精度整数により大きな値も安全に処理
- `range(1, n + 1)`で1からnまでの範囲を指定
- 非常に簡潔な実装

### JavaScript (Node.js)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line) => {
    // 1. 入力処理
    const n = parseInt(line.trim());

    // 2. 階乗計算
    let result = 1;
    for (let i = 1; i <= n; i++) {
        result *= i;
    }

    // 3. 出力処理
    console.log(result);
    
    rl.close();
});
```

**解説:**

- `Number`型で20!まで精度を保持
- 標準的なforループによる実装
- Node.jsの入力処理と組み合わせ

### TypeScript

```typescript
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line: string) => {
    // 1. 入力処理
    const n: number = parseInt(line.trim(), 10);

    // 2. 階乗計算
    let result: number = 1;
    for (let i: number = 1; i <= n; i++) {
        result *= i;
    }

    // 3. 出力処理
    console.log(result);
    
    rl.close();
});
```

**解説:**

- 型注釈による型安全性の確保
- `number`型で階乗値を計算
- TypeScriptの型システムを活用

-----

## アルゴリズムの詳細分析

### 核心的なアイデア

階乗の定義に従って、1から$N$まで順番に掛け算していく最も直接的なアプローチです。

### 計算量の分析

**時間計算量:**
- ループ回数: $N$ 回
- 各ループでの処理: $O(1)$（乗算）
- 全体: $O(N)$

**空間計算量:**
- 使用する変数: 定数個
- 全体: $O(1)$

### 数値の範囲確認

20! = 2,432,902,008,176,640,000

- 64bit符号付き整数の最大値: 9,223,372,036,854,775,807
- 20!は64bit整数で安全に表現可能
- 各言語で適切なデータ型を選択

-----

## 最適化のポイント

### 1. データ型の選択

各言語で最適なデータ型を選択：
- C/C++: `long long` (64bit符号付き)
- C#/Java: `long` (64bit符号付き)
- Rust: `u64` (64bit符号なし)
- Go: `uint64` (64bit符号なし)
- Python: `int` (任意精度)
- JavaScript/TypeScript: `number` (倍精度浮動小数点)

### 2. ループの効率化

- 1から始めるシンプルなforループ
- 条件判定を最小限に抑制
- 不要な関数呼び出しを避ける

### 3. 入出力の最適化

- C++: 高速I/O設定
- 他言語: 標準的な入出力手法

-----

## 代替アプローチの比較

### 再帰による実装

```cpp
long long factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}
```

**問題点:**
- 関数呼び出しのオーバーヘッド
- スタック使用量の増加
- 実行時間がループより遅い

### ライブラリ関数の使用

一部の言語では階乗を計算するライブラリが存在しますが：
- 追加のincludeが必要
- 制約が$N \leq 20$と小さいため、シンプルなループが最適

-----

## 学習のポイント

この問題を通して学べる重要な概念：

1. **基本的なループ処理**: 最も基本的なプログラミング構文の活用
2. **数値の範囲**: 階乗の急激な増加とデータ型の選択
3. **効率的な実装**: シンプルで分かりやすいコードの重要性
4. **制約の理解**: 問題の制約に応じた適切なアプローチの選択
5. **言語間の違い**: 各言語での基本的な構文と最適化

この問題は基本的なプログラミングスキルを確認する良い例であり、シンプルで効率的な実装の重要性を学ぶことができます。複雑な最適化よりも、理解しやすく確実に動作するコードを書くことの価値を示しています。