# 006 - Print 2N+3

## 問題文

整数 $N$ が与えられます。$2N + 3$ の値を出力してください。

### 制約

- $1 \leq N \leq 100$
- $N$ は整数

### 入力

入力は以下の形式で標準入力から与えられます。

```
N
```

### 出力

$2N + 3$ の値を出力してください。

### 入力例 1

```
100
```

### 出力例 1

```
203
```

$N = 100$ のとき $2N + 3 = 2 \times 100 + 3 = 203$ です。

### 入力例 2

```
27
```

### 出力例 2

```
57
```

$N = 27$ のとき $2N + 3 = 2 \times 27 + 3 = 57$ です。

-----

## 解説

この問題は、**一次式の計算**を扱う基本的な数学問題です。与えられた整数 $N$ に対して、線形変換 $f(N) = 2N + 3$ を適用した結果を出力します。

このような問題は、**数式の実装**と**演算子の優先順位**の理解を確認するものです。数学の式をそのままプログラムコードに変換する能力が重要になります。

実装は以下の手順で行います。

1. **入力処理**
   - 標準入力から1行のデータを受け取ります。
   - 受け取った文字列を**整数型**の変数に変換して保存します。

2. **計算処理**
   - $2N + 3$ の計算を行います。
   - 演算子の優先順位に従い、掛け算が先に実行され、その後足し算が実行されます。
   - 計算結果を変数に保存します。

3. **出力処理**
   - 計算結果を標準出力に書き出します。

-----

## 各言語の実装詳細

以下では、C、C++、C#、Java、Rust、GO、Python、JavaScript、TypeScript の各実装について、実際のコードとともに詳しく解説します。

### C言語

```c
#include <stdio.h>

int main() {
    // 1. 入力処理
    int n;
    scanf("%d", &n);

    // 2. 計算処理
    int result = 2 * n + 3;
    
    // 3. 出力処理
    printf("%d\n", result);

    return 0;
}
```

**解説:**

- `scanf("%d", &n)`: 標準入力から整数を読み込みます。
- `2 * n + 3`: 演算子の優先順位により、まず `2 * n` が計算され、その結果に `3` が加算されます。
- 制約から最大値は $2 \times 100 + 3 = 203$ なので、`int`型で十分です。

### C++

```cpp
#include <iostream>

int main() {
    // 1. 入力処理
    int n;
    std::cin >> n;

    // 2. 計算処理
    int result = 2 * n + 3;

    // 3. 出力処理
    std::cout << result << std::endl;

    return 0;
}
```

**解説:**

- `std::cin >> n`: C++のストリーム演算子を使って整数を読み込みます。
- C言語と同様の計算処理ですが、C++の標準ライブラリを使用しています。
- `std::endl`で改行を出力します。

### C#

```csharp
using System;

class Program {
    static void Main() {
        // 1. 入力処理
        int n = int.Parse(Console.ReadLine());

        // 2. 計算処理
        int result = 2 * n + 3;

        // 3. 出力処理
        Console.WriteLine(result);
    }
}
```

**解説:**

- `int.Parse(Console.ReadLine())`: 入力行を読み込んで整数に変換します。
- C#でも演算子の優先順位は同じで、掛け算が足し算より先に実行されます。
- `Console.WriteLine()`で結果を出力します。

### Java

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        int n = sc.nextInt();

        // 2. 計算処理
        int result = 2 * n + 3;

        // 3. 出力処理
        System.out.println(result);
        
        sc.close();
    }
}
```

**解説:**

- `sc.nextInt()`: Scannerを使って整数を読み込みます。
- 数式の計算は他の言語と同じです。
- `System.out.println()`で結果を出力します。

### Rust

```rust
use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: i32 = input.trim().parse().expect("Please enter a number");

    // 2. 計算処理
    let result = 2 * n + 3;

    // 3. 出力処理
    println!("{}", result);
}
```

**解説:**

- 入力を文字列として読み込んでから、`parse()`で整数に変換します。
- `let result = 2 * n + 3`: Rustでも演算子の優先順位は同じです。
- `println!`マクロで結果を出力します。

### Go

```go
package main

import "fmt"

func main() {
    // 1. 入力処理
    var n int
    fmt.Scan(&n)

    // 2. 計算処理
    result := 2*n + 3

    // 3. 出力処理
    fmt.Println(result)
}
```

**解説:**

- `fmt.Scan(&n)`: 標準入力から整数を読み込みます。
- `:=`演算子を使って変数宣言と初期化を同時に行います。
- 数式の計算は他の言語と同じです。

### Python

```python
# 1. 入力処理
n = int(input())

# 2. 計算処理
result = 2 * n + 3

# 3. 出力処理
print(result)
```

**解説:**

- `int(input())`: 入力を読み込んで整数に変換します。
- Pythonでも演算子の優先順位は数学と同じです。
- 非常に簡潔なコードで処理を実現しています。

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

    // 2. 計算処理
    const result = 2 * n + 3;

    // 3. 出力処理
    console.log(result);
    
    rl.close();
});
```

**解説:**

- `parseInt(line.trim())`: 入力行を整数に変換します。
- JavaScriptでも演算子の優先順位は同じです。
- Node.jsの`readline`モジュールを使った入力処理です。

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

    // 2. 計算処理
    const result: number = 2 * n + 3;

    // 3. 出力処理
    console.log(result);
    
    rl.close();
});
```

**解説:**

- JavaScriptのコードに型注釈を追加したバージョンです。
- `number`型注釈により、数値であることを保証します。
- 型安全性を高めることで、計算ミスを防ぐことができます。

-----

## 数学的概念の理解

### 1. 一次式（線形式）
$2N + 3$ は $N$ に関する一次式です。一般形は $aN + b$（$a$, $b$ は定数）で表されます。

- 係数：$a = 2$（$N$ にかかる係数）
- 定数項：$b = 3$（$N$ に依存しない項）
- この式は $N$ の値に対して線形に変化します

### 2. 演算子の優先順位
プログラミング言語では、数学と同様に演算子の優先順位があります：

1. **乗除算**（`*`, `/`, `%`）が最優先
2. **加減算**（`+`, `-`）が次の優先度

したがって `2 * n + 3` は `(2 * n) + 3` と同じ意味になります。

### 3. 関数としての理解
$f(N) = 2N + 3$ と考えることができます：

- $f(1) = 2 \times 1 + 3 = 5$
- $f(27) = 2 \times 27 + 3 = 57$
- $f(100) = 2 \times 100 + 3 = 203$

-----

## 応用例と発展

### 1. より複雑な一次式
- $3N - 5$
- $-2N + 10$
- $N/2 + 7$（ただし整数除算に注意）

### 2. 実世界での応用
- 料金計算：基本料金 + 使用量に比例する料金
- 座標変換：スケーリングとオフセット
- 温度変換：摂氏と華氏の変換式

### 3. プログラミングでの活用
- 配列のインデックス変換
- メモリアドレスの計算
- アルゴリズムでの値の正規化

-----

## 学習のポイント

この問題を通して学べる重要なプログラミング概念は以下の通りです。

1. **数式の実装**: 数学的な式をプログラムコードに正確に変換する能力
2. **演算子の優先順位**: プログラミング言語における演算の順序の理解
3. **一次式の理解**: 線形変換の概念とその応用
4. **基本的なI/O処理**: 単一の値の入力と出力の処理

この問題は非常にシンプルですが、数学とプログラミングの橋渡しとなる重要な概念を含んでいます。より複雑な数式を扱う問題や、数学的なアルゴリズムを実装する際の基礎となります。