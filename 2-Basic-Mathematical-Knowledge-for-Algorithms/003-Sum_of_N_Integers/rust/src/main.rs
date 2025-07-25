use std::io;

fn main() {
    // 1. 個数の入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: usize = input.trim().parse().expect("Please enter a number");

    // 2. 配列の入力処理
    input.clear();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let a: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();

    // 3. 合計計算処理
    let sum: i32 = a.iter().sum();

    // 4. 出力処理
    println!("{}", sum);
}