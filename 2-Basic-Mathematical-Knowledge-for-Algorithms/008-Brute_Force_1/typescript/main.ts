import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line: string) => {
    // 1. 入力処理
    const [n, s]: number[] = line.trim().split(' ').map(Number);

    // 2. 最適化された計算
    let count: number = 0;
    for (let r: number = 1; r <= n; r++) {
        const maxB: number = Math.min(n, s - r);
        count += Math.max(0, maxB);
    }

    // 3. 出力処理
    console.log(count);
    
    rl.close();
});