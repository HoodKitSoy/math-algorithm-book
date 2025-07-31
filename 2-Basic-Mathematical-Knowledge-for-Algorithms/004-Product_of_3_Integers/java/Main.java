import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        int a1 = sc.nextInt();
        int a2 = sc.nextInt();
        int a3 = sc.nextInt();

        // 2. 積計算処理
        int product = a1 * a2 * a3;

        // 3. 出力処理
        System.out.println(product);
        
        sc.close();
    }
}