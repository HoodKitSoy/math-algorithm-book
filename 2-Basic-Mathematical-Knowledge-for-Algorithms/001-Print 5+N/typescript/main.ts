import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// 1. 入力処理
rl.on('line', (line: string) => {
    // string型で受け取るので、parseIntで数値に変換
    const n = parseInt(line.trim(), 10);

    // 2. 出力処理
    const sum = 5 + n;

    // 3. 計算処理
    console.log(sum);

    rl.close();
});