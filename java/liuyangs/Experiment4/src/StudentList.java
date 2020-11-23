public class StudentList {
    private Storage storage;

    public StudentList() {
        setStorage(new TextFile());
    }

    public Storage getStorage() {
        return this.storage;
    }

    public void setStorage(Storage storage) {
        this.storage = storage;
    }

    public String createInfo(Student[] student, Student createStudent, int count) {
        return getStorage().create(student, createStudent, count);      //返回此storage对象，并调用接口中的create()方法，返回操作结果
    }

    public String findAllInfo() {
        return getStorage().findAll();     //返回此storage对象，并调用接口中的findAll()方法
    }

    public String findByStudentIdInfo(Student[] student, String findStudentId, int count) {
        return getStorage().findByStudentId(student, findStudentId, count);      //返回此storage对象，并调用接口中的findByStudentId(student,count)方法
    }

    public String findByStudentNameInfo(Student[] student, String findStudentName, int count) {
        return getStorage().findByStudentName(student, findStudentName, count);   //返回此storage对象，并调用接口中的findByStudentName(student,count)方法
    }

    public String updateInfo(Student[] student, Student updateStudent, int count) {
        return getStorage().update(student, updateStudent, count);  //返回此storage对象，并调用接口中的update(student,updateStudent,count)方法
    }

    public String deleteInfo(Student[] student, Student deleteStudent, int count) {
        return getStorage().delete(student, deleteStudent, count);  //返回此storage对象，并调用接口中的delete(student,deleteStudent,count)方法
    }
}
