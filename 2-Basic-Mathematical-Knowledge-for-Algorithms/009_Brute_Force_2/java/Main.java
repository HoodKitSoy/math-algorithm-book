import java.util.Scanner;

public class Main {
    static int n;
    static long s;
    static int[] a;
    static boolean[] possible1;
    static boolean found = false;

    // 前半部分の和を列挙し、possible1配列に記録
    static void generate1(int idx, int endIdx, long currentSum) {
        if (currentSum > s) { // 枝刈り
            return;
        }
        if (idx == endIdx) {
            possible1[(int)currentSum] = true;
            return;
        }
        generate1(idx + 1, endIdx, currentSum); // a[idx] を選ばない
        generate1(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
    }

    // 後半部分の和を列挙し、答えを探索
    static void findSolution(int idx, int endIdx, long currentSum) {
        if (found) return; // 既に発見済みなら即終了
        if (currentSum > s) { // 枝刈り
            return;
        }
        if (idx == endIdx) {
            long need = s - currentSum;
            if (need >= 0 && need <= s && possible1[(int)need]) {
                found = true;
            }
            return;
        }
        findSolution(idx + 1, endIdx, currentSum); // a[idx] を選ばない
        findSolution(idx + 1, endIdx, currentSum + a[idx]); // a[idx] を選ぶ
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // 1. 入力処理
        n = sc.nextInt();
        s = sc.nextLong();
        
        a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }
        
        possible1 = new boolean[(int)s + 1];
        
        // 2. 前半と後半に分けて処理
        int half1End = n / 2;
        
        generate1(0, half1End, 0);
        findSolution(half1End, n, 0);
        
        // 3. 結果出力
        if (found) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }
        
        sc.close();
    }
}