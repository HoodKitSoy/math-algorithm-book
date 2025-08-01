import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line: string) => {
    // 1. 入力処理
    const n: number = parseInt(line.trim(), 10);

    // 2. 計算処理
    const result: number = 2 * n + 3;

    // 3. 出力処理
    console.log(result);
    
    rl.close();
});