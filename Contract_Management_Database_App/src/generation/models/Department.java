package generation.models;

import generation.enums.DepartmentType;

public class Department {

    private static int idCounter = 0;
    private int id;
    private DepartmentType type;

    public Department() {
        this.id = ++idCounter;
    }

    public Department(DepartmentType type) {
        this();
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public DepartmentType getType() {
        return type;
    }

    public void setType(DepartmentType type) {
        this.type = type;
    }
}
