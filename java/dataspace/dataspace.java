class dataspace {
    public static void main(String[] args) {
        Oracle db1 = new Oracle();
        System.out.println("测试Oracle链接操作");
        db1.linkOperation();
        MySQL db2 = new MySQL();
        System.out.println("测试MySQL链接操作");
        db2.linkOperation();
    }
}
