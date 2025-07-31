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