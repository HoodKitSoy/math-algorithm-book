using System;
using System.Linq;

class Program {
    static void Main() {
        // 1. 入力処理
        string[] inputs = Console.ReadLine().Split(' ');
        int a1 = int.Parse(inputs[0]);
        int a2 = int.Parse(inputs[1]);
        int a3 = int.Parse(inputs[2]);

        // 2. 計算処理
        int sum = a1 + a2 + a3;

        // 3. 出力処理
        Console.WriteLine(sum);
    }
}