import java.util.Scanner;

public class Demo4 {
    public static void main(String[] args) {
        int num[] = { 8, 4, 2, 1, 23, 344, 12 };
        Scanner input = new Scanner(System.in);
        int flag = 0;
        int an = input.nextInt();
        for (int i = 0; i < 8; i++) {
            if (num[i] == an) {
                flag = 1;
                break;
            }
        }
        if (flag == 1) {
            System.out.println("founded!");
        } else {
            System.out.println("not founded!");
        }
        input.close();
    }
}