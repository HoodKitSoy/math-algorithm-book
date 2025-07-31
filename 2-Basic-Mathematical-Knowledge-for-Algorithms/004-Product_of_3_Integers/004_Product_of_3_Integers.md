# 004 - Product of 3 Integers

## 問題文

3つの整数 $A_1, A_2, A_3$ が与えられます。
$A_1 \times A_2 \times A_3$ を出力するプログラムを作成してください。

### 制約

- $1 \leq A_1, A_2, A_3 \leq 100$
- 入力はすべて整数

### 入力

入力は以下の形式で標準入力から与えられます。

```
A1 A2 A3
```

### 出力

$A_1, A_2, A_3$ の積を出力してください。

### 入力例 1

```
2 8 8
```

### 出力例 1

```
128
```

$2 \times 8 \times 8 = 128$ なので、128 と出力すれば正解となります。

### 入力例 2

```
7 7 25
```

### 出力例 2

```
1225
```

$7 \times 7 \times 25 = 1225$ なので、1225 と出力すれば正解となります。

### 入力例 3

```
100 100 100
```

### 出力例 3

```
1000000
```

$100 \times 100 \times 100 = 1000000$ なので、1000000 と出力すれば正解となります。

-----

## 解説

この問題は、「002 - Sum of 3 Integers」や「003 - Sum of N Integers」の積（掛け算）版で、**基本的な入力処理**と**算術演算**を組み合わせた基本問題です。前回までは足し算でしたが、今回は掛け算を行います。

実装は以下の手順で行います。

1. **入力処理**
   - 標準入力から1行のデータを受け取ります。この行には3つの整数がスペースで区切られて含まれています。
   - 受け取った文字列をスペースで分割し、それぞれを**整数型**の変数に変換して保存します。

2. **積計算処理**
   - 3つの整数を掛け算します。
   - 計算結果を変数に保存します。

3. **出力処理**
   - 最後に、計算結果を保存した変数の値を標準出力に書き出します。

-----

## 各言語の実装詳細

以下では、C、C++、C#、Java、Rust、GO、Python、JavaScript、TypeScript の各実装について、実際のコードとともに詳しく解説します。

### C言語

```c
#include <stdio.h>

int main() {
    // 1. 入力処理
    int a1, a2, a3;
    scanf("%d %d %d", &a1, &a2, &a3);

    // 2. 積計算処理
    int product = a1 * a2 * a3;
    
    // 3. 出力処理
    printf("%d\n", product);

    return 0;
}
```

**解説:**

- `scanf("%d %d %d", &a1, &a2, &a3)`: スペースで区切られた3つの整数を一度に読み込みます。
- `a1 * a2 * a3`: 3つの値を掛け算して積を計算します。
- 制約から最大値は $100 \times 100 \times 100 = 1,000,000$ なので、`int`型で十分です。

### C++

```cpp
#include <iostream>

int main() {
    // 1. 入力処理
    int a1, a2, a3;
    std::cin >> a1 >> a2 >> a3;

    // 2. 積計算処理
    int product = a1 * a2 * a3;

    // 3. 出力処理
    std::cout << product << std::endl;

    return 0;
}
```

**解説:**

- `std::cin >> a1 >> a2 >> a3`: C++のストリーム演算子を使って3つの整数を順番に読み込みます。
- C言語と同様の計算処理ですが、C++の標準ライブラリを使用しています。

### C#

```csharp
using System;
using System.Linq;

class Program {
    static void Main() {
        // 1. 入力処理
        int[] numbers = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
        int a1 = numbers[0], a2 = numbers[1], a3 = numbers[2];

        // 2. 積計算処理
        int product = a1 * a2 * a3;

        // 3. 出力処理
        Console.WriteLine(product);
    }
}
```

**解説:**

- `Console.ReadLine().Split(' ').Select(int.Parse).ToArray()`: 入力行をスペースで分割し、各要素を整数に変換して配列にします。
- 配列から各値を取り出して積を計算します。
- LINQを使った簡潔な入力処理が特徴です。

### Java

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        int a1 = sc.nextInt();
        int a2 = sc.nextInt();
        int a3 = sc.nextInt();

        // 2. 積計算処理
        int product = a1 * a2 * a3;

        // 3. 出力処理
        System.out.println(product);
        
        sc.close();
    }
}
```

**解説:**

- `sc.nextInt()`: Scannerを使って整数を順番に読み込みます。スペースや改行を自動的に区切り文字として扱います。
- 3回の`nextInt()`呼び出しで3つの整数を取得します。

### Rust

```rust
use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let numbers: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    
    let a1 = numbers[0];
    let a2 = numbers[1];
    let a3 = numbers[2];

    // 2. 積計算処理
    let product = a1 * a2 * a3;

    // 3. 出力処理
    println!("{}", product);
}
```

**解説:**

- 入力行を読み込んでから、`split_whitespace()`でスペースで分割します。
- `map()`と`parse()`を使って各要素を整数に変換し、`Vec<i32>`に格納します。
- 関数型プログラミングのスタイルを活用した処理が特徴です。

### Go

```go
package main

import "fmt"

func main() {
    // 1. 入力処理
    var a1, a2, a3 int
    fmt.Scan(&a1, &a2, &a3)

    // 2. 積計算処理
    product := a1 * a2 * a3

    // 3. 出力処理
    fmt.Println(product)
}
```

**解説:**

- `fmt.Scan(&a1, &a2, &a3)`: 一度の呼び出しで3つの整数を読み込みます。
- `:=`演算子を使って変数宣言と初期化を同時に行います。
- シンプルで読みやすいコードが特徴です。

### Python

```python
# 1. 入力処理
a1, a2, a3 = map(int, input().split())

# 2. 積計算処理
product = a1 * a2 * a3

# 3. 出力処理
print(product)
```

**解説:**

- `map(int, input().split())`: 入力行をスペースで分割し、各要素を整数に変換します。
- タプルアンパックを使って一度に3つの変数に代入します。
- Pythonの簡潔な記法を活用した非常にコンパクトなコードです。

### JavaScript (Node.js)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line) => {
    // 1. 入力処理
    const [a1, a2, a3] = line.trim().split(' ').map(Number);

    // 2. 積計算処理
    const product = a1 * a2 * a3;

    // 3. 出力処理
    console.log(product);
    
    rl.close();
});
```

**解説:**

- 分割代入（destructuring assignment）を使って3つの値を一度に取得します。
- `map(Number)`で各要素を数値に変換します。
- Node.jsの`readline`モジュールを使った標準的な入力処理です。

### TypeScript

```typescript
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line: string) => {
    // 1. 入力処理
    const [a1, a2, a3]: number[] = line.trim().split(' ').map(s => parseInt(s, 10));

    // 2. 積計算処理
    const product: number = a1 * a2 * a3;

    // 3. 出力処理
    console.log(product);
    
    rl.close();
});
```

**解説:**

- JavaScriptのコードに型注釈を追加したバージョンです。
- `number[]`型注釈により、配列の要素が数値であることを保証します。
- 型安全性を高めることで、実行時エラーを防ぐことができます。

-----

## 学習のポイント

この問題を通して学べる重要なプログラミング概念は以下の通りです。

1. **基本的な算術演算**: 足し算から掛け算への応用
2. **複数値の一括入力処理**: スペース区切りの複数の値を効率的に処理する方法
3. **演算子の優先順位**: 掛け算は左から右に順番に計算される
4. **データ型の選択**: 結果の範囲を考慮した適切なデータ型の選択

掛け算は足し算よりも結果が大きくなりやすいため、オーバーフローに注意が必要な場合もありますが、この問題の制約では心配ありません。これらの基本的な概念は、より複雑な数学的計算を行うプログラムの基礎となります。