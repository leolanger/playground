import java.io.BufferedReader;
import java.io.*;
import java.util.NoSuchElementException;
import java.util.Scanner;
import java.nio.Buffer;

public class StorageData {
    public String create(Student[] student, Student createInfo, int no) {
        for (int i = 0; i < no; i++) {
            if (student[i].getStudentId() == createInfo.getStudentId())
                return "学号冲突！";
            if (student[i].getMobilePhoneNumber() == createInfo.getMobilePhoneNumber())
                return "手机号冲突!";
        }

        BufferedWriter out = null;

        student[no].setNo(createInfo.getNo());
        student[no].setName(createInfo.getName());
        student[no].setGender(createInfo.getGender());
        student[no].setStudentId(createInfo.getStudentId());
        student[no].setMobilePhoneNumber(createInfo.getMobilePhoneNumber());
        student[no].setMemo(createInfo.getMemo());
        try {
            out = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream("/home/leolanger/projects/java/java-playground/filesystem/info.txt", true)));
            out.newLine();
            out.write(String.format("%02d", student[no].getNo()) + '\t' + student[no].getName() + '\t'
                    + student[no].getGender() + '\t' + student[no].getStudentId() + '\t'
                    + student[no].getMobilePhoneNumber() + '\t' + student[no].getMemo() + '\t');
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return "success!";
    }

    public String findAll() {
        int i = 0;
        BufferedReader in = null;
        try {
            in = new BufferedReader(
                    new FileReader("/home/leolanger/projects/java/java-playground/filesystem/info.txt"));
            String line;
            while ((line = in.readLine()) != null)
                System.out.println(line);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return "success!";
    }

    public String findByStudengId(Student[] student, String findId, int no) {
        for (int i = 0; i < no; i++) {
            if (student[i].getStudentId() == findId) {
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

                return "success!";
            }
        }

        return "not found";
    }

    public String findByStudentName(Student[] student, String findName, int no) {
        for (int i = 0; i < no; i++) {
            if (student[i].getName() == findName) {
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

                return "success!";
            }
        }

        return "not found";
    }

    public String update(Student[] student, Student updateInfo, int no) {
        BufferedWriter out = null;

        for (int i = 0; i < no; i++) {
            if (student[i].getStudentId() == updateInfo.getStudentId()) {
                student[i].setName(updateInfo.getName());
                student[i].setGender(updateInfo.getGender());
                student[i].setStudentId(updateInfo.getStudentId());
                student[i].setMobilePhoneNumber(updateInfo.getMobilePhoneNumber());
                student[i].setMemo(updateInfo.getMemo());
                try {
                    out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
                            "/home/leolanger/projects/java/java-playground/filesystem/info.txt", false)));
                    for (int j = 0; j < no; j++) {
                        out.newLine();
                        out.write(String.format("%02d", student[no].getNo()) + '\t' + student[no].getName() + '\t'
                                + student[no].getGender() + '\t' + student[no].getStudentId() + '\t'
                                + student[no].getMobilePhoneNumber() + '\t' + student[no].getMemo() + '\t');
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        out.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

                return "success!";
            }
        }

        return "not found";
    }

    public String delete(Student[] student, Student deleteInfo, int no) {
        BufferedWriter out = null;

        for (int i = 0; i < no; i++) {
            if (student[i].getStudentId() == deleteInfo.getStudentId()) {
                student[i].setName(" ");
                student[i].setGender(" ");
                student[i].setStudentId(" ");
                student[i].setMobilePhoneNumber(" ");
                student[i].setMemo(" ");
                try {
                    out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
                            "/home/leolanger/projects/java/java-playground/filesystem/info.txt", false)));
                    for (int j = 0; j < no; j++) {
                        out.newLine();
                        out.write(String.format("%02d", student[no].getNo()) + '\t' + student[no].getName() + '\t'
                                + student[no].getGender() + '\t' + student[no].getStudentId() + '\t'
                                + student[no].getMobilePhoneNumber() + '\t' + student[no].getMemo() + '\t');
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        out.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

                return "删除成功";
            }
        }
        return "not found";
    }
}
