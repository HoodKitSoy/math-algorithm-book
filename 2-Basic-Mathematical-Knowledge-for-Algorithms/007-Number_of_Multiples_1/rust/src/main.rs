use std::io;

fn gcd(mut a: u64, mut b: u64) -> u64 {
    while b != 0 {
        let temp = b;
        b = a % b;
        a = temp;
    }
    a
}

fn lcm(a: u64, b: u64) -> u64 {
    (a / gcd(a, b)) * b
}

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let numbers: Vec<u64> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    
    let n = numbers[0];
    let x = numbers[1];
    let y = numbers[2];

    // 2. LCM計算
    let lcm_xy = lcm(x, y);

    // 3. 包除原理適用
    let result = n / x + n / y - n / lcm_xy;

    // 4. 出力処理
    println!("{}", result);
}