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