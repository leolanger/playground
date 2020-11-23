public class MethodDemo1 {
    public static void main(String[] args) {
        int sum1 = add(10, 20);
        int sum2 = add(30, 40);
        System.out.println(sum1);
        System.out.println(sum2);
    }

    public static int add(int a, int b) {
        return a + b;
    }
}