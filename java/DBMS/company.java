import java.sql.*;

public class company {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "rm-bp1oo27t8762xhlob0o.mysql.rds.aliyuncs.com";

    static final String USER = "lab_1025895050";
    static final String PASS = "8d5c0f292b07_#@Aa";

    static void select1(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        int param = Integer.parseInt(args[4]);
        sql = "SELECT ESSN FROM works_on WHERE PNO = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, param);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            int ESSN = rs.getInt("ESSN");

            // print results
            System.out.print("ESSN: " + ESSN);
            System.out.print("\n");
        }
        rs.close();
    }

    static void select2(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        String param = args[4];
        sql = "SELECT employee.ENAME FROM works_on, project, employee WHERE employee.ESSN = works_on.ESSN AND works_on.PNO = project.PNO AND project.PNO LIKE ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, param);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String ENAME = rs.getString("ENAME");
            System.out.print("ENAME: " + ENAME);
            System.out.print("\n");
        }
        rs.close();
    }

    static void select3(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        String param = args[4];
        sql = "SELECT employee.ENAME, employee.ADDRESS FROM employee, department WHERE department.DNO = employee.DNO AND department.DNAME LIKE ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, param);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String ENAME = rs.getString("ENAME");
            String ADDRESS = rs.getString("ADDRESS");
            System.out.print("ENAME: " + ENAME);
            System.out.print("ADDRESS: " + ADDRESS);
            System.out.print("\n");
        }
        rs.close();
    }

    static void select4(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        String param1 = args[4];
        int param2 = Integer.parseInt(args[5]);
        sql = "SELECT employee.ENAME, employee.ADDRESS FROM employee, department WHERE department.DNO = employee.DNO AND department.DNAME LIKE ? AND employee.SALARY < ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, param1);
        stmt.setInt(2, param2);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String ENAME = rs.getString("ENAME");
            String ADDRESS = rs.getString("ADDRES");
            System.out.print("ENAME: " + ENAME);
            System.out.print("ADDRESS: " + ADDRESS);
            System.out.print("\n");
        }
        rs.close();
    }

    static void select5(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        int param = Integer.parseInt(args[4]);
        sql = "SELECT employee.ENAME FROM works_on, employee WHERE employee.ESSN = works_on.ESSN AND works_on.PNO <> ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, param);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String ENAME = rs.getString("ENAME");
            System.out.print("ENAME: " + ENAME);
            System.out.print("\n");
        }
        rs.close();
    }

    static void select6(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        String param = args[4];
        sql = "SELECT e1.ENAME, department.DNAME FROM employee AS e1, employee AS e2, department WHERE e1.SUPERESSN = e2.ESSN AND e1.DNO = department.DNO AND e2.ENAME LIKE ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, param);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String ENAME = rs.getString("ENAME");
            String DNAME = rs.getString("DNAME");
            System.out.print("ENAME: " + ENAME);
            System.out.print("DNAME: " + DNAME);
            System.out.print("\n");
        }
        rs.close();
    }

    static void select7(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        int param1 = Integer.parseInt(args[4]);
        int param2 = Integer.parseInt(args[5]);
        sql = "SELECT employee.ESSN FROM employee, works_on WHERE employee.ESSN = works_on.ESSN AND works.PNO = ? AND employee.ESSN IN (SELECT employee.ESSN FROM employee, department WHERE department.ESSN = employee.ESSN AND works_on.PNO = ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, param1);
        stmt.setInt(2, param2);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            int ESSN = rs.getInt("ESSN");
            System.out.print("ESSN: " + ESSN);
            System.out.print("\n");
        }
        rs.close();
    }

    static void select8(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        int param = Integer.parseInt(args[4]);
        sql = "SELECT department.DNAME FROM employee, department WHERE employee.DNO = department.DNO GROUP by employee.DNO HAVING AVG(employee.SALARY) < ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, param);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String DNAME = rs.getString("DNAME");
            System.out.print("DNAME: " + DNAME);
            System.out.print("\n");
        }
        rs.close();
    }

    static void select9(Connection conn, PreparedStatement stmt, String[] args) throws SQLException {
        String sql;
        int param1 = Integer.parseInt(args[4]);
        int param2 = Integer.parseInt(args[5]);
        sql = "SELECT employee.ENAME FROM employee, works_on WHERE employee.ESSN = works_on.ESSN GROUP by works_on.ESSN HAVING COUNT(*) > ? AND SUM(HOURS_PER_WEEK) < ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, param1);
        stmt.setInt(2, param2);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String ENAME = rs.getString("ENAME");
            System.out.print("ENAME: " + ENAME);
            System.out.print("\n");
        }
        rs.close();
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;

        Class.forName(JDBC_DRIVER);

        // build a connection to database
        System.out.println("connecting database ...");
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        int number = Integer.parseInt(args[2]);

        switch (number) {
            case 1:
                select1(conn, stmt, args);
                break;
            case 2:
                select2(conn, stmt, args);
                break;
            case 3:
                select3(conn, stmt, args);
                break;
            case 4:
                select4(conn, stmt, args);
                break;
            case 5:
                select5(conn, stmt, args);
                break;
            case 6:
                select6(conn, stmt, args);
                break;
            case 7:
                select7(conn, stmt, args);
                break;
            case 8:
                select8(conn, stmt, args);
                break;
            case 9:
                select9(conn, stmt, args);
                break;
        }
        stmt.close();
        conn.close();
    }
}