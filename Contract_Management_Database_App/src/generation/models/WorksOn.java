package generation.models;

public class WorksOn {
    private int employeeId;
    private int contractId;

    public WorksOn() {
    }

    public WorksOn(int employeeId, int contractId) {
        this.employeeId = employeeId;
        this.contractId = contractId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }
}
