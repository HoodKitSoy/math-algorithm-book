use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let numbers: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    
    let a1 = numbers[0];
    let a2 = numbers[1];
    let a3 = numbers[2];

    // 2. 積計算処理
    let product = a1 * a2 * a3;

    // 3. 出力処理
    println!("{}", product);
}