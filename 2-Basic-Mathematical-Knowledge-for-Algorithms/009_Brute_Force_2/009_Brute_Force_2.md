# 009 - Brute Force 2

## 問題文

$N$ 枚のカードが横一列に並べられています。左から $i$ 番目 $(1 \leq i \leq N)$ のカードには整数 $A_i$ が書かれています。
カードの中からいくつかを選んで、合計がちょうど $S$ となるようにする方法はありますか。

### 制約

- $1 \leq N \leq 60$
- $1 \leq A_i \leq 10000$
- $1 \leq S \leq 10000$
- 入力はすべて整数

### 部分点

- $1 \leq N \leq 20$ について解けると、500点が獲得できます。

### 入力

入力は以下の形式で標準入力から与えられます。

```
N S
A1 A2 A3 … AN
```

### 出力

合計を $S$ となるようにする方法が存在する場合は `Yes`、そうでない場合は `No` と出力してください。

### 入力例 1

```
3 11
2 5 9
```

### 出力例 1

```
Yes
```

カード1,3を選べば合計が11になるので答えはYesです。

### 入力例 2

```
4 11
3 1 4 5
```

### 出力例 2

```
No
```

どのようにカードを選んでも合計が11になることはないので答えはNoです。

-----

## 解説

この問題は**部分集合和問題（Subset Sum Problem）**です。$N \leq 60$ という制約で満点を取るには、**枝刈り付き半分全列挙**を使用します。

### 最適なアルゴリズム：枝刈り付き半分全列挙

通常の半分全列挙に加えて、以下の最適化を行います：

1. **配列による記録**: ハッシュテーブルではなく配列を使用（$S \leq 10000$ なので可能）
2. **枝刈り**: 合計が $S$ を超えた時点で探索を打ち切り
3. **早期終了**: 解が見つかった時点で即座に終了
4. **再帰による実装**: スタックオーバーフローを避けつつ効率的な実装

**アルゴリズムの手順：**
1. 配列を前半（0から$n/2-1$）と後半（$n/2$から$n-1$）に分割
2. 前半の全ての部分集合の和を再帰で列挙し、配列に記録
3. 後半の各部分集合に対して、前半で$(S - \text{後半の和})$が作れるかを配列で確認
4. 見つかった時点で即座に終了

**計算量：**
- 時間：$O(2^{N/2})$（枝刈りにより実際はより高速）
- 空間：$O(S)$（$S \leq 10000$ なので非常に効率的）

-----

## 各言語の実装詳細

### C言語

```c
#include <stdio.h>
#include <stdbool.h>

int n;
long long s;
int a[60];
bool possible1[10001];
bool found = false;

// 前半部分の和を列挙し、possible1配列に記録
void generate1(int idx, int end_idx, long long current_sum) {
    if (current_sum > s) { // 枝刈り
        return;
    }
    if (idx == end_idx) {
        possible1[current_sum] = true;
        return;
    }
    generate1(idx + 1, end_idx, current_sum); // a[idx] を選ばない
    generate1(idx + 1, end_idx, current_sum + a[idx]); // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
void find_solution(int idx, int end_idx, long long current_sum) {
    if (found) return; // 既に発見済みなら即終了
    if (current_sum > s) { // 枝刈り
        return;
    }
    if (idx == end_idx) {
        long long need = s - current_sum;
        if (need >= 0 && need <= s && possible1[need]) {
            found = true;
        }
        return;
    }
    find_solution(idx + 1, end_idx, current_sum); // a[idx] を選ばない
    find_solution(idx + 1, end_idx, current_sum + a[idx]); // a[idx] を選ぶ
}

int main() {
    // 1. 入力処理
    scanf("%d %lld", &n, &s);
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
    
    // 初期化
    for (int i = 0; i <= s; i++) {
        possible1[i] = false;
    }
    
    // 2. 前半と後半に分けて処理
    int half1_end = n / 2;
    
    generate1(0, half1_end, 0);
    find_solution(half1_end, n, 0);
    
    // 3. 結果出力
    if (found) {
        printf("Yes\n");
    } else {
        printf("No\n");
    }
    
    return 0;
}
```

**解説:**

- C言語での実装では固定サイズ配列を使用
- 配列の初期化を明示的に行う
- グローバル変数を使って状態を管理

### C++

```cpp
#include <iostream>
#include <vector>

int n;
long long s;
std::vector<int> a;
std::vector<bool> possible1;
bool found = false;

// 前半部分の和を列挙し、possible1配列に記録
void generate1(int idx, int end_idx, long long current_sum) {
    if (current_sum > s) { // 枝刈り
        return;
    }
    if (idx == end_idx) {
        possible1[current_sum] = true;
        return;
    }
    generate1(idx + 1, end_idx, current_sum); // a[idx] を選ばない
    generate1(idx + 1, end_idx, current_sum + a[idx]); // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
void find_solution(int idx, int end_idx, long long current_sum) {
    if (found) return; // 既に発見済みなら即終了
    if (current_sum > s) { // 枝刈り
        return;
    }
    if (idx == end_idx) {
        long long need = s - current_sum;
        if (need >= 0 && need <= s && possible1[need]) {
            found = true;
        }
        return;
    }
    find_solution(idx + 1, end_idx, current_sum); // a[idx] を選ばない
    find_solution(idx + 1, end_idx, current_sum + a[idx]); // a[idx] を選ぶ
}

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(NULL);
    
    // 1. 入力処理
    std::cin >> n >> s;
    a.resize(n);
    for (int i = 0; i < n; ++i) {
        std::cin >> a[i];
    }
    
    possible1.resize(s + 1, false);
    
    // 2. 前半と後半に分けて処理
    int half1_end = n / 2;
    
    generate1(0, half1_end, 0);
    find_solution(half1_end, n, 0);
    
    // 3. 結果出力
    if (found) {
        std::cout << "Yes" << std::endl;
    } else {
        std::cout << "No" << std::endl;
    }
    
    return 0;
}
```

**解説:**

- 再帰による部分集合の列挙で、スタックオーバーフローを避けつつ効率的に実装
- `possible1`配列により$O(1)$での高速アクセス
- 枝刈りにより無駄な探索を削減
- グローバル変数`found`による早期終了

### C#

```csharp
using System;

class Program {
    static int n;
    static long s;
    static int[] a;
    static bool[] possible1;
    static bool found = false;

    // 前半部分の和を列挙し、possible1配列に記録
    static void Generate1(int idx, int endIdx, long currentSum) {
        if (currentSum > s) { // 枝刈り
            return;
        }
        if (idx == endIdx) {
            possible1[currentSum] = true;
            return;
        }
        Generate1(idx + 1, endIdx, currentSum); // a[idx] を選ばない
        Generate1(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
    }

    // 後半部分の和を列挙し、答えを探索
    static void FindSolution(int idx, int endIdx, long currentSum) {
        if (found) return; // 既に発見済みなら即終了
        if (currentSum > s) { // 枝刈り
            return;
        }
        if (idx == endIdx) {
            long need = s - currentSum;
            if (need >= 0 && need <= s && possible1[need]) {
                found = true;
            }
            return;
        }
        FindSolution(idx + 1, endIdx, currentSum); // a[idx] を選ばない
        FindSolution(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
    }

    static void Main() {
        // 1. 入力処理
        string[] firstLine = Console.ReadLine().Split(' ');
        n = int.Parse(firstLine[0]);
        s = long.Parse(firstLine[1]);
        
        string[] secondLine = Console.ReadLine().Split(' ');
        a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = int.Parse(secondLine[i]);
        }
        
        possible1 = new bool[s + 1];
        
        // 2. 前半と後半に分けて処理
        int half1End = n / 2;
        
        Generate1(0, half1End, 0);
        FindSolution(half1End, n, 0);
        
        // 3. 結果出力
        if (found) {
            Console.WriteLine("Yes");
        } else {
            Console.WriteLine("No");
        }
    }
}
```

**解説:**

- C#のメソッド命名規則に従った実装
- 静的メソッドとして実装し、グローバル状態を管理
- 配列の自動初期化を活用

### Java

```java
import java.util.Scanner;

public class Main {
    static int n;
    static long s;
    static int[] a;
    static boolean[] possible1;
    static boolean found = false;

    // 前半部分の和を列挙し、possible1配列に記録
    static void generate1(int idx, int endIdx, long currentSum) {
        if (currentSum > s) { // 枝刈り
            return;
        }
        if (idx == endIdx) {
            possible1[(int)currentSum] = true;
            return;
        }
        generate1(idx + 1, endIdx, currentSum); // a[idx] を選ばない
        generate1(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
    }

    // 後半部分の和を列挙し、答えを探索
    static void findSolution(int idx, int endIdx, long currentSum) {
        if (found) return; // 既に発見済みなら即終了
        if (currentSum > s) { // 枝刈り
            return;
        }
        if (idx == endIdx) {
            long need = s - currentSum;
            if (need >= 0 && need <= s && possible1[(int)need]) {
                found = true;
            }
            return;
        }
        findSolution(idx + 1, endIdx, currentSum); // a[idx] を選ばない
        findSolution(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        n = sc.nextInt();
        s = sc.nextLong();
        
        a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }
        
        possible1 = new boolean[(int)s + 1];
        
        // 2. 前半と後半に分けて処理
        int half1End = n / 2;
        
        generate1(0, half1End, 0);
        findSolution(half1End, n, 0);
        
        // 3. 結果出力
        if (found) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }
        
        sc.close();
    }
}
```

**解説:**

- Javaでの静的メソッド実装
- 配列アクセス時の型キャストに注意
- `Scanner`を使った標準的な入力処理

### Rust

```rust
use std::io;

// 前半部分の和を列挙し、possible1配列に記録
fn generate1(idx: usize, end_idx: usize, current_sum: i64, a: &[i32], s: i64, possible1: &mut [bool]) {
    if current_sum > s { // 枝刈り
        return;
    }
    if idx == end_idx {
        possible1[current_sum as usize] = true;
        return;
    }
    generate1(idx + 1, end_idx, current_sum, a, s, possible1); // a[idx] を選ばない
    generate1(idx + 1, end_idx, current_sum + a[idx] as i64, a, s, possible1); // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
fn find_solution(idx: usize, end_idx: usize, current_sum: i64, a: &[i32], s: i64, possible1: &[bool], found: &mut bool) {
    if *found { return; } // 既に発見済みなら即終了
    if current_sum > s { // 枝刈り
        return;
    }
    if idx == end_idx {
        let need = s - current_sum;
        if need >= 0 && need <= s && possible1[need as usize] {
            *found = true;
        }
        return;
    }
    find_solution(idx + 1, end_idx, current_sum, a, s, possible1, found); // a[idx] を選ばない
    find_solution(idx + 1, end_idx, current_sum + a[idx] as i64, a, s, possible1, found); // a[idx] を選ぶ
}

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let first_line: Vec<i64> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    let n = first_line[0] as usize;
    let s = first_line[1];
    
    input.clear();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let a: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    
    let mut possible1 = vec![false; (s + 1) as usize];
    let mut found = false;
    
    // 2. 前半と後半に分けて処理
    let half1_end = n / 2;
    
    generate1(0, half1_end, 0, &a, s, &mut possible1);
    find_solution(half1_end, n, 0, &a, s, &possible1, &mut found);
    
    // 3. 結果出力
    if found {
        println!("Yes");
    } else {
        println!("No");
    }
}
```

**解説:**

- **安全な実装**: `unsafe`を使わず、関数パラメータとして値を渡すことで安全性を確保
- **参照の活用**: `&[i32]`（読み取り専用スライス）、`&mut [bool]`（可変スライス）、`&mut bool`（可変参照）を適切に使用
- **所有権システム**: Rustの所有権システムに従った実装で、コンパイル時の安全性チェックを活用
- **関数型アプローチ**: グローバル変数を使わず、必要な値を関数パラメータとして明示的に渡す
- **メモリ安全**: バッファオーバーランやデータ競合などの問題を言語レベルで防止

### Go

```go
package main

import "fmt"

var n int
var s int64
var a []int
var possible1 []bool
var found bool = false

// 前半部分の和を列挙し、possible1配列に記録
func generate1(idx, endIdx int, currentSum int64) {
    if currentSum > s { // 枝刈り
        return
    }
    if idx == endIdx {
        possible1[currentSum] = true
        return
    }
    generate1(idx+1, endIdx, currentSum) // a[idx] を選ばない
    generate1(idx+1, endIdx, currentSum+int64(a[idx])) // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
func findSolution(idx, endIdx int, currentSum int64) {
    if found { return } // 既に発見済みなら即終了
    if currentSum > s { // 枝刈り
        return
    }
    if idx == endIdx {
        need := s - currentSum
        if need >= 0 && need <= s && possible1[need] {
            found = true
        }
        return
    }
    findSolution(idx+1, endIdx, currentSum) // a[idx] を選ばない
    findSolution(idx+1, endIdx, currentSum+int64(a[idx])) // a[idx] を選ぶ
}

func main() {
    // 1. 入力処理
    fmt.Scan(&n, &s)
    
    a = make([]int, n)
    for i := 0; i < n; i++ {
        fmt.Scan(&a[i])
    }
    
    possible1 = make([]bool, s+1)
    
    // 2. 前半と後半に分けて処理
    half1End := n / 2
    
    generate1(0, half1End, 0)
    findSolution(half1End, n, 0)
    
    // 3. 結果出力
    if found {
        fmt.Println("Yes")
    } else {
        fmt.Println("No")
    }
}
```

**解説:**

- Goでのグローバル変数を使った実装
- 型変換を適切に行う
- シンプルで読みやすい実装

### Python

```python
import sys
sys.setrecursionlimit(100000)  # 再帰制限を増やす

n = 0
s = 0
a = []
possible1 = []
found = False

# 前半部分の和を列挙し、possible1配列に記録
def generate1(idx, end_idx, current_sum):
    global found
    if current_sum > s:  # 枝刈り
        return
    if idx == end_idx:
        possible1[current_sum] = True
        return
    generate1(idx + 1, end_idx, current_sum)  # a[idx] を選ばない
    generate1(idx + 1, end_idx, current_sum + a[idx])  # a[idx] を選ぶ

# 後半部分の和を列挙し、答えを探索
def find_solution(idx, end_idx, current_sum):
    global found
    if found:  # 既に発見済みなら即終了
        return
    if current_sum > s:  # 枝刈り
        return
    if idx == end_idx:
        need = s - current_sum
        if 0 <= need <= s and possible1[need]:
            found = True
        return
    find_solution(idx + 1, end_idx, current_sum)  # a[idx] を選ばない
    find_solution(idx + 1, end_idx, current_sum + a[idx])  # a[idx] を選ぶ

# 1. 入力処理
n, s = map(int, input().split())
a = list(map(int, input().split()))

possible1 = [False] * (s + 1)

# 2. 前半と後半に分けて処理
half1_end = n // 2

generate1(0, half1_end, 0)
find_solution(half1_end, n, 0)

# 3. 結果出力
if found:
    print("Yes")
else:
    print("No")
```

**解説:**

- Pythonでの再帰制限の調整
- グローバル変数の適切な使用
- リスト内包表記を使った初期化

### JavaScript (Node.js)

```javascript
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let n, s, a;
let possible1;
let found = false;

// 前半部分の和を列挙し、possible1配列に記録
function generate1(idx, endIdx, currentSum) {
    if (currentSum > s) { // 枝刈り
        return;
    }
    if (idx === endIdx) {
        possible1[currentSum] = true;
        return;
    }
    generate1(idx + 1, endIdx, currentSum); // a[idx] を選ばない
    generate1(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
function findSolution(idx, endIdx, currentSum) {
    if (found) return; // 既に発見済みなら即終了
    if (currentSum > s) { // 枝刈り
        return;
    }
    if (idx === endIdx) {
        const need = s - currentSum;
        if (need >= 0 && need <= s && possible1[need]) {
            found = true;
        }
        return;
    }
    findSolution(idx + 1, endIdx, currentSum); // a[idx] を選ばない
    findSolution(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
}

let lineCount = 0;

rl.on('line', (line) => {
    if (lineCount === 0) {
        [n, s] = line.trim().split(' ').map(Number);
        lineCount++;
    } else {
        a = line.trim().split(' ').map(Number);
        
        possible1 = new Array(s + 1).fill(false);
        
        // 2. 前半と後半に分けて処理
        const half1End = Math.floor(n / 2);
        
        generate1(0, half1End, 0);
        findSolution(half1End, n, 0);
        
        // 3. 結果出力
        if (found) {
            console.log("Yes");
        } else {
            console.log("No");
        }
        
        rl.close();
    }
});
```

**解説:**

- JavaScriptでの関数による実装
- `Array`の初期化メソッドを活用
- 非同期入力処理との組み合わせ

### TypeScript

```typescript
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let n: number, s: number, a: number[];
let possible1: boolean[];
let found: boolean = false;

// 前半部分の和を列挙し、possible1配列に記録
function generate1(idx: number, endIdx: number, currentSum: number): void {
    if (currentSum > s) { // 枝刈り
        return;
    }
    if (idx === endIdx) {
        possible1[currentSum] = true;
        return;
    }
    generate1(idx + 1, endIdx, currentSum); // a[idx] を選ばない
    generate1(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
function findSolution(idx: number, endIdx: number, currentSum: number): void {
    if (found) return; // 既に発見済みなら即終了
    if (currentSum > s) { // 枝刈り
        return;
    }
    if (idx === endIdx) {
        const need: number = s - currentSum;
        if (need >= 0 && need <= s && possible1[need]) {
            found = true;
        }
        return;
    }
    findSolution(idx + 1, endIdx, currentSum); // a[idx] を選ばない
    findSolution(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
}

let lineCount: number = 0;

rl.on('line', (line: string) => {
    if (lineCount === 0) {
        [n, s] = line.trim().split(' ').map(Number);
        lineCount++;
    } else {
        a = line.trim().split(' ').map(Number);
        
        possible1 = new Array(s + 1).fill(false);
        
        // 2. 前半と後半に分けて処理
        const half1End: number = Math.floor(n / 2);
        
        generate1(0, half1End, 0);
        findSolution(half1End, n, 0);
        
        // 3. 結果出力
        if (found) {
            console.log("Yes");
        } else {
            console.log("No");
        }
        
        rl.close();
    }
});
```

**解説:**

- TypeScriptの型システムを活用した安全な実装
- 関数の戻り値型を明示
- 型安全な配列操作

-----

## アルゴリズムの詳細分析

### 核心的なアイデア

1. **問題の分割**: $N$ 枚のカードを前半と後半に分割
2. **配列による記録**: $S \leq 10000$ という制約を活用し、ハッシュテーブルではなく配列を使用
3. **枝刈り**: 合計が $S$ を超えた時点で探索を打ち切り
4. **早期終了**: 解が見つかった時点で即座に終了

### 計算量の分析

**時間計算量:**
- 前半の探索: $O(2^{N/2})$
- 後半の探索: $O(2^{N/2})$
- 枝刈りにより実際の計算量はさらに削減

**空間計算量:**
- 配列のサイズ: $O(S) = O(10000)$
- 非常に効率的なメモリ使用

### 枝刈りの効果

`current_sum > s` の条件により、無駄な探索を大幅に削減：
- 合計が既に $S$ を超えている場合、それ以上の探索は無意味
- 実際の実行時間を大幅に短縮

-----

## 学習のポイント

この問題を通して学べる重要な概念：

1. **半分全列挙**: 指数的な問題を実用的な時間で解く高度な技法
2. **枝刈り**: 不要な探索を削減する最適化手法
3. **制約の活用**: 問題の制約を活かした効率的なデータ構造の選択
4. **早期終了**: 解が見つかった時点での即座の終了
5. **再帰による実装**: スタックオーバーフローを避けつつ効率的な部分集合列挙

この実装は、理論的な計算量だけでなく、実際の実行時間も考慮した実用的なアルゴリズムの好例です。制約を活かした最適化により、$N = 60$ という大きな制約でも効率的に解くことができます。