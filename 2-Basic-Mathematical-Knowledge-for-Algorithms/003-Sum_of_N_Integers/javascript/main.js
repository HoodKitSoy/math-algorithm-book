const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let lineCount = 0;
let n = 0;

rl.on('line', (line) => {
    if (lineCount === 0) {
        // 1. 個数の入力処理
        n = parseInt(line.trim());
        lineCount++;
    } else {
        // 2. 配列の入力処理
        const a = line.trim().split(' ').map(Number);

        // 3. 合計計算処理
        const sum = a.reduce((acc, num) => acc + num, 0);

        // 4. 出力処理
        console.log(sum);
        
        rl.close();
    }
});