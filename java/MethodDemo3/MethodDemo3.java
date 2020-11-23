public class MethodDemo3 {
    public static void main(String[] args) {
        System.out.println(fun(10, 20));
        System.out.println(fun(10, 20, 30));
        System.out.println(fun(10.0f, 20.5f));
    }

    public static int fun(int a, int b) {
        return a + b;
    }

    public static int fun(int a, int b, int c) {
        return a + b + c;
    }

    public static float fun(float a, float b) {
        return a + b;
    }
}