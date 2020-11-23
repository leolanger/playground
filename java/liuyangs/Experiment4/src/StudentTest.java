import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.NoSuchElementException;
import java.util.Scanner;

public class StudentTest {
    static int count = 0; // 信息总条数，全局变量
    static Student[] student = new Student[100]; // 学生信息数组，静态全局变量

    public static void main(String args[]) {

        transferIntoArray(); // 将文件数据存入数组

        createStudentInformation(); // 添加学生信息
        findAllStudentInformation(); // 检索全部
        findByStudentIdInformation(); // 根据学号查找姓名
        findByStudentNameInformation(); // 根据姓名查找学生
        updateInformation(); // 更新（修改）学生信息
        deleteInformation(); // 删除学生信息

    }

    public static void transferIntoArray() {
        int i = 0;
        BufferedReader br = null;
        try {
            br = new BufferedReader(
                    new FileReader("/home/leolanger/projects/java/java-playground/liuyangs/Experiment4/student.txt"));
            String line = br.readLine(); // 先把表头读出
            for (i = 0; i < 100; i++) { // 对数组内的对象都开辟空间
                student[i] = new Student();
            }
            i = 0;
            while ((line = br.readLine()) != null) {
                Scanner scanner = new Scanner(line); // 以下方式可以过滤一行中的空格
                student[i].setNo(scanner.nextInt()); // 序号
                student[i].setName(scanner.next()); // 姓名
                student[i].setGender(scanner.next()); // 性别
                student[i].setStudentId(scanner.next()); // 学号
                student[i].setMobilePhoneNumber(scanner.next()); // 手机号
                try {
                    student[i].setMemo(scanner.next()); // 备注（可以不填）
                } catch (NoSuchElementException e) // 无内容错误，即没有备注
                {
                    student[i].setMemo(" ");
                }
                scanner.close();
                i++;
            }
            count = i;
        } catch (FileNotFoundException e) { // 找不到文件错误
            e.printStackTrace();
        } catch (IOException e) { // 读取行错误
            e.printStackTrace();
        } finally {
            try {
                br.close();
            } catch (IOException e) { // 文件关闭错误
                e.printStackTrace();
            }
        }
    }

    public static void createStudentInformation() {
        Student createStudent = new Student();
        StudentList studentList = new StudentList();
        System.out.println("请依次输入姓名 性别 学号 手机号 备注（可以不填）"); // TODO:学号、手机号位数控制未完成
        Scanner scanner_ = new Scanner(System.in); // 读取键盘输入
        String line = scanner_.nextLine();
        Scanner scanner = new Scanner(line); // 将读取的一行信息通过以下方式分解
        createStudent.setNo(count + 1);
        createStudent.setName(scanner.next()); // 姓名
        createStudent.setGender(scanner.next()); // 性别
        createStudent.setStudentId(scanner.next()); // 学号
        createStudent.setMobilePhoneNumber(scanner.next()); // 手机号
        try {
            createStudent.setMemo(scanner.next()); // 备注（可以不填）
        } catch (NoSuchElementException e) // 无内容错误，即没有备注
        {
            createStudent.setMemo(" ");
        }
        scanner.close();
        System.out.println(studentList.createInfo(student, createStudent, count)); // 调用添加信息方法
        count++;
    }

    public static void findAllStudentInformation() {
        Student findAllStudent = new Student();
        StudentList studentList = new StudentList();
        System.out.println("以下为检索到的全部学生信息");
        System.out.println(studentList.findAllInfo());
    }

    public static void findByStudentIdInformation() {
        System.out.println("请输入需要查找的学生信息的学号");
        Scanner scanner = new Scanner(System.in); // 读取键盘输入
        String findStudentId = scanner.next();
        StudentList studentList = new StudentList();
        System.out.println(studentList.findByStudentIdInfo(student, findStudentId, count));
    }

    public static void findByStudentNameInformation() {
        System.out.println("请输入需要查找的学生信息的姓名");
        Scanner scanner = new Scanner(System.in); // 读取键盘输入
        String findStudentName = scanner.next();
        StudentList studentList = new StudentList();
        System.out.println(studentList.findByStudentNameInfo(student, findStudentName, count));
    }

    public static void updateInformation() {
        Student updateStudent = new Student();
        StudentList studentList = new StudentList();
        System.out.println("请输入需要更新的学生信息的学号");
        Scanner scanner_1 = new Scanner(System.in); // 读取键盘输入
        updateStudent.setStudentId(scanner_1.next()); // 学号
        System.out.println("请依次输入需要更新的学生信息的姓名 性别 手机号 备注（可以不填）"); // TODO:学号、手机号位数控制未完成
        Scanner scanner_2 = new Scanner(System.in); // 读取键盘输入
        String line = scanner_2.nextLine();
        Scanner scanner = new Scanner(line); // 将读取的一行信息通过以下方式分解
        updateStudent.setName(scanner.next()); // 姓名
        updateStudent.setGender(scanner.next()); // 性别
        updateStudent.setMobilePhoneNumber(scanner.next()); // 手机号
        try {
            updateStudent.setMemo(scanner.next()); // 备注（可以不填）
        } catch (NoSuchElementException e) // 无内容错误，即没有备注
        {
            updateStudent.setMemo(" ");
        }
        scanner.close();
        System.out.println(studentList.updateInfo(student, updateStudent, count));
    }

    public static void deleteInformation() {
        Student deleteStudent = new Student();
        StudentList studentList = new StudentList();
        System.out.println("请输入需要删除的学生信息的学号");
        Scanner scanner_ = new Scanner(System.in); // 读取键盘输入
        String line = scanner_.nextLine();
        Scanner scanner = new Scanner(line); // 将读取的一行信息通过以下方式分解
        deleteStudent.setStudentId(scanner.next()); // 学号
        scanner.close();
        System.out.println(studentList.deleteInfo(student, deleteStudent, count));
    }
}