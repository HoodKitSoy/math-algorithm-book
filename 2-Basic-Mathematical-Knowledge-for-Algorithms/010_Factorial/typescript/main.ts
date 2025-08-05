import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line: string) => {
    // 1. 入力処理
    const n: number = parseInt(line.trim(), 10);

    // 2. 階乗計算
    let result: number = 1;
    for (let i: number = 1; i <= n; i++) {
        result *= i;
    }

    // 3. 出力処理
    console.log(result);
    
    rl.close();
});