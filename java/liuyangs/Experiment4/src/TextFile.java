import java.io.*;
import java.nio.Buffer;
import java.util.NoSuchElementException;
import java.util.Scanner;

public class TextFile implements Storage {
    public void writeToFile(Student[] student, int count) { // 将数组内的信息写回文件
        BufferedReader br = null;
        BufferedWriter bw = null;
        try {
            br = new BufferedReader(
                    new FileReader("/home/leolanger/projects/java/java-playground/liuyangs/Experiment4/student.txt"));
            String line = br.readLine(); // 读出表头
            bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
                    "/home/leolanger/projects/java/java-playground/liuyangs/Experiment4/student.txt", false)));
            bw.write(line); // 写入表头
            for (int i = 0; i < count; i++) { // 依次写入每一行
                if (!student[i].getStudentId().equals(" ")) {
                    bw.newLine();
                    bw.write(String.format("%02d", student[i].getNo()) + '\t' + student[i].getName() + '\t'
                            + student[i].getGender() + '\t' + student[i].getStudentId() + '\t'
                            + student[i].getMobilePhoneNumber() + '\t' + student[i].getMemo() + '\t');
                }
            }
        } catch (IOException e) { // 写入错误
            e.printStackTrace();
        } finally {
            try {
                br.close();
                bw.close();
            } catch (IOException e) { // 文件关闭错误
                e.printStackTrace();
            }
        }
    }

    @Override
    public String create(Student[] student, Student createStudent, int count) {
        // boolean exist = false;
        for (int i = 0; i < count; i++) {
            if (student[i].getStudentId().equals(createStudent.getStudentId()))
                return "学号已经在信息表中，不可再添加";
            if (student[i].getMobilePhoneNumber().equals(createStudent.getMobilePhoneNumber()))
                return "手机号已经在信息表中，不可再添加";
        }
        // 输入的学号与手机号没有在信息表中出现的时候才可以添加
        BufferedWriter bw = null;
        try {
            student[count].setNo(createStudent.getNo());
            student[count].setName(createStudent.getName());
            student[count].setGender(createStudent.getGender());
            student[count].setStudentId(createStudent.getStudentId());
            student[count].setMobilePhoneNumber(createStudent.getMobilePhoneNumber());
            student[count].setMemo(createStudent.getMemo());
            bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
                    "/home/leolanger/projects/java/java-playground/liuyangs/Experiment4/student.txt", true)));
            bw.newLine();
            bw.write(String.format("%02d", createStudent.getNo()) + '\t' + createStudent.getName() + '\t'
                    + createStudent.getGender() + '\t' + createStudent.getStudentId() + '\t'
                    + createStudent.getMobilePhoneNumber() + '\t' + createStudent.getMemo() + '\t');
        } catch (IOException e) { // 写入错误
            e.printStackTrace();
        } finally {
            try {
                bw.close();
            } catch (IOException e) { // 文件关闭错误
                e.printStackTrace();
            }
        }
        return "添加成功";
    }

    @Override
    public String findAll() {
        int i = 0;
        BufferedReader br = null;
        try {
            br = new BufferedReader(
                    new FileReader("/home/leolanger/projects/java/java-playground/liuyangs/Experiment4/student.txt"));
            String line;
            while ((line = br.readLine()) != null)
                System.out.println(line);
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
        return "检索完毕";
    }

    @Override
    public String findByStudentId(Student[] student, String findStudentId, int count) {
        for (int i = 0; i < count; i++) {
            if (student[i].getStudentId().equals(findStudentId)) // 判断字符串相等
            {
                System.out.print(String.format("%02d", student[i].getNo()));
                System.out.print('\t' + student[i].getName());
                System.out.print('\t' + student[i].getGender());
                System.out.print('\t' + student[i].getStudentId());
                System.out.print('\t' + student[i].getMobilePhoneNumber());
                try {
                    System.out.print('\t' + student[i].getMemo());
                } catch (NoSuchElementException e) {
                    System.out.print(" ");
                } finally {
                    System.out.println('\r');
                }
                return "查找成功";
            }
        }
        return "没有查找到此学生";
    }

    @Override
    public String findByStudentName(Student[] student, String findStudentName, int count) {
        boolean find = false;
        for (int i = 0; i < count; i++) {
            if (student[i].getName().equals(findStudentName)) // 判断字符串相等
            {
                System.out.print(String.format("%02d", student[i].getNo()));
                System.out.print('\t' + student[i].getName());
                System.out.print('\t' + student[i].getGender());
                System.out.print('\t' + student[i].getStudentId());
                System.out.print('\t' + student[i].getMobilePhoneNumber());
                try {
                    System.out.print('\t' + student[i].getMemo());
                } catch (NoSuchElementException e) {
                    System.out.print(" ");
                } finally {
                    System.out.println('\r');
                }
                find = true;
            }
        }
        if (find)
            return "查找成功";
        else
            return "没有查找到此学生";
    }

    @Override
    public String update(Student[] student, Student updateStudent, int count) {
        for (int i = 0; i < count; i++) {
            if (student[i].getStudentId().equals(updateStudent.getStudentId())) {
                student[i].setName(updateStudent.getName());
                student[i].setGender(updateStudent.getGender());
                student[i].setStudentId(updateStudent.getStudentId());
                student[i].setMobilePhoneNumber(updateStudent.getMobilePhoneNumber());
                student[i].setMemo(updateStudent.getMemo());
                writeToFile(student, count);
                return "修改成功";
            }
        }
        return "没有查找到此学生";
    }

    @Override
    public String delete(Student[] student, Student deleteStudent, int count) {
        for (int i = 0; i < count; i++) {
            if (student[i].getStudentId().equals(deleteStudent.getStudentId())) {
                student[i].setName(" ");
                student[i].setGender(" ");
                student[i].setStudentId(" ");
                student[i].setMobilePhoneNumber(" ");
                student[i].setMemo(" ");
                writeToFile(student, count);
                return "删除成功";
            }
        }
        return "没有查找到此学生";
    }
}
