# 001 - Print 5+N

## 問題文
りんごが **5** 個あり、みかんが **N** 個あります。
整数 **N** が与えられるので、りんごとみかんを合わせて何個あるかを出力するプログラムを作成してください。

### 制約
- $1 \le N \le 100$
- N は整数

### 入力
入力は以下の形式で標準入力から与えられます。
```
N
```

### 出力
りんごとみかんを合わせた個数を出力してください。

### 入力例 1
```
2
```

### 出力例 1
```
7
```
このテストケースでは、りんごが 5 個、みかんが 2 個あります。
合計個数は $5 + 2 = 7$ 個です。

### 入力例 2
```
4
```

### 出力例 2
```
9
```
このテストケースでは、りんごが 5 個、みかんが 4 個あります。
合計個数は $5 + 4 = 9$ 個です。

---

## 解説
この問題は、プログラミングの基本的な**入力** **計算** **出力**の3つの処理を正しく実装できるかを確認するものです。

実装は以下の手順で行います。

1.  **入力処理**
    - まず、標準入力から1行のデータを受け取ります。
    - 受け取ったデータは文字列として扱われるため、計算ができるように**整数型**の変数に変換して保存します。この変数が、問題文におけるみかんの個数 `N` にあたります。

2.  **計算処理**
    - 次に、問題の要求に従って、りんごの個数である `5` と、先ほど入力から受け取った整数 `N` の値を足し算します。
    - 計算結果を新しい変数に保存します。

3.  **出力処理**
    - 最後に、計算結果を保存した変数の値を標準出力に書き出します。
    - 出力後、改行するのが一般的です。

これらのステップを、使用するプログラミング言語の作法に沿って記述することで、この問題に正解できます。

---

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
    int sum = 5 + n;
    
    // 3. 出力処理
    printf("%d\n", sum);

    return 0;
}
```

**解説:**
- `scanf("%d", &n)`: 標準入力から整数を読み込み、変数 `n` に格納します。`&n` はnのアドレスを渡しています。
- `int sum = 5 + n`: りんごの個数5とみかんの個数nを足して合計を計算します。
- `printf("%d\n", sum)`: 計算結果を標準出力に表示し、改行します。

### C++
```cpp
#include <iostream>

int main() {
    // 1. 入力処理
    int n;
    std::cin >> n;

    // 2. 計算処理
    int sum = 5 + n;

    // 3. 出力処理
    std::cout << sum << std::endl;

    return 0;
}
```

**解説:**
- `std::cin >> n`: ストリーム演算子を使って標準入力から整数を読み込みます。
- `std::cout << sum << std::endl`: ストリーム演算子で結果を出力し、`std::endl`で改行とバッファフラッシュを行います。

### C#
```csharp
using System;

class Program {
    static void Main() {
        // 1. 入力処理
        int n = int.Parse(Console.ReadLine());

        // 2. 計算処理
        int sum = 5 + n;

        // 3. 出力処理
        Console.WriteLine(sum);
    }
}
```

**解説:**
- `Console.ReadLine()`: 標準入力から一行を文字列として読み込みます。
- `int.Parse()`: 文字列を整数に変換します。
- `Console.WriteLine(sum)`: 結果を標準出力に表示し、自動的に改行されます。

### Java
```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // 1. 入力処理
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.close();

        // 2. 計算処理
        int sum = 5 + n;

        // 3. 出力処理
        System.out.println(sum);
    }
}
```

**解説:**
- `Scanner`クラスを使用して標準入力を扱います。
- `sc.nextInt()`: 次の整数トークンを読み込みます。
- `sc.close()`: リソースを適切に閉じます。
- `System.out.println(sum)`: 結果を出力し、改行します。

### Rust
```rust
use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: i32 = input.trim().parse().expect("Please enter a number");

    // 2. 計算処理
    let sum = 5 + n;

    // 3. 出力処理
    println!("{}", sum);
}
```

**解説:**
- `io::stdin().read_line()`: 標準入力から一行を読み込みます。
- `input.trim().parse()`: 文字列の前後の空白を除去し、整数に変換します。
- `expect()`: エラーハンドリングを行い、失敗時にメッセージを表示します。
- `println!("{}", sum)`: マクロを使用して結果を出力し、改行します。

### Go
```go
package main

import "fmt"

func main() {
    // 1. 入力処理
    var n int
    fmt.Scan(&n)

    // 2. 計算処理
    sum := 5 + n

    // 3. 出力処理
    fmt.Println(sum)
}
```

**解説:**
- `fmt.Scan(&n)`: 標準入力から値を読み込み、変数のアドレスに格納します。
- `:=`演算子を使用して変数を宣言と同時に初期化します。
- `fmt.Println(sum)`: 結果を出力し、改行します。

### Python
```python
# 1. 入力処理
n = int(input())

# 2. 計算処理
sum_result = 5 + n

# 3. 出力処理
print(sum_result)
```

**解説:**
- `input()`: 標準入力から一行を文字列として読み込みます。
- `int()`: 文字列を整数に変換します。
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
    const n = parseInt(line.trim(), 10);

    // 2. 計算処理
    const sum = 5 + n;

    // 3. 出力処理
    console.log(sum);

    rl.close();
});
```

**解説:**
- `readline`モジュールを使用して標準入力を非同期で処理します。
- `parseInt(line.trim(), 10)`: 文字列を整数に変換します（10進数指定）。
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
    const n = parseInt(line.trim(), 10);

    // 2. 計算処理
    const sum: number = 5 + n;

    // 3. 出力処理
    console.log(sum);

    rl.close();
});
```

**解説:**
- JavaScriptと同様の処理ですが、型注釈（`line: string`、`sum: number`）が追加されています。
- TypeScriptコンパイラによって型安全性が保証されます。



