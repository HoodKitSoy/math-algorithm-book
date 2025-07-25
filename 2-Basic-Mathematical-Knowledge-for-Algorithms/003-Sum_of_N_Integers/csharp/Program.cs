using System;
using System.Linq;

class Program {
    static void Main()
    {
        // 1. 個数の入力処理
        int n = int.Parse(Console.ReadLine());

        // 2. 配列の入力処理
        int[] a = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();

        // 3. 合計計算処理
        int sum = a.Sum();

        // 4. 出力処理
        Console.WriteLine(sum);
    }
}