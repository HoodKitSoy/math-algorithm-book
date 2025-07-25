import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lineCount: number = 0;
let n: number = 0;

// 1. 入力処理
rl.on('line', (line: string) => {
  if (lineCount === 0) {
    // 1. 個数の入力処理
    n = parseInt(line.trim(), 10);
    lineCount++;
  } else {
    // 2. 配列の入力処理
    const a: number[] = line.trim().split(' ').map(s => parseInt(s, 10));

    // 3. 合計計算処理
    const sum: number = a.reduce((acc: number, num: number) => acc + num, 0);

    // 4. 出力処理
    console.log(sum);

    rl.close();
  }
});