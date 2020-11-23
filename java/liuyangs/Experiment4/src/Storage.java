public interface Storage {
    public String create(Student[] student, Student createStudent, int count);

    public String findAll();

    public String findByStudentId(Student[] student, String findStudentId, int count);

    public String findByStudentName(Student[] student, String findStudentName, int count);

    public String update(Student[] student, Student updateStudent, int count);

    public String delete(Student[] student, Student deleteStudent, int count);
}
