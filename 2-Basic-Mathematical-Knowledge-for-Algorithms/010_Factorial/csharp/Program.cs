using System;

class Program {
    static void Main() {
        // 1. 入力処理
        int n = int.Parse(Console.ReadLine());

        // 2. 階乗計算
        long result = 1;
        for (int i = 1; i <= n; i++) {
            result *= i;
        }

        // 3. 出力処理
        Console.WriteLine(result);
    }
}