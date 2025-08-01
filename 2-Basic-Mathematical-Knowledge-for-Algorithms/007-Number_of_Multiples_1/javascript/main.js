const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function gcd(a, b) {
    while (b !== 0) {
        let temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

function lcm(a, b) {
    return Math.floor((a / gcd(a, b)) * b);
}

rl.on('line', (line) => {
    // 1. 入力処理
    const [n, x, y] = line.trim().split(' ').map(Number);

    // 2. LCM計算
    const lcmXY = lcm(x, y);

    // 3. 包除原理適用
    const result = Math.floor(n / x) + Math.floor(n / y) - Math.floor(n / lcmXY);

    // 4. 出力処理
    console.log(result);
    
    rl.close();
});