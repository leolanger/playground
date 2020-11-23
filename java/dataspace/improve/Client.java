public class Client {
    public static void main(String[] args) {
        MySQL db1 = new MySQL();
        System.out.println("测试MySQL链接操作");
        db1.linkOperation();
        Oracle db2 = new Oracle();
        System.out.println("测试Oracle链接操作");
        db2.linkOperation();
    }
}
