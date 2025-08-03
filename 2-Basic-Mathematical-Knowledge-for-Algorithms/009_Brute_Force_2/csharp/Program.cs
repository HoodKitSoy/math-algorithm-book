using System;

class Program {
    static int n;
    static long s;
    static int[] a;
    static bool[] possible1;
    static bool found = false;

    // 前半部分の和を列挙し、possible1配列に記録
    static void Generate1(int idx, int endIdx, long currentSum) {
        if (currentSum > s) { // 枝刈り
            return;
        }
        if (idx == endIdx) {
            possible1[currentSum] = true;
            return;
        }
        Generate1(idx + 1, endIdx, currentSum); // a[idx] を選ばない
        Generate1(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
    }

    // 後半部分の和を列挙し、答えを探索
    static void FindSolution(int idx, int endIdx, long currentSum) {
        if (found) return; // 既に発見済みなら即終了
        if (currentSum > s) { // 枝刈り
            return;
        }
        if (idx == endIdx) {
            long need = s - currentSum;
            if (need >= 0 && need <= s && possible1[need]) {
                found = true;
            }
            return;
        }
        FindSolution(idx + 1, endIdx, currentSum); // a[idx] を選ばない
        FindSolution(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
    }

    static void Main() {
        // 1. 入力処理
        string[] firstLine = Console.ReadLine().Split(' ');
        n = int.Parse(firstLine[0]);
        s = long.Parse(firstLine[1]);
        
        string[] secondLine = Console.ReadLine().Split(' ');
        a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = int.Parse(secondLine[i]);
        }
        
        possible1 = new bool[s + 1];
        
        // 2. 前半と後半に分けて処理
        int half1End = n / 2;
        
        Generate1(0, half1End, 0);
        FindSolution(half1End, n, 0);
        
        // 3. 結果出力
        if (found) {
            Console.WriteLine("Yes");
        } else {
            Console.WriteLine("No");
        }
    }
}