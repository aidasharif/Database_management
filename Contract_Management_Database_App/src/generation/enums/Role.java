package generation.enums;

public enum Role {
    Developer("Developer"),
    SalesAssociate("Sales Associate"),
    Manager("Manager");

    private String value;

    Role(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
