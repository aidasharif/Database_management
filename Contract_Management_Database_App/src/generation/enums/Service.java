package generation.enums;

public enum Service {
    Cloud("Cloud"),
    OnPremise("On-premises");

    private String value;

    Service(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
