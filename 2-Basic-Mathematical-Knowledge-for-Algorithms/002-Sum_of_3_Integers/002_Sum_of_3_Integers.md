# 002 - Sum of 3 Integers

## 問題文

3 つの整数 $A_1, A_2, A_3$ が与えられます。
$A_1 + A_2 + A_3$ を出力するプログラムを作成してください。

### 制約

  - $1 \leq A_1, A_2, A_3 \leq 100$
  - 入力はすべて整数

### 入力

入力は以下の形式で標準入力から与えられます。

```
A1 A2 A3
```

### 出力

$A\_1, A\_2, A\_3$ の合計値を出力してください。

### 入力例 1

```
10 20 50
```

### 出力例 1

```
80
```

$10 + 20 + 50 = 80$ なので、80 と出力すれば正解となります。

### 入力例 2

```
1 1 1
```

### 出力例 2

```
3
```

$1 + 1 + 1 = 3$ なので、3 と出力すれば正解となります。

### 入力例 3

```
100 100 100
```

### 出力例 3

```
300
```

$100 + 100 + 100 = 300$ なので、300 と出力すれば正解となります。

-----

## 解説

この問題は、プログラミングの基本的な**入力** **計算** **出力**の3つの処理を正しく実装できるかを確認するものです。今回は複数の値を入力として受け取ります。

実装は以下の手順で行います。

1.  **入力処理**

      - まず、標準入力から1行のデータを受け取ります。この行には3つの整数がスペースで区切られて含まれています。
      - 受け取った文字列をスペースで分割し、それぞれを**整数型**の変数に変換して保存します。これらが問題文における $A_1, A_2, A_3$ にあたります。

2.  **計算処理**

      - 次に、問題の要求に従って、先ほど入力から受け取った3つの整数 $A_1, A_2, A_3$ の値を足し算します。
      - 計算結果を新しい変数に保存します。

3.  **出力処理**

      - 最後に、計算結果を保存した変数の値を標準出力に書き出します。
      - 出力後、改行するのが一般的です。

これらのステップを、使用するプログラミング言語の作法に沿って記述することで、この問題に正解できます。

-----

## 各言語の実装詳細

以下では、C、C++、C\#、Java、Rust、GO、Python、JavaScript、TypeScript の各実装について、実際のコードとともに詳しく解説します。

### C言語

```c
#include <stdio.h>

int main() {
    // 1. 入力処理
    int a1, a2, a3;
    scanf("%d %d %d", &a1, &a2, &a3);

    // 2. 計算処理
    int sum = a1 + a2 + a3;
    
    // 3. 出力処理
    printf("%d\n", sum);

    return 0;
}
```

**解説:**

  - `scanf("%d %d %d", &a1, &a2, &a3)`: 標準入力からスペース区切りの3つの整数を読み込み、変数 `a1`, `a2`, `a3` に格納します。
  - `int sum = a1 + a2 + a3`: 3つの整数を足して合計を計算します。
  - `printf("%d\n", sum)`: 計算結果を標準出力に表示し、改行します。

### C++

```cpp
#include <iostream>

int main() {
    // 1. 入力処理
    int a1, a2, a3;
    std::cin >> a1 >> a2 >> a3;

    // 2. 計算処理
    int sum = a1 + a2 + a3;

    // 3. 出力処理
    std::cout << sum << std::endl;

    return 0;
}
```

**解説:**

  - `std::cin >> a1 >> a2 >> a3`: ストリーム演算子を使って標準入力からスペース区切りの3つの整数を読み込みます。
  - `std::cout << sum << std::endl`: ストリーム演算子で結果を出力し、`std::endl`で改行とバッファフラッシュを行います。

### C\#

```csharp
using System;
using System.Linq;

class Program {
    static void Main() {
        // 1. 入力処理
        string[] inputs = Console.ReadLine().Split(' ');
        int a1 = int.Parse(inputs[0]);
        int a2 = int.Parse(inputs[1]);
        int a3 = int.Parse(inputs[2]);

        // 2. 計算処理
        int sum = a1 + a2 + a3;

        // 3. 出力処理
        Console.WriteLine(sum);
    }
}
```

**解説:**

  - `Console.ReadLine().Split(' ')`: 標準入力から一行を読み込み、スペースで分割して文字列の配列を生成します。
  - `int.Parse()`: 配列の各要素（文字列）を整数に変換します。
  - `Console.WriteLine(sum)`: 結果を標準出力に表示し、自動的に改行されます。

### Java

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // 1. 入力処理
        Scanner sc = new Scanner(System.in);
        int a1 = sc.nextInt();
        int a2 = sc.nextInt();
        int a3 = sc.nextInt();
        sc.close();

        // 2. 計算処理
        int sum = a1 + a2 + a3;

        // 3. 出力処理
        System.out.println(sum);
    }
}
```

**解説:**

  - `Scanner`クラスを使用して標準入力を扱います。
  - `sc.nextInt()`: スペースまたは改行で区切られた次の整数トークンを読み込みます。これを3回繰り返します。
  - `sc.close()`: リソースを適切に閉じます。
  - `System.out.println(sum)`: 結果を出力し、改行します。

### Rust

```rust
use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let nums: Vec<i32> = input
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();

    // 2. 計算処理
    let sum: i32 = nums[0] + nums[1] + nums[2];
    // もしくは let sum: i32 = nums.iter().sum();

    // 3. 出力処理
    println!("{}", sum);
}
```

**解説:**

  - `io::stdin().read_line()`: 標準入力から一行を読み込みます。
  - `split_whitespace()`: 文字列を空白文字で分割します。
  - `.map(|s| s.parse()...)`: 分割された各文字列を整数に変換します。
  - `.collect()`: 結果を`Vec<i32>`（整数のベクタ）に集約します。
  - `nums[0] + nums[1] + nums[2]`: ベクタの要素を足し算します。`iter().sum()`でも同様の計算が可能です。
  - `println!("{}", sum)`: マクロを使用して結果を出力し、改行します。

### Go

```go
package main

import "fmt"

func main() {
    // 1. 入力処理
    var a1, a2, a3 int
    fmt.Scan(&a1, &a2, &a3)

    // 2. 計算処理
    sum := a1 + a2 + a3

    // 3. 出力処理
    fmt.Println(sum)
}
```

**解説:**

  - `fmt.Scan(&a1, &a2, &a3)`: 標準入力からスペース区切りの値を読み込み、変数のアドレスに格納します。
  - `:=`演算子を使用して変数を宣言と同時に初期化します。
  - `fmt.Println(sum)`: 結果を出力し、改行します。

### Python

```python
# 1. 入力処理
# input().split()でスペース区切りの文字列リストを取得し、map(int, ...)で各要素を整数に変換
a1, a2, a3 = map(int, input().split())

# 2. 計算処理
sum_result = a1 + a2 + a3

# 3. 出力処理
print(sum_result)
```

**解説:**

  - `input().split()`: 標準入力から一行を読み込み、スペースで分割して文字列のリストを生成します。
  - `map(int, ...)`: リストの各要素に`int()`関数を適用し、整数に変換します。
  - `a1, a2, a3 = ...`: 変換された3つの整数を、それぞれの変数に一度に代入します。
  - `print()`: 結果を出力し、自動的に改行されます。

### JavaScript (Node.js)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// 1. 入力処理
rl.on('line', (line) => {
    // trim()で前後の空白を削除し、split(' ')でスペース分割、map(Number)で数値に変換
    const [a1, a2, a3] = line.trim().split(' ').map(Number);

    // 2. 計算処理
    const sum = a1 + a2 + a3;

    // 3. 出力処理
    console.log(sum);

    rl.close();
});
```

**解説:**

  - `readline`モジュールを使用して標準入力を非同期で処理します。
  - `line.trim().split(' ').map(Number)`: 受け取った行の文字列から前後の空白を削除し、スペースで分割後、`map(Number)`で各要素を数値に変換します。
  - `const [a1, a2, a3] = ...`: 分割代入を使って、配列の要素を各変数に割り当てます。
  - `console.log(sum)`: 結果を出力し、改行します。

### TypeScript

```typescript
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// 1. 入力処理
rl.on('line', (line: string) => {
    // splitで分割した配列の各要素をparseIntで整数に変換
    const [a1, a2, a3]: number[] = line.trim().split(' ').map(s => parseInt(s, 10));

    // 2. 計算処理
    const sum: number = a1 + a2 + a3;

    // 3. 出力処理
    console.log(sum);

    rl.close();
});
```

**解説:**

  - JavaScriptとほぼ同じ処理ですが、型注釈（`: string`, `: number[]`, `: number`）によって型安全性を高めています。
  - `parseInt(s, 10)` を使用して、文字列を10進数の整数として明示的に変換しています。