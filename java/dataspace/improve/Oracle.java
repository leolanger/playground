public class Oracle extends base {
    public void registrationOracleDriver() {
        System.out.println("Registration Oracle Driver");
    }

    public void establishOracleConnection() {
        System.out.println("Establish Oracle Connection");
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
