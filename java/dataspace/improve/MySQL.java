public class MySQL extends base {
    public void registrationMySQLDriver() {
        System.out.println("Registration MySQL Driver");
    }

    public void establishMySQLConnection() {
        System.out.println("Establish MySQL Connection");
    }

    public void linkOperation() {
        registrationMySQLDriver();
        establishMySQLConnection();
        createExecuteStatements();
        executeStatement();
        processingResults();
        freeResource();
    }
}
