public class Oracle {
    public void registrationOracleDriver() {
        System.out.println("Registration Oracle Driver");
    }

    public void establishOracleConnection() {
        System.out.println("Establish Oracle Connection");
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
        registrationOracleDriver();
        establishOracleConnection();
        createExecuteStatements();
        executeStatement();
        processingResults();
        freeResource();
    }

}