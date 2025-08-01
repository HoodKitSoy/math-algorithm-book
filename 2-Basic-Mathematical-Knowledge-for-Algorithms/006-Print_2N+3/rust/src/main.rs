use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: i32 = input.trim().parse().expect("Please enter a number");

    // 2. 計算処理
    let result = 2 * n + 3;

    // 3. 出力処理
    println!("{}", result);
}