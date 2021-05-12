# QUESTION 1
# List of employees who are exclusively working on contracts providing cloud services.
# -------------------------------------------------------------------------------------

# Select where employee is working on a contract and none of those contracts belong to non-cloud
SELECT DISTINCT E.Id, E.Name, E.Role
FROM Employee E
  INNER JOIN WorksOn WO ON WO.EmployeeId = E.Id
WHERE WO.EmployeeId NOT IN (SELECT DISTINCT WO.EmployeeId
                            FROM WorksOn WO
                              INNER JOIN Contract Co ON Co.Id = WO.ContractId
                            WHERE Co.Service != 'Cloud') ORDER BY E.Id;

# QUESTION 2
# Give employee ID's of all developers.
# -------------------------------------------------------------------------------------
SELECT Id, Name, Role
FROM Employee
WHERE Role = 'Developer';

# QUESTION 3
# Give list of all the employees who are working on contracts with ACV of at least 20,000$.
# -------------------------------------------------------------------------------------
SELECT DISTINCT E.Id, E.Name, E.Role
FROM Employee E
  INNER JOIN WorksOn WO ON WO.EmployeeId = E.Id
  INNER JOIN Contract Co ON Co.Id = WO.ContractId
WHERE Co.AnnualContractValue >= 20000;

# QUESTION 4
# List of all the contracts managed by "Van David".
# -------------------------------------------------------------------------------------
SELECT E.Name AS Manager, Co.*
FROM WorksOn WO
  INNER JOIN Contract Co ON Co.Id = WO.ContractId
  INNER JOIN Employee E ON WO.EmployeeId = E.Id
WHERE Name = 'Van David';