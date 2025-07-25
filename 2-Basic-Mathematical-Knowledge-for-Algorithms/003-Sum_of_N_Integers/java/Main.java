import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // 1. 個数の入力処理
        int n = sc.nextInt();
    
        // 2. 配列の入力処理
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }

        // 3. 合計計算処理
        int sum = 0;
        for (int i = 0; i < n; i++) {
            sum += a[i];
        }

        // 4. 出力処理
        System.out.println(sum);

        sc.close();
    }
}