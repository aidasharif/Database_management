package generation.enums;

public enum DepartmentType {
    Development("Development"),
    QA("QA"),
    UI("UI"),
    Design("Design"),
    BusinessIntelligence("Business Intelligence"),
    Networking("Networking");

    private String value;

    DepartmentType(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
