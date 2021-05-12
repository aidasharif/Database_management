SET SQL_SAFE_UPDATES = 0;
DELETE FROM WorksOn;
DELETE FROM Contract;
DELETE FROM Company;
DELETE FROM LineOfBusiness;
DELETE FROM Employee;
DELETE FROM Department;

INSERT INTO Department (Id, Name)
VALUES (1, 'Development'), (2, 'QA'), (3, 'UI'), (4, 'Design'), (5, 'Business Intelligence'), (6, 'Networking');

INSERT INTO Employee (Id, Role, Name, DepartmentId, ManagerId)
VALUES (1, 'Technical Account Manager', 'Telly Schaefer', 1, null),
  (2, 'Technical Account Manager', 'Shannon Ondricka', 1, null), (3, 'Manager', 'Van David', 1, 1),
  (4, 'Manager', 'David', 2, 2), (5, 'Manager', 'Linda Stamm', 3, 1), (6, 'Manager', 'Alexys Pagac', 4, 2),
  (7, 'Manager', 'Burley Gusikowski', 5, 1), (8, 'Manager', 'Juana Gleichner', 6, 2),
  (9, 'Sales Associate', 'Carlo McLaughlin', 1, 3), (10, 'Sales Associate', 'Clotilde Schultz', 2, 4),
  (11, 'Sales Associate', 'Jaiden Beier', 3, 5), (12, 'Sales Associate', 'Lessie Stoltenberg', 4, 6),
  (13, 'Sales Associate', 'Selmer Feest', 5, 7), (14, 'Sales Associate', 'Hassie O''Connell', 6, 8),
  (15, 'Sales Associate', 'Georgianna Brekke', 1, 3), (16, 'Sales Associate', 'Brooklyn Barrows', 2, 4),
  (17, 'Sales Associate', 'Rosetta Hills', 3, 5), (18, 'Sales Associate', 'Winston Mraz', 4, 6),
  (19, 'Developer', 'Josh Fetcher', 2, 4), (20, 'Developer', 'Haylee Swift', 2, 4),
  (21, 'Developer', 'Marian Hand', 3, 5), (22, 'Developer', 'Thaddeus Jones', 4, 6),
  (23, 'Developer', 'Marianne Pollich', 5, 7), (24, 'Developer', 'Genevieve Lehner', 6, 8),
  (25, 'Developer', 'Marilyne Schultz', 1, 3), (26, 'Developer', 'Nelda McGlynn', 2, 4),
  (27, 'Developer', 'Rylan Simonis', 3, 5), (28, 'Developer', 'Freeda Ledner', 4, 6),
  (29, 'Developer', 'Pierre Christiansen', 5, 7), (30, 'Developer', 'Alessandra Casper', 6, 8),
  (31, 'Developer', 'Jessika Koelpin', 1, 3), (32, 'Developer', 'Isac Hodkiewicz', 2, 4),
  (33, 'Developer', 'Stephania Kautzer', 3, 5), (34, 'Developer', 'Chaya Cummerata', 4, 6),
  (35, 'Developer', 'Sherman Weissnat', 5, 7), (36, 'Developer', 'America Littel', 6, 8),
  (37, 'Developer', 'Wilford Upton', 1, 3), (38, 'Developer', 'Catharine Vandervort', 2, 4),
  (39, 'Developer', 'Verda Schultz', 3, 5), (40, 'Developer', 'Oren Bernier', 4, 6),
  (41, 'Developer', 'Mavis Will', 5, 7), (42, 'Developer', 'Layla Durgan', 6, 8),
  (43, 'Developer', 'Lowell Littel', 1, 3), (44, 'Developer', 'Meredith Schinner', 2, 4),
  (45, 'Developer', 'Kariane Sawayn', 3, 5), (46, 'Developer', 'Lorena Goodwin', 4, 6),
  (47, 'Developer', 'Libby Schamberger', 5, 7), (48, 'Developer', 'Helmer Paucek', 6, 8),
  (49, 'Developer', 'Catalina Predovic', 1, 3), (50, 'Developer', 'Ethelyn Rogahn', 2, 4),
  (51, 'Developer', 'Kurt Kohler', 3, 5), (52, 'Developer', 'Sarai Stanton', 4, 6),
  (53, 'Developer', 'Emilio Koelpin', 5, 7), (54, 'Developer', 'Bettye Koss', 6, 8),
  (55, 'Developer', 'Conner Muller', 1, 3), (56, 'Developer', 'Lucile Keeling', 2, 4),
  (57, 'Developer', 'Anastacio Gottlieb', 3, 5), (58, 'Developer', 'Imelda Toy', 4, 6),
  (59, 'Developer', 'Elenor Stamm', 5, 7), (60, 'Developer', 'Winifred Armstrong', 6, 8),
  (61, 'Developer', 'Myra Armstrong', 1, 3), (62, 'Developer', 'Madison Dietrich', 2, 4),
  (63, 'Developer', 'Vincenza Hoppe', 3, 5), (64, 'Developer', 'Laney Blick', 4, 6),
  (65, 'Developer', 'Justina Kulas', 5, 7), (66, 'Developer', 'Elody Halvorson', 6, 8),
  (67, 'Developer', 'Alexandro Stark', 1, 3), (68, 'Developer', 'Manuel Tillman', 2, 4),
  (69, 'Developer', 'Aurelie Dach', 3, 5), (70, 'Developer', 'Hanna Cormier', 4, 6),
  (71, 'Developer', 'Delpha Hansen', 5, 7), (72, 'Developer', 'Brandy Sauer', 6, 8),
  (73, 'Developer', 'Anabel Gulgowski', 1, 3), (74, 'Developer', 'Mandy Tremblay', 2, 4),
  (75, 'Developer', 'Maymie Harber', 3, 5), (76, 'Developer', 'Freeda Bernhard', 4, 6),
  (77, 'Developer', 'Joanie Labadie', 5, 7), (78, 'Developer', 'Santina Brown', 6, 8);

INSERT INTO Company (Id, Name, Address, ContactFirstName, ContactLastName, ContactNumber, ContactEmail) VALUES
  (1, 'CSC Corp.', '62 Kent St E Lindsay ON K9V 2C5', 'Adolf', 'Denesik', 3915280674,
   'adolf.denesik@csccorp.biz'),
  (2, 'Heavy Industries', '4520 7th Ave W Vancouver BC V6R 1X3', 'Abigayle', 'Gibson', 7290345264,
   'abigayle.gibson@hv.org'),
  (3, 'Seacoast Software', '4915 52 St , Bruderheim, AB, T0B 0S0', 'Bonita', 'Zulauf', 1721138850,
   'bonita.zulauf@seacost.ca'),
  (4, 'Canopy University', '54 Rue Du Calvados , Candiac, QC, J5R 6H4', 'Shanelle', 'Keeling', 1880369913,
   'shanelle.keeling@canopy.edu'),
  (5, 'Coin Stomp', '2013 Manston Rd , Black Creek, BC, V9J 1A6', 'Estevan', 'Effertz', 1994485120,
   'estevan.effertz@coinstomp.org'),
  (6, 'Obverso', '5411 Lakeshore Rd 14 Burlington ON L7L 1E1', 'Darryl', 'Bins', 1886942583,
   'darryl.bins@obverso.biz');

INSERT INTO LineOfBusiness (Type, TechnicalAccountManagerId) VALUES ('Cloud Services', 1), ('Business Development and Research', 2);

INSERT INTO Contract (Id, Type, CompanyId, AnnualContractValue, InitialAmount, Service, StartDate, LineOfBusiness)
VALUES (1, 'Gold', 1, 10046.020000, 1117.280000, 'Cloud', '2016-10-07T00:00', 'Business Development and Research'),
  (2, 'Silver', 2, 20522.860000, 866.560000, 'On-premises', '2016-06-17T00:00', 'Business Development and Research'),
  (3, 'Premium', 3, 30366.640000, 634.420000, 'Cloud', '2016-04-15T00:00', 'Business Development and Research'),
  (4, 'Diamond', 4, 18413.470000, 1432.300000, 'On-premises', '2016-01-01T00:00', 'Cloud Services'),
  (5, 'Gold', 5, 27357.870000, 1571.070000, 'Cloud', '2017-06-07T12:00', 'Cloud Services'),
  (6, 'Silver', 6, 17268.680000, 1393.420000, 'On-premises', '2017-03-31T00:00', 'Cloud Services'),
  (7, 'Premium', 1, 12319.660000, 1002.620000, 'Cloud', '2016-05-13T00:00', 'Business Development and Research'),
  (8, 'Diamond', 2, 16722.060000, 903.400000, 'On-premises', '2016-10-21T00:00', 'Business Development and Research'),
  (9, 'Gold', 3, 26546.820000, 1290.250000, 'Cloud', '2016-06-24T00:00', 'Business Development and Research'),
  (10, 'Silver', 4, 11714.100000, 1597.780000, 'On-premises', '2017-04-21T00:00', 'Cloud Services'),
  (11, 'Premium', 5, 12820.690000, 830.870000, 'Cloud', '2016-10-21T00:00', 'Cloud Services'),
  (12, 'Diamond', 6, 14361.810000, 1152.280000, 'On-premises', '2017-04-21T00:00', 'Cloud Services');

INSERT INTO WorksOn (EmployeeId, ContractId, Task, Hours)
VALUES (6, 1, 'General', 10), (9, 1, 'General', 5), (72, 1, 'Onboarding Client', 8),
  (57, 1, 'Provisioning Resources', 5), (69, 1, 'Assigning Technical Teams', 7), (51, 1, 'Allocating Data Center', 6),
  (58, 1, 'Allocating Data Center', 3), (59, 1, 'General', 3), (27, 1, 'Assigning Technical Teams', 5),
  (8, 2, 'General', 6), (12, 2, 'General', 7), (78, 2, 'Onboarding Client', 5), (62, 2, 'Allocating Data Center', 5),
  (31, 2, 'Assigning Technical Teams', 2), (26, 2, 'Provisioning Resources', 3), (66, 2, 'Allocating Data Center', 3),
  (39, 2, 'Provisioning Resources', 9), (4, 3, 'General', 5), (14, 3, 'General', 3),
  (60, 3, 'Provisioning Resources', 2), (37, 3, 'General', 4), (65, 3, 'General', 6),
  (55, 3, 'Assigning Technical Teams', 8), (24, 3, 'Allocating Data Center', 5), (3, 4, 'General', 1),
  (18, 4, 'General', 3), (47, 4, 'Provisioning Resources', 10), (71, 4, 'Assigning Technical Teams', 2),
  (44, 4, 'General', 5), (46, 4, 'Assigning Technical Teams', 10), (76, 4, 'Provisioning Resources', 3),
  (5, 5, 'General', 3), (11, 5, 'General', 1), (77, 5, 'Allocating Data Center', 1),
  (40, 5, 'Provisioning Resources', 7), (64, 5, 'Assigning Technical Teams', 10), (54, 5, 'Allocating Data Center', 1),
  (70, 5, 'General', 5), (7, 6, 'General', 3), (15, 6, 'General', 9), (29, 6, 'Provisioning Resources', 7),
  (52, 6, 'General', 1), (73, 6, 'Allocating Data Center', 5), (33, 6, 'Onboarding Client', 8),
  (75, 6, 'Provisioning Resources', 2), (6, 7, 'General', 10), (16, 7, 'General', 2),
  (35, 7, 'Assigning Technical Teams', 3), (74, 7, 'Assigning Technical Teams', 1),
  (43, 7, 'Allocating Data Center', 2), (28, 7, 'Onboarding Client', 2), (30, 7, 'Assigning Technical Teams', 4),
  (8, 8, 'General', 1), (17, 8, 'General', 1), (38, 8, 'Provisioning Resources', 9), (61, 8, 'Onboarding Client', 9),
  (19, 8, 'Assigning Technical Teams', 6), (36, 8, 'Onboarding Client', 5), (32, 8, 'Provisioning Resources', 7),
  (41, 8, 'Allocating Data Center', 2), (4, 9, 'General', 10), (13, 9, 'General', 6),
  (63, 9, 'Allocating Data Center', 10), (56, 9, 'Allocating Data Center', 1), (48, 9, 'Onboarding Client', 5),
  (50, 9, 'Allocating Data Center', 10), (68, 9, 'Onboarding Client', 1), (53, 9, 'Assigning Technical Teams', 4),
  (3, 10, 'General', 3), (10, 10, 'General', 10), (22, 10, 'General', 1), (20, 10, 'General', 9),
  (49, 10, 'Assigning Technical Teams', 1), (45, 10, 'General', 9), (67, 10, 'Allocating Data Center', 1),
  (21, 10, 'Allocating Data Center', 1), (25, 10, 'Assigning Technical Teams', 6), (5, 11, 'General', 10),
  (9, 11, 'General', 7), (34, 11, 'Assigning Technical Teams', 7), (23, 11, 'Assigning Technical Teams', 1),
  (42, 11, 'Provisioning Resources', 10), (72, 11, 'General', 10), (57, 11, 'General', 1), (7, 12, 'General', 7),
  (12, 12, 'General', 1), (69, 12, 'Assigning Technical Teams', 9), (51, 12, 'Allocating Data Center', 8),
  (58, 12, 'Onboarding Client', 2), (59, 12, 'Allocating Data Center', 4), (27, 12, 'Assigning Technical Teams', 9);