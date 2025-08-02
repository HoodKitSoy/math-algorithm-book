import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        int n = sc.nextInt();
        int s = sc.nextInt();

        // 2. 最適化された計算
        int count = 0;
        for (int r = 1; r <= n; r++) {
            int maxB = Math.min(n, s - r);
            count += Math.max(0, maxB);
        }

        // 3. 出力処理
        System.out.println(count);
        
        sc.close();
    }
}