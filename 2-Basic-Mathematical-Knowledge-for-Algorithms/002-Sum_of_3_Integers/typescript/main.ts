import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// 1. 入力処理
rl.on('line', (line: string) => {
    // splitで分割した配列の各要素をparseIntで整数に変換
    const [a1, a2, a3]: number[] = line.trim().split(' ').map(s => parseInt(s, 10));

    // 2. 計算処理
    const sum: number = a1 + a2 + a3;

    // 3. 出力処理
    console.log(sum);

    rl.close();
});