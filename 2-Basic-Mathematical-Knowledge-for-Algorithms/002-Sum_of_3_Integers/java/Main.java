import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        // 1. 入力処理
        Scanner sc = new Scanner(System.in);
        int a1 = sc.nextInt();
        int a2 = sc.nextInt();
        int a3 = sc.nextInt();
        sc.close();

        // 2. 計算処理
        int sum = a1 + a2 + a3;

        // 3. 出力処理
        System.out.println(sum);
    }
}