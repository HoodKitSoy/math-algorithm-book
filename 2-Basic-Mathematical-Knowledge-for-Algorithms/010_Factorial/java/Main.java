import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        int n = sc.nextInt();

        // 2. 階乗計算
        long result = 1;
        for (int i = 1; i <= n; i++) {
            result *= i;
        }

        // 3. 出力処理
        System.out.println(result);
        
        sc.close();
    }
}