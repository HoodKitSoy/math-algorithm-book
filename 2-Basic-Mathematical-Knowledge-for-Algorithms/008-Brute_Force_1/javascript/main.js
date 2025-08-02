const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line) => {
    // 1. 入力処理
    const [n, s] = line.trim().split(' ').map(Number);

    // 2. 最適化された計算
    let count = 0;
    for (let r = 1; r <= n; r++) {
        const maxB = Math.min(n, s - r);
        count += Math.max(0, maxB);
    }

    // 3. 出力処理
    console.log(count);
    
    rl.close();
});