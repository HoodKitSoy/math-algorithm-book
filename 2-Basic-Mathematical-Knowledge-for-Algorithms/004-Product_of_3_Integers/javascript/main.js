const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line) => {
    // 1. 入力処理
    const [a1, a2, a3] = line.trim().split(' ').map(Number);

    // 2. 積計算処理
    const product = a1 * a2 * a3;

    // 3. 出力処理
    console.log(product);
    
    rl.close();
});