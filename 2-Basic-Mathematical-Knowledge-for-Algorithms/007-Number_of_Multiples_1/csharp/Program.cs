using System;

class Program {
    static long GCD(long a, long b) {
        while (b != 0) {
            long temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    static long LCM(long a, long b) {
        return (a / GCD(a, b)) * b;
    }

    static void Main() {
        // 1. 入力処理
        string[] input = Console.ReadLine().Split(' ');
        long n = long.Parse(input[0]);
        long x = long.Parse(input[1]);
        long y = long.Parse(input[2]);

        // 2. LCM計算
        long lcmXY = LCM(x, y);

        // 3. 包除原理適用
        long result = n / x + n / y - n / lcmXY;

        // 4. 出力処理
        Console.WriteLine(result);
    }
}