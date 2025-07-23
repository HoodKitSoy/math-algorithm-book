const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// 1. 入力処理
rl.on('line', (line) => {
    // trim()で前後の空白を削除し、split(' ')でスペース分割、map(Number)で数値に変換
    const [a1, a2, a3] = line.trim().split(' ').map(Number);

    // 2. 計算処理
    const sum = a1 + a2 + a3;

    // 3. 出力処理
    console.log(sum);

    rl.close();
});