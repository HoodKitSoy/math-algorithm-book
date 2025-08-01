import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function gcd(a: number, b: number): number {
    while (b !== 0) {
        const temp: number = b;
        b = a % b;
        a = temp;
    }
    return a;
}

function lcm(a: number, b: number): number {
    return Math.floor((a / gcd(a, b)) * b);
}

rl.on('line', (line: string) => {
    // 1. 入力処理
    const [n, x, y]: number[] = line.trim().split(' ').map(Number);

    // 2. LCM計算
    const lcmXY: number = lcm(x, y);

    // 3. 包除原理適用
    const result: number = Math.floor(n / x) + Math.floor(n / y) - Math.floor(n / lcmXY);

    // 4. 出力処理
    console.log(result);
    
    rl.close();
});