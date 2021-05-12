-- Generated data contains:
-- 76 employees (6 Managers, 10 Sales Associates, 60 Developers)
-- 6 Departments
-- 12 Contracts
-- 6 Companies

SET SQL_SAFE_UPDATES = 0;
DELETE FROM WorksOn;
DELETE FROM Contract;
DELETE FROM Company;
DELETE FROM Employee;
DELETE FROM Department;

INSERT INTO Department (Id, Name)
VALUES (1, 'Development'), (2, 'QA'), (3, 'UI'), (4, 'Design'), (5, 'Business Intelligence'), (6, 'Networking');

INSERT INTO Employee (Id, Role, Name, DepartmentId, ManagerId)
VALUES (1, 'Manager', 'Van David', 1, null), (2, 'Manager', 'Reta Bayer', 2, null),
  (3, 'Manager', 'Tyreek Cole', 3, null), (4, 'Manager', 'David', 4, null),
  (5, 'Manager', 'Jonatan Batz', 5, null), (6, 'Manager', 'Armani Waters', 6, null),
  (7, 'Sales Associate', 'Cordia Cummerata', 1, 1), (8, 'Sales Associate', 'Lenore Smitham', 2, 2),
  (9, 'Sales Associate', 'Nikko Hintz', 3, 3), (10, 'Sales Associate', 'Domenica Ankunding', 4, 4),
  (11, 'Sales Associate', 'Camron Schaden', 5, 5), (12, 'Sales Associate', 'Lesly Turcotte', 6, 6),
  (13, 'Sales Associate', 'Cecile O''Kon', 1, 1), (14, 'Sales Associate', 'Freddie Kihn', 2, 2),
  (15, 'Sales Associate', 'Bradley Bayer', 3, 3), (16, 'Sales Associate', 'Preston Balistreri', 4, 4),
  (17, 'Developer', 'Addison Douglas', 1, 1), (18, 'Developer', 'Myrtis Koepp', 2, 2),
  (19, 'Developer', 'Stephon Greenholt', 3, 3), (20, 'Developer', 'Josh Fetcher', 4, 4),
  (21, 'Developer', 'Laisha Collier', 5, 5), (22, 'Developer', 'Fidel Heller', 6, 6),
  (23, 'Developer', 'Clarissa Gaylord', 1, 1), (24, 'Developer', 'Manuela Beahan', 2, 2),
  (25, 'Developer', 'Maribel Kautzer', 3, 3), (26, 'Developer', 'Maiya ammes', 4, 4),
  (27, 'Developer', 'Oleta Toy', 5, 5), (28, 'Developer', 'Chaim Daugherty', 6, 6),
  (29, 'Developer', 'Ryann Gutmann', 1, 1), (30, 'Developer', 'Schuyler Schmeler', 2, 2),
  (31, 'Developer', 'Mabelle Hermiston', 3, 3), (32, 'Developer', 'Edna Daniel', 4, 4),
  (33, 'Developer', 'Noble Roob', 5, 5), (34, 'Developer', 'Jammie Feil', 6, 6),
  (35, 'Developer', 'Rey Eichmann', 1, 1), (36, 'Developer', 'Rachael Kuvalis', 2, 2),
  (37, 'Developer', 'Wade Breitenberg', 3, 3), (38, 'Developer', 'Larue Hilpert', 4, 4),
  (39, 'Developer', 'Mina Ondricka', 5, 5), (40, 'Developer', 'Misty Konopelski', 6, 6),
  (41, 'Developer', 'Lilian Witting', 1, 1), (42, 'Developer', 'Annetta Spinka', 2, 2),
  (43, 'Developer', 'Abigail Glover', 3, 3), (44, 'Developer', 'Shanny Abshire', 4, 4),
  (45, 'Developer', 'Haylee Hyatt', 5, 5), (46, 'Developer', 'Gustave Mraz', 6, 6),
  (47, 'Developer', 'Enrique Kuhlman', 1, 1), (48, 'Developer', 'Drake Jenkins', 2, 2),
  (49, 'Developer', 'Dominique Glover', 3, 3), (50, 'Developer', 'Everardo Gutmann', 4, 4),
  (51, 'Developer', 'Schuyler Rau', 5, 5), (52, 'Developer', 'Mose Kemmer', 6, 6),
  (53, 'Developer', 'Alysa Murray', 1, 1), (54, 'Developer', 'Rodolfo Labadie', 2, 2),
  (55, 'Developer', 'Arden Maggio', 3, 3), (56, 'Developer', 'Giles Murazik', 4, 4),
  (57, 'Developer', 'Marty Wisozk', 5, 5), (58, 'Developer', 'Alexandrine Goldner', 6, 6),
  (59, 'Developer', 'Carmine Maggio', 1, 1), (60, 'Developer', 'Orlando Dooley', 2, 2),
  (61, 'Developer', 'Judge Johnson', 3, 3), (62, 'Developer', 'Mikel Schumm', 4, 4),
  (63, 'Developer', 'Eriberto Johnston', 5, 5), (64, 'Developer', 'Crawford Bogan', 6, 6),
  (65, 'Developer', 'Hector Gutmann', 1, 1), (66, 'Developer', 'Joannie McDermott', 2, 2),
  (67, 'Developer', 'Jordan Toy', 3, 3), (68, 'Developer', 'Anya Windler', 4, 4),
  (69, 'Developer', 'Christine Hirthe', 5, 5), (70, 'Developer', 'Priscilla Mertz', 6, 6),
  (71, 'Developer', 'Kole Metz', 1, 1), (72, 'Developer', 'Wendell Fadel', 2, 2),
  (73, 'Developer', 'Cordelia Hamill', 3, 3), (74, 'Developer', 'Felix Gislason', 4, 4),
  (75, 'Developer', 'Frederic Corkery', 5, 5), (76, 'Developer', 'Taylor Paucek', 6, 6);

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

INSERT INTO Contract (Id, Type, CompanyId, AnnualContractValue, InitialAmount, Service, StartDate)
VALUES (1, 'Gold', 1, 17379.200000, 1639.280000, 'Cloud', '2016-01-22T00:00'),
  (2, 'Silver', 2, 12331.690000, 1497.250000, 'On-premises', '2017-01-20T00:00'),
  (3, 'Premium', 3, 32891.520000, 1629.240000, 'Cloud', '2016-10-28T00:00'),
  (4, 'Diamond', 4, 33067.560000, 560.400000, 'On-premises', '2017-08-18T00:00'),
  (5, 'Gold', 5, 15630.850000, 1211.320000, 'Cloud', '2017-03-31T00:00'),
  (6, 'Silver', 6, 25784.810000, 558.490000, 'On-premises', '2016-07-07T00:00'),
  (7, 'Premium', 3, 36714.830000, 1094.250000, 'Cloud', '2017-04-23T00:00'),
  (8, 'Diamond', 2, 26052.730000, 1327.850000, 'On-premises', '2017-07-28T00:00'),
  (9, 'Gold', 3, 28340.080000, 1792.220000, 'Cloud', '2017-06-07T00:00'),
  (10, 'Silver', 4, 15305.270000, 1388.300000, 'On-premises', '2016-08-26T00:00'),
  (11, 'Premium', 5, 31836.630000, 682.270000, 'Cloud', '2017-05-19T00:00'),
  (12, 'Diamond', 6, 27813.110000, 1968.620000, 'On-premises', '2017-10-13T00:00');

INSERT INTO WorksOn (EmployeeId, ContractId)
VALUES (5, 1), (8, 1), (76, 1), (52, 1), (71, 1), (49, 1), (54, 1), (2, 2), (7, 2), (53, 2), (72, 2), (26, 2), (29, 2),
  (68, 2), (1, 3), (14, 3), (23, 3), (56, 3), (69, 3), (35, 3), (42, 3), (6, 4), (12, 4), (51, 4), (61, 4), (47, 4),
  (21, 4), (30, 4), (27, 4), (59, 4), (3, 5), (9, 5), (50, 5), (18, 5), (65, 5), (43, 5), (63, 5), (4, 6), (13, 6),
  (67, 6), (31, 6), (73, 6), (19, 6), (33, 6), (5, 7), (16, 7), (55, 7), (34, 7), (44, 7), (32, 7), (24, 7), (2, 8),
  (10, 8), (74, 8), (25, 8), (28, 8), (22, 8), (38, 8), (1, 9), (11, 9), (36, 9), (48, 9), (20, 9), (58, 9), (57, 9),
  (17, 9), (62, 9), (41, 9), (6, 10), (15, 10), (64, 10), (46, 10), (70, 10), (39, 10), (75, 10), (66, 10), (40, 10),
  (3, 11), (8, 11), (45, 11), (60, 11), (37, 11), (76, 11), (52, 11), (4, 12), (7, 12), (71, 12), (49, 12), (54, 12),
  (53, 12), (72, 12), (26, 12);