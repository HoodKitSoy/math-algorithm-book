using System;

class Program {
    static void Main() {
        // 1. 入力処理
        string[] input = Console.ReadLine().Split(' ');
        int n = int.Parse(input[0]);
        int s = int.Parse(input[1]);

        // 2. 最適化された計算
        int count = 0;
        for (int r = 1; r <= n; r++) {
            int maxB = Math.Min(n, s - r);
            count += Math.Max(0, maxB);
        }

        // 3. 出力処理
        Console.WriteLine(count);
    }
}