package main

import "fmt"

func gcd(a, b int64) int64 {
    for b != 0 {
        a, b = b, a%b
    }
    return a
}

func lcm(a, b int64) int64 {
    return (a / gcd(a, b)) * b
}

func main() {
    // 1. 入力処理
    var n, x, y int64
    fmt.Scan(&n, &x, &y)

    // 2. LCM計算
    lcmXY := lcm(x, y)

    // 3. 包除原理適用
    result := n/x + n/y - n/lcmXY

    // 4. 出力処理
    fmt.Println(result)
}