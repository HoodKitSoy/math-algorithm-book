# 003 - Sum of N Integers

## 問題文

整数 $N$ と $N$ 個の整数 $A_1, A_2, \cdots, A_N$ が与えられます。
$A_1 + A_2 + \cdots + A_N$ を出力するプログラムを作成してください。

### 制約

  - $1 \leq N \leq 50$
  - $1 \leq A_i \leq 100$ $(1 \leq i \leq N)$
  - 入力はすべて整数

### 入力

入力は以下の形式で標準入力から与えられます。

```
N
A1 A2 A3 ⋯ AN
```

### 出力

$A_1, A_2, \cdots, A_N$ の合計値を出力してください。

### 入力例 1

```
5
3 1 4 1 5
```

### 出力例 1

```
14
```

$3 + 1 + 4 + 1 + 5 = 14$ なので、14 と出力すれば正解となります。

### 入力例 2

```
3
10 20 50
```

### 出力例 2

```
80
```

$10 + 20 + 50 = 80$ なので、80 と出力すれば正解となります。

### 入力例 3

```
10
1 2 3 4 5 6 7 8 9 10
```

### 出力例 3

```
55
```

$1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55$ なので、55 と出力すれば正解となります。

-----

## 解説

この問題は、前回の「002 - Sum of 3 Integers」を発展させた問題で、**動的な個数の入力処理**と**繰り返し処理**を組み合わせた基本的なプログラミング技法を確認するものです。今回は、あらかじめ決まった3個ではなく、最初に与えられる整数 $N$ によって決まる $N$ 個の値を処理します。

実装は以下の手順で行います。

1.  **個数の入力処理**

      - まず、標準入力から1行目のデータを受け取ります。これが整数の個数 $N$ です。
      - 受け取った文字列を**整数型**の変数に変換して保存します。

2.  **配列の入力処理**

      - 次に、標準入力から2行目のデータを受け取ります。この行には $N$ 個の整数がスペースで区切られて含まれています。
      - 受け取った文字列をスペースで分割し、それぞれを**整数型**に変換して配列やリストに保存します。

3.  **合計計算処理**

      - 配列に保存された $N$ 個の整数を順番に足し算していきます。この処理には**ループ処理**を使用します。
      - 計算結果を変数に保存します。

4.  **出力処理**

      - 最後に、計算結果を保存した変数の値を標準出力に書き出します。

-----

## 各言語の実装詳細

以下では、C、C++、C#、Java、Rust、GO、Python、JavaScript、TypeScript の各実装について、実際のコードとともに詳しく解説します。

### C言語

```c
#include <stdio.h>

int main() {
    // 1. 個数の入力処理
    int n;
    scanf("%d", &n);

    // 2. 配列の入力処理
    int a[50]; // 制約からNは最大50
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }

    // 3. 合計計算処理
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += a[i];
    }
    
    // 4. 出力処理
    printf("%d\n", sum);

    return 0;
}
```

**解説:**

  - `scanf("%d", &n)`: 最初に整数の個数 $N$ を読み込みます。
  - `int a[50]`: 制約で $N \leq 50$ なので、最大50個の整数を格納できる配列を宣言します。
  - 最初のforループで $N$ 個の整数を順番に配列に読み込みます。
  - 2番目のforループで配列の全要素を順番に足し算して合計を計算します。

### C++

```cpp
#include <iostream>
#include <vector>

int main() {
    // 1. 個数の入力処理
    int n;
    std::cin >> n;

    // 2. 配列の入力処理
    std::vector<int> a(n);
    for (int i = 0; i < n; i++) {
        std::cin >> a[i];
    }

    // 3. 合計計算処理
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += a[i];
    }

    // 4. 出力処理
    std::cout << sum << std::endl;

    return 0;
}
```

**解説:**

  - `std::vector<int> a(n)`: 動的配列vectorを使用し、サイズ $N$ で初期化します。
  - C言語と同様のループ処理で入力と計算を行います。
  - vectorを使うことで、配列サイズを動的に決められるため、より柔軟なコードになります。

### C#

```csharp
using System;
using System.Linq;

class Program {
    static void Main() {
        // 1. 個数の入力処理
        int n = int.Parse(Console.ReadLine());

        // 2. 配列の入力処理
        int[] a = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();

        // 3. 合計計算処理
        int sum = a.Sum();

        // 4. 出力処理
        Console.WriteLine(sum);
    }
}
```

**解説:**

  - `int.Parse(Console.ReadLine())`: 1行目から整数 $N$ を読み込みます。
  - `Console.ReadLine().Split(' ').Select(int.Parse).ToArray()`: 2行目をスペースで分割し、各要素を整数に変換して配列にします。
  - `a.Sum()`: LINQの機能を使って配列の合計を計算します。これにより、ループを書く必要がありません。

### Java

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 個数の入力処理
        int n = sc.nextInt();

        // 2. 配列の入力処理
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        // 3. 合計計算処理
        int sum = 0;
        for (int i = 0; i < n; i++) {
            sum += a[i];
        }

        // 4. 出力処理
        System.out.println(sum);
        
        sc.close();
    }
}
```

**解説:**

  - `sc.nextInt()`: Scannerを使って整数を順番に読み込みます。最初に $N$ を、次にループで $N$ 個の整数を読み込みます。
  - `int[] a = new int[n]`: サイズ $N$ の配列を動的に作成します。
  - forループを使って合計を計算します。

### Rust

```rust
use std::io;

fn main() {
    // 1. 個数の入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: usize = input.trim().parse().expect("Please enter a number");

    // 2. 配列の入力処理
    input.clear();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let a: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();

    // 3. 合計計算処理
    let sum: i32 = a.iter().sum();

    // 4. 出力処理
    println!("{}", sum);
}
```

**解説:**

  - 最初に $N$ を読み込み、`usize`型（配列のインデックスに使用）に変換します。
  - `input.clear()`: 文字列バッファをクリアして次の入力に備えます。
  - `Vec<i32>`を使って動的配列を作成し、2行目の整数を格納します。
  - `a.iter().sum()`: イテレータの`sum()`メソッドを使って合計を計算します。

### Go

```go
package main

import "fmt"

func main() {
    // 1. 個数の入力処理
    var n int
    fmt.Scan(&n)

    // 2. 配列の入力処理
    a := make([]int, n)
    for i := 0; i < n; i++ {
        fmt.Scan(&a[i])
    }

    // 3. 合計計算処理
    sum := 0
    for i := 0; i < n; i++ {
        sum += a[i]
    }

    // 4. 出力処理
    fmt.Println(sum)
}
```

**解説:**

  - `make([]int, n)`: サイズ $N$ のスライスを作成します。
  - `fmt.Scan()`を使って整数を順番に読み込みます。Goは自動的にスペースや改行を区切り文字として扱います。
  - forループで合計を計算します。

### Python

```python
# 1. 個数の入力処理
n = int(input())

# 2. 配列の入力処理
a = list(map(int, input().split()))

# 3. 合計計算処理
sum_result = sum(a)

# 4. 出力処理
print(sum_result)
```

**解説:**

  - `int(input())`: 1行目から整数 $N$ を読み込みます。
  - `list(map(int, input().split()))`: 2行目をスペースで分割し、各要素を整数に変換してリストにします。
  - `sum(a)`: Pythonの組み込み関数`sum()`を使ってリストの合計を計算します。

### JavaScript (Node.js)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lineCount = 0;
let n = 0;

rl.on('line', (line) => {
    if (lineCount === 0) {
        // 1. 個数の入力処理
        n = parseInt(line.trim());
        lineCount++;
    } else {
        // 2. 配列の入力処理
        const a = line.trim().split(' ').map(Number);

        // 3. 合計計算処理
        const sum = a.reduce((acc, num) => acc + num, 0);

        // 4. 出力処理
        console.log(sum);
        
        rl.close();
    }
});
```

**解説:**

  - `lineCount`を使って1行目と2行目を区別します。
  - 1行目で $N$ を読み込み、2行目で配列を読み込みます。
  - `reduce()`メソッドを使って配列の合計を計算します。初期値を0として、各要素を順番に足していきます。

### TypeScript

```typescript
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lineCount: number = 0;
let n: number = 0;

rl.on('line', (line: string) => {
    if (lineCount === 0) {
        // 1. 個数の入力処理
        n = parseInt(line.trim(), 10);
        lineCount++;
    } else {
        // 2. 配列の入力処理
        const a: number[] = line.trim().split(' ').map(s => parseInt(s, 10));

        // 3. 合計計算処理
        const sum: number = a.reduce((acc: number, num: number) => acc + num, 0);

        // 4. 出力処理
        console.log(sum);
        
        rl.close();
    }
});
```

**解説:**

  - JavaScriptとほぼ同じ処理ですが、型注釈によって型安全性を高めています。
  - `lineCount: number`, `n: number`, `a: number[]`など、各変数に適切な型を指定しています。
  - `reduce()`の引数にも型注釈を付けています。

-----

## 学習のポイント

この問題を通して学べる重要なプログラミング概念は以下の通りです。

1. **動的配列の扱い**: 実行時に決まるサイズの配列を適切に処理する方法
2. **ループ処理**: 繰り返し処理を使った効率的なデータ処理
3. **入力の段階的処理**: 複数行にわたる入力を順序立てて処理する技法
4. **集約処理**: 複数のデータを1つの値にまとめる処理（今回は合計）

これらの概念は、より複雑なプログラミング問題を解く際の基礎となります。