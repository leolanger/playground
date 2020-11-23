public abstract class base {
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

    final public void linkOperation() {
        registrationDriver();
        establishConnection();
        createExecuteStatements();
        executeStatement();
        processingResults();
        freeResource();
    }

    public abstract void registrationDriver();

    public abstract void establishConnection();
}
