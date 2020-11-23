import org.junit.*;
import org.junit.runners.MethodSorters;
import java.io.*;
import java.util.NoSuchElementException;
import java.util.Scanner;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class fileJunit {
    private String result;
    private Student stuTest = null;
    private StorageData data = null;
    static int no = 0;
    static Student[] student = new Student[100];

    @Before
    public void init() {
        stuTest = new Student();
        data = new StorageData();
        transferIntoArray();
    }

    @Test
    public void test1() {
        stuTest.setNo(no + 1);
        stuTest.setName("Kobe");
        stuTest.setGender("male");
        stuTest.setStudentId("1911103");
        stuTest.setMobilePhoneNumber("13711112222");
        stuTest.setMemo("first");
        result = data.create(student, stuTest, no);
        System.out.println(result);
        Assert.assertEquals("success!", result);
        no++;
    }

    @Test
    public void test2_OnlyOneStudentId() {
        stuTest.setNo(no + 1);
        stuTest.setName("James");
        stuTest.setGender("male");
        stuTest.setStudentId("1911101");
        stuTest.setMobilePhoneNumber("13711113333");
        stuTest.setMemo("second");
        result = data.create(student, stuTest, no);
        System.out.println(result);
        Assert.assertEquals("学号冲突！", result);
    }

    @Test
    public void test3_OnlyOneMobilePhoneNumber() {
        stuTest.setNo(no + 1);
        stuTest.setName("Ingram");
        stuTest.setGender("male");
        stuTest.setStudentId("1911104");
        stuTest.setMobilePhoneNumber("13711119999");
        stuTest.setMemo("third");
        result = data.create(student, stuTest, no);
        System.out.println(result);
        Assert.assertEquals("手机号冲突！", result);
    }

    @Test
    public void test4_FindAll() {
        data.findAll();
    }

    @Test
    public void test5_FindByStudentId() {
        stuTest.setStudentId("1911101");
        result = data.findByStudengId(student, stuTest.getStudentId(), no);
        System.out.println(result);
        Assert.assertEquals("success!", result);
    }

    @Test
    public void test6_FindByStudentName() {
        stuTest.setName("Curry");
        result = data.findByStudentName(student, stuTest.getName(), no);
        System.out.println("result");
        Assert.assertEquals("success!", result);
    }

    @Test
    public void test7_Update() {
        stuTest.setName("Durant");
        stuTest.setGender("male");
        stuTest.setStudentId("1911102");
        stuTest.setMobilePhoneNumber("13711114444");
        stuTest.setMemo("forth");
        result = data.update(student, stuTest, no);
        System.out.println(result);
        Assert.assertEquals("success!", result);
    }

    @Test
    public void test8_Delete() {
        stuTest.setStudentId("1911101");
        result = data.delete(student, stuTest, no);
        System.out.println(result);
        Assert.assertEquals("success!", result);
    }

    @After
    public void close() {
        System.out.println("end!");
    }

    public static void transferIntoArray() {
        int i = 0;
        BufferedReader br = null;
        try {
            br = new BufferedReader(
                    new FileReader("/home/leolanger/projects/java/java-playground/filesystem/info.txt"));
            String line = br.readLine();
            for (i = 0; i < 100; i++) {
                student[i] = new Student();
            }
            i = 0;
            while ((line = br.readLine()) != null) {
                Scanner scanner = new Scanner(line);
                student[i].setNo(scanner.nextInt());
                student[i].setName(scanner.next());
                student[i].setGender(scanner.next());
                student[i].setStudentId(scanner.next());
                student[i].setMobilePhoneNumber(scanner.next());
                try {
                    student[i].setMemo(scanner.next());
                } catch (NoSuchElementException e) {
                    student[i].setMemo(" ");
                }
                scanner.close();
                i++;
            }
            no = i;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                br.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
