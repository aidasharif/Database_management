package generation.models;

import generation.enums.ContractType;
import generation.enums.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Contract {
    private static int idCounter = 0;
    private int id;
    private ContractType type;
    private int companyId;
    private Service service;
    private double annualContractValue;
    private double initialValue;
    private LocalDateTime startDate;

    public Contract() {
    }

    public Contract(ContractType type, int companyID, Service service,
                    double annualContractValue, double initialValue, LocalDateTime startDate) {
        this.id = ++idCounter;
        this.type = type;
        this.companyId = companyID;
        this.service = service;
        this.annualContractValue = annualContractValue;
        this.initialValue = initialValue;
        this.startDate = startDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ContractType getType() {
        return type;
    }

    public void setType(ContractType type) {
        this.type = type;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public double getAnnualContractValue() {
        return annualContractValue;
    }

    public void setAnnualContractValue(double annualContractValue) {
        this.annualContractValue = annualContractValue;
    }

    public double getInitialValue() {
        return initialValue;
    }

    public void setInitialValue(double initialValue) {
        this.initialValue = initialValue;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }
}
