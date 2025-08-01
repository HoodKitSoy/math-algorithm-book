const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line) => {
    // 1. 入力処理
    const n = parseInt(line.trim());

    // 2. 計算処理
    const result = 2 * n + 3;

    // 3. 出力処理
    console.log(result);
    
    rl.close();
});