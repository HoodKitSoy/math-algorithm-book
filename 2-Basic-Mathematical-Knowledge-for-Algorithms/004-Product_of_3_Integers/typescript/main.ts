import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.on('line', (line: string) => {
    // 1. 入力処理
    const [a1, a2, a3]: number[] = line.trim().split(' ').map(s => parseInt(s, 10));

    // 2. 積計算処理
    const product: number = a1 * a2 * a3;

    // 3. 出力処理
    console.log(product);
    
    rl.close();
});