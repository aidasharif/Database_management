package generation;

import generation.models.*;

import java.util.List;
import java.util.stream.Collectors;

public class CmsSqlGenerator {

    private List<Department> departments;
    private List<Employee> employees;
    private List<Company> companies;
    private List<Contract> contracts;
    private List<WorksOn> worksonRelationships;

    public CmsSqlGenerator(List<Department> departments, List<Employee> employees, List<Company> companies, List<Contract> contracts, List<WorksOn> worksonRelationships) {
        this.departments = departments;
        this.employees = employees;
        this.companies = companies;
        this.contracts = contracts;
        this.worksonRelationships = worksonRelationships;
    }

    public String generate(){
        StringBuilder builder = new StringBuilder();

        // Clean
        builder.append("SET SQL_SAFE_UPDATES = 0;").append(System.lineSeparator());
        builder.append("DELETE FROM WorksOn;").append(System.lineSeparator());
        builder.append("DELETE FROM Contract;").append(System.lineSeparator());
        builder.append("DELETE FROM Company;").append(System.lineSeparator());
        builder.append("DELETE FROM Employee;").append(System.lineSeparator());
        builder.append("DELETE FROM Department;").append(System.lineSeparator()).append(System.lineSeparator());

        // Departments
        String departmentValues = departments.stream()
                .map(d -> String.format("(%d, '%s')", d.getId(), d.getType().getValue()))
                .collect(Collectors.joining(", "));
        builder.append(String.format("INSERT INTO Department (Id, Name) VALUES %s;", departmentValues));

        builder.append(System.lineSeparator()).append(System.lineSeparator());

        // Employees
        String employeeValues = employees.stream()
                .map(d -> String.format("(%d, '%s', '%s', %d, %d)", d.getId(), d.getRole().getValue(), d.getName(), d.getDepartmentId(), d.getManagerId()))
                .collect(Collectors.joining(", "));
        builder.append(String.format("INSERT INTO Employee (Id, Role, Name, DepartmentId, ManagerId) VALUES %s;", employeeValues));

        builder.append(System.lineSeparator()).append(System.lineSeparator());

        // Companies
        String companyValues = companies.stream()
                .map(d -> String.format("(%d, '%s', '%s', '%s', '%s', %d, '%s')",
                        d.getId(), d.getName(), d.getAddress(), d.getContactFirstName(), d.getContactLastName(), d.getContactNumber(), d.getContactEmail()))
                .collect(Collectors.joining(", "));
        builder.append(String.format("INSERT INTO Company (Id, Name, Address, ContactFirstName, ContactLastName, ContactNumber, ContactEmail) VALUES %s;", companyValues));

        builder.append(System.lineSeparator()).append(System.lineSeparator());

        // Contracts
        String contractValues = contracts.stream()
                .map(d -> String.format("(%d, '%s', %d, %f, %f, '%s', '%s')",
                        d.getId(), d.getType().getValue(), d.getCompanyId(), d.getAnnualContractValue(),
                        d.getInitialValue(), d.getService().getValue(), d.getStartDate().toString()))
                .collect(Collectors.joining(", "));
        builder.append(String.format("INSERT INTO Contract (Id, Type, CompanyId, AnnualContractValue, InitialAmount, Service, StartDate) VALUES %s;", contractValues));

        builder.append(System.lineSeparator()).append(System.lineSeparator());

        // Works on
        String worksOnValues = worksonRelationships.stream()
                .map(d -> String.format("(%d, %d)", d.getEmployeeId(), d.getContractId()))
                .collect(Collectors.joining(", "));
        builder.append(String.format("INSERT INTO WorksOn (EmployeeId, ContractId) VALUES %s;", worksOnValues));

        return builder.toString();
    }

}
