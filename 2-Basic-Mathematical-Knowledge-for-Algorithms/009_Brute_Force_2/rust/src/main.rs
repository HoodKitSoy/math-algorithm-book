use std::io;

// 前半部分の和を列挙し、possible1配列に記録
fn generate1(idx: usize, end_idx: usize, current_sum: i64, a: &[i32], s: i64, possible1: &mut [bool]) {
    if current_sum > s { // 枝刈り
        return;
    }
    if idx == end_idx {
        possible1[current_sum as usize] = true;
        return;
    }
    generate1(idx + 1, end_idx, current_sum, a, s, possible1); // a[idx] を選ばない
    generate1(idx + 1, end_idx, current_sum + a[idx] as i64, a, s, possible1); // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
fn find_solution(idx: usize, end_idx: usize, current_sum: i64, a: &[i32], s: i64, possible1: &[bool], found: &mut bool) {
    if *found { return; } // 既に発見済みなら即終了
    if current_sum > s { // 枝刈り
        return;
    }
    if idx == end_idx {
        let need = s - current_sum;
        if need >= 0 && need <= s && possible1[need as usize] {
            *found = true;
        }
        return;
    }
    find_solution(idx + 1, end_idx, current_sum, a, s, possible1, found); // a[idx] を選ばない
    find_solution(idx + 1, end_idx, current_sum + a[idx] as i64, a, s, possible1, found); // a[idx] を選ぶ
}

fn main() {
    // 1. 入力処理
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let first_line: Vec<i64> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    let n = first_line[0] as usize;
    let s = first_line[1];
    
    input.clear();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let a: Vec<i32> = input
        .trim()
        .split_whitespace()
        .map(|s| s.parse().expect("Please enter a number"))
        .collect();
    
    let mut possible1 = vec![false; (s + 1) as usize];
    let mut found = false;
    
    // 2. 前半と後半に分けて処理
    let half1_end = n / 2;
    
    generate1(0, half1_end, 0, &a, s, &mut possible1);
    find_solution(half1_end, n, 0, &a, s, &possible1, &mut found);
    
    // 3. 結果出力
    if found {
        println!("Yes");
    } else {
        println!("No");
    }
}