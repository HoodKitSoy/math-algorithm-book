import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        int n = sc.nextInt();

        // 2. 計算処理
        int result = 2 * n + 3;

        // 3. 出力処理
        System.out.println(result);
        
        sc.close();
    }
}