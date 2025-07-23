use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let nums: Vec<i32> = input
        .split_whitespace()
        .map(|s| s.trim().parse().expect("Please enter a number"))
        .collect();

    // 2. 計算処理
    let sum: i32 = nums[0] + nums[1] + nums[2];
    // let sum: i32 = nums.iter().sum();

    // 3. 出力処理
    println!("{}", sum);
}
