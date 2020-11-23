public class Client {
    public static void main(String[] args) {
        MySQL db1 = new MySQL();
        System.out.println("测试MySQL链接操作");
        db1.linkOperation();
        Oracle db2 = new Oracle();
        System.out.println("测试Oracle链接操作");
        db2.linkOperation();
        Access db3 = new Access();
        System.out.println("测试Access链接操作");
        db3.linkOperation();
    }
}
