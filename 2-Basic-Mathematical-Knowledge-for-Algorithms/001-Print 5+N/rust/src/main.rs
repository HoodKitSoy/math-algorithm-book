use std::io;

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    // 読み取った文字列から改行コードを取り除き、整数に変換
    let n: i32 = input.trim().parse().unwrap();

    // 2. 計算処理
    let sum = 5 + n;

    // 3. 出力処理
    println!("{}", sum);
}
