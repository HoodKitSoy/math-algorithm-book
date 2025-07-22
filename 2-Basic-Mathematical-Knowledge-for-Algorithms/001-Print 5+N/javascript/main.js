const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// 1. 入力処理
rl.on('line', (line) => {
    // 文字列として受け取るので、parseIntで整数に変換
    const n = parseInt(line, 10);

    // 2. 計算処理
    const sum = 5 + n;

    // 3. 出力処理
    console.log(sum);

    // 入力処理を終了
    rl.close();
});