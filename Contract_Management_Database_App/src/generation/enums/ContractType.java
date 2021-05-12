package generation.enums;

public enum ContractType {
    Gold("Gold"),
    Silver("Silver"),
    Premium("Premium"),
    Diamond("Diamond");

    private String value;

    ContractType(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
