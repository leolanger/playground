public class MySQL {
    public void registrationMySQLDriver() {
        System.out.println("Registration MySQL Driver");
    }

    public void establishMySQLConnection() {
        System.out.println("Establish MySQL Connection");
    }

    public void createExecuteStatements() {
        System.out.println("Create Execute Statements");
    }

    public void executeStatement() {
        System.out.println("Execute Statement");
    }

    public void processingResults() {
        System.out.println("Processing Results");
    }

    public void freeResource() {
        System.out.println("Free Resource");
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