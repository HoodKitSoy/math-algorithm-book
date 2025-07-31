using System;
using System.Linq;

class Program {
    static void Main() {
        // 1. 入力処理
        int[] numbers = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
        int a1 = numbers[0], a2 = numbers[1], a3 = numbers[2];

        // 2. 積計算処理
        int product = a1 * a2 * a3;

        // 3. 出力処理
        Console.WriteLine(product);
    }
}