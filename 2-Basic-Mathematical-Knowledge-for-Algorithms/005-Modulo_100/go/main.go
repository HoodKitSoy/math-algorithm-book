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

    // 4. 剰余計算処理
    result := sum % 100

    // 5. 出力処理
    fmt.Println(result)
}