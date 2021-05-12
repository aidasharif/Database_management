DROP TABLE IF EXISTS WorksOn;
DROP TABLE IF EXISTS Contract;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
  Id   INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(256) NOT NULL
);


CREATE TABLE Employee (
  Id           INT AUTO_INCREMENT PRIMARY KEY,
  Name         VARCHAR(256)                                     NOT NULL,
  DepartmentId INT                                              NOT NULL,
  Role         ENUM ('Manager', 'Sales Associate', 'Developer') NOT NULL,
  ManagerId    INT,

  FOREIGN KEY (DepartmentId) REFERENCES Department (Id),
  FOREIGN KEY (ManagerId) REFERENCES Employee (Id)
    ON DELETE SET NULL
);

CREATE INDEX idx_employee_role
  ON Employee (Role);

CREATE TABLE Company (
  Id               INT AUTO_INCREMENT PRIMARY KEY,
  Name             VARCHAR(256) NOT NULL,
  Address          VARCHAR(256) NOT NULL,
  ContactFirstName VARCHAR(256) NOT NULL,
  ContactLastName  VARCHAR(256) NOT NULL,
  ContactNumber    BIGINT(10)   NOT NULL,
  ContactEmail     VARCHAR(256) NOT NULL
);


CREATE TABLE Contract (
  Id                  INT                                                    AUTO_INCREMENT PRIMARY KEY,
  Type                ENUM ('Premium', 'Gold', 'Diamond', 'Silver') NOT NULL,
  CompanyId           INT                                           NOT NULL,
  AnnualContractValue DECIMAL(20, 2)                                NOT NULL,
  InitialAmount       DECIMAL(20, 2)                                NOT NULL,
  StartDate           DATETIME                                      NOT NULL DEFAULT NOW(),
  Service             ENUM ('Cloud', 'On-premises')                 NOT NULL,

  FOREIGN KEY (CompanyId) REFERENCES Company (Id)
);

CREATE INDEX idx_contract_type
  ON Contract (Type);
CREATE INDEX idx_contract_service
  ON Contract (Service);

CREATE TABLE WorksOn (
  EmployeeId INT,
  ContractId INT,

  CONSTRAINT WorksOn_pk PRIMARY KEY (EmployeeId, ContractId),
  CONSTRAINT chk_EmployeeID FOREIGN KEY (EmployeeId) REFERENCES Employee (Id) ON DELETE CASCADE,
  CONSTRAINT chk_ContractID FOREIGN KEY (ContractId) REFERENCES Contract (Id) ON DELETE CASCADE
);