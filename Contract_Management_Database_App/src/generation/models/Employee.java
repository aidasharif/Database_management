package generation.models;

import generation.enums.Role;

public class Employee {

    private static int idCounter = 0;

    private int id;
    private String name;
    private int departmentId;
    private Role role;
    private Integer managerId;

    public Employee() {
        this.id = ++idCounter;
    }

    public Employee(String name, int departmentId, Role role, Integer managerId) {
        this();
        this.name = name;
        this.departmentId = departmentId;
        this.role = role;
        this.managerId = managerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFullName(){
        return name;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }
}
