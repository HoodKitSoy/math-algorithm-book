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