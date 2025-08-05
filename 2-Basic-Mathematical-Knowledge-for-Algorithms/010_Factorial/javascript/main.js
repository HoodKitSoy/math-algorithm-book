const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line) => {
    // 1. 入力処理
    const n = parseInt(line.trim());

    // 2. 階乗計算
    let result = 1;
    for (let i = 1; i <= n; i++) {
        result *= i;
    }

    // 3. 出力処理
    console.log(result);
    
    rl.close();
});