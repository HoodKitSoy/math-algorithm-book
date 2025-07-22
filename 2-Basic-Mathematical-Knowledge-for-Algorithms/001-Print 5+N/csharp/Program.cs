using System;

class Program {
    static void Main() {
        // 1. 入力処理
        // ReadLine()は文字列を返すため、int.Parse()で整数に変換する
        int n = int.Parse(Console.ReadLine());

        // 2. 計算処理
        int sum = 5 + n;

        // 3. 出力処理
        Console.WriteLine(sum);
    }
}