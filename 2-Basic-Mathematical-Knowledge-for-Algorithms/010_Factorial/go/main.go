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