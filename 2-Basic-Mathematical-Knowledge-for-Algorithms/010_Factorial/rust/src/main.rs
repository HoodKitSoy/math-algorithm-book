use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: u32 = input.trim().parse().expect("Please enter a number");

    // 2. 階乗計算
    let mut result: u64 = 1;
    for i in 1..=n {
        result *= i as u64;
    }

    // 3. 出力処理
    println!("{}", result);
}