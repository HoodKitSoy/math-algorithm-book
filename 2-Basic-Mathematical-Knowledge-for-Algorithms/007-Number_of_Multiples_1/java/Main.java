import java.util.Scanner;

public class Main {
    static long gcd(long a, long b) {
        while (b != 0) {
            long temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    static long lcm(long a, long b) {
        return (a / gcd(a, b)) * b;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        long n = sc.nextLong();
        long x = sc.nextLong();
        long y = sc.nextLong();

        // 2. LCM計算
        long lcmXY = lcm(x, y);

        // 3. 包除原理適用
        long result = n / x + n / y - n / lcmXY;

        // 4. 出力処理
        System.out.println(result);
        
        sc.close();
    }
}