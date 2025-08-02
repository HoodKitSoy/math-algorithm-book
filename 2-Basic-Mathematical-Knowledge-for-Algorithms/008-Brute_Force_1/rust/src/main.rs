use std::io;
use std::cmp;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let numbers: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    
    let n = numbers[0];
    let s = numbers[1];

    // 2. 最適化された計算
    let mut count = 0;
    for r in 1..=n {
        let max_b = cmp::min(n, s - r);
        count += cmp::max(0, max_b);
    }

    // 3. 出力処理
    println!("{}", count);
}