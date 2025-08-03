import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let n: number, s: number, a: number[];
let possible1: boolean[];
let found: boolean = false;

// 前半部分の和を列挙し、possible1配列に記録
function generate1(idx: number, endIdx: number, currentSum: number): void {
    if (currentSum > s) { // 枝刈り
        return;
    }
    if (idx === endIdx) {
        possible1[currentSum] = true;
        return;
    }
    generate1(idx + 1, endIdx, currentSum); // a[idx] を選ばない
    generate1(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
}

// 後半部分の和を列挙し、答えを探索
function findSolution(idx: number, endIdx: number, currentSum: number): void {
    if (found) return; // 既に発見済みなら即終了
    if (currentSum > s) { // 枝刈り
        return;
    }
    if (idx === endIdx) {
        const need: number = s - currentSum;
        if (need >= 0 && need <= s && possible1[need]) {
            found = true;
        }
        return;
    }
    findSolution(idx + 1, endIdx, currentSum); // a[idx] を選ばない
    findSolution(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
}

let lineCount: number = 0;

rl.on('line', (line: string) => {
    if (lineCount === 0) {
        [n, s] = line.trim().split(' ').map(Number);
        lineCount++;
    } else {
        a = line.trim().split(' ').map(Number);
        
        possible1 = new Array(s + 1).fill(false);
        
        // 2. 前半と後半に分けて処理
        const half1End: number = Math.floor(n / 2);
        
        generate1(0, half1End, 0);
        findSolution(half1End, n, 0);
        
        // 3. 結果出力
        if (found) {
            console.log("Yes");
        } else {
            console.log("No");
        }
        
        rl.close();
    }
});