package generation;

import com.github.javafaker.Faker;
import generation.enums.ContractType;
import generation.enums.DepartmentType;
import generation.enums.Role;
import generation.enums.Service;
import generation.models.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.stream.Collectors;

public class CmsDataBuilder {

    private List<Department> departments;
    private List<Employee> managers;
    private List<Employee> developers;
    private List<Employee> salesAssociates;
    private List<Company> companies;
    private List<Contract> contracts;
    private List<WorksOn> worksonRelationships;

    private Faker faker;
    private RandomDataGenerator dataGenerator;


    public CmsDataBuilder(RandomDataGenerator dataGenerator) {
        this.faker = dataGenerator.getFaker();
        this.dataGenerator = dataGenerator;
    }

    private List<Employee> getEmployees() {
        ArrayList<Employee> employees = new ArrayList<>();
        employees.addAll(managers);
        employees.addAll(salesAssociates);
        employees.addAll(developers);
        return employees;
    }

    public CmsDataBuilder addEmployees(int managerCount, int salesAssociateCount, int devCount,
                                       ArrayList<String> requiredManagers, ArrayList<String> requiredDevelopers,
                                       HashMap<String, String> requiredManagerAssociations) {

        addDepartments();
        managers = new ArrayList<>();
        salesAssociates = new ArrayList<>();
        developers = new ArrayList<>();

        int departmentIdCount = 0;
        for (int i = 0; i < managerCount; i++) {

            String name = requiredManagers.isEmpty() ? dataGenerator.getName() : requiredManagers.remove(0);

            managers.add(new Employee(
                    name,
                    departmentIdCount++ % departments.size() + 1,
                    Role.Manager,
                    null));
        }

        for (int i = 0; i < salesAssociateCount; i++) {

            Employee manager = managers.get(i % managers.size());

            salesAssociates.add(new Employee(
                    dataGenerator.getName(),
                    manager.getDepartmentId(),
                    Role.SalesAssociate,
                    manager.getId()));
        }

        for (int i = 0; i < devCount; i++) {

            String name = requiredDevelopers.isEmpty() ? dataGenerator.getName() : requiredDevelopers.remove(0);

            String requiredManager = requiredManagerAssociations.get(name);

            Employee manager = requiredManager != null
                    ? managers.stream().filter(m -> m.getFullName().equals(requiredManager)).findFirst().get()
                    : managers.get(i % managerCount);

            developers.add(new Employee(
                    name,
                    manager.getDepartmentId(),
                    Role.Developer,
                    manager.getId()));
        }

        return this;
    }

    public CmsDataBuilder addContracts(int contractCount, int companyCount, String fromDateString,
                                       String toDateString, List<String> requiredCompanies) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime fromDate = LocalDateTime.parse(fromDateString, formatter);
        LocalDateTime toDate = LocalDateTime.parse(toDateString, formatter);

        companies = new ArrayList<>();
        contracts = new ArrayList<>();

        for (int i = 0; i < companyCount; i++) {

            String contactFirstName = dataGenerator.getFirstName();
            String contactLastName = dataGenerator.getLastName();
            String contactEmail = contactFirstName.toLowerCase() + "." + contactLastName.toLowerCase() + "@" + faker.internet().domainName();

            String phone = faker.phoneNumber().cellPhone().replaceAll("[^0-9]", "");
            phone = phone.substring(0, Math.min(phone.length(), 10));
            companies.add(new Company(
                    requiredCompanies.isEmpty() ? dataGenerator.getCompanyName() : requiredCompanies.remove(0),
                    contactFirstName,
                    contactLastName,
                    Long.parseLong(phone),
                    contactEmail,
                    dataGenerator.getAddress()
            ));
        }

        int weeks = (int)ChronoUnit.WEEKS.between(fromDate, toDate);

        ContractType[] possibleTypes = ContractType.values();
        Service[] possibleServices = Service.values();
        for (int i = 0; i < contractCount; i++) {
            contracts.add(new Contract(
                    possibleTypes[i % possibleTypes.length],
                    i % companyCount + 1,
                    possibleServices[i % possibleServices.length],
                    faker.number().randomDouble(2, 10000, 35000),
                    faker.number().randomDouble(2, 500, 2000),
                    fromDate.plusWeeks(dataGenerator.getBetween(0, weeks))
            ));
        }

        // Must have at least one Gold contract between June 1 2017 - June 10 2017 for A1 queries
        Contract c = contracts.get(dataGenerator.getBetween(0, contracts.size()-1));
        c.setStartDate(LocalDateTime.parse("2017-06-07 12:00", formatter));
        c.setType(ContractType.Gold);

        return this;
    }

    public CmsDataBuilder addWorksOnRelationship(int minDevsPerContract, int maxDevsPerContract) {

        List<Employee> shuffledManagers = new ArrayList<>(managers);
        Collections.shuffle(shuffledManagers);

        List<Employee> shuffledSalesAssociates = new ArrayList<>(salesAssociates);
        Collections.shuffle(shuffledSalesAssociates);

        List<Employee> shuffledDevelopers = new ArrayList<>(developers);
        Collections.shuffle(shuffledDevelopers);

        worksonRelationships = new ArrayList<>();

        int devCounter = 0;

        for (int i = 0; i < contracts.size(); i++) {

            Contract contract = contracts.get(i);
            // Add manager
            worksonRelationships.add(new WorksOn(shuffledManagers.get(i % shuffledManagers.size()).getId(), contract.getId()));
            // Add sales associate
            worksonRelationships.add(new WorksOn(shuffledSalesAssociates.get(i % shuffledSalesAssociates.size()).getId(), contract.getId()));

            // Add employees
            int devsPerContract = dataGenerator.getBetween(minDevsPerContract, maxDevsPerContract);
            for (int j = 0; j < devsPerContract; j++) {
                worksonRelationships.add(new WorksOn(shuffledDevelopers.get(devCounter++ % shuffledDevelopers.size()).getId(), contract.getId()));
            }
        }

        return this;
    }

    public String build() {
        return new CmsSqlGenerator(departments, getEmployees(), companies, contracts, worksonRelationships).generate();
    }

    private CmsDataBuilder addDepartments() {
        departments = Arrays.stream(DepartmentType.values())
                .map(Department::new)
                .collect(Collectors.toList());

        return this;
    }


}
