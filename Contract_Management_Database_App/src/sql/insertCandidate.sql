SET SQL_SAFE_UPDATES = 0;
DELETE FROM WorksOn;
DELETE FROM Contract;
DELETE FROM Company;
DELETE FROM Employee;
DELETE FROM Department;

INSERT INTO Department (Id, Name)
VALUES (1, 'Development'), (2, 'QA'), (3, 'UI'), (4, 'Design'), (5, 'Business Intelligence'), (6, 'Networking');

INSERT INTO Employee (Id, Role, Name, DepartmentId, ManagerId)
VALUES (1, 'Manager', 'Van David', 1, null), (2, 'Manager', 'David', 2, null),
  (3, 'Manager', 'Scotty Stanton', 3, null), (4, 'Manager', 'Corine Jacobson', 4, null),
  (5, 'Manager', 'Vada Batz', 5, null), (6, 'Manager', 'Elmore Ferry', 6, null),
  (7, 'Sales Associate', 'Norwood Schmidt', 1, 1), (8, 'Sales Associate', 'Terrill Beatty', 2, 2),
  (9, 'Sales Associate', 'Alan Orn', 3, 3), (10, 'Sales Associate', 'Gerald Kilback', 4, 4),
  (11, 'Sales Associate', 'Emmett Baumbach', 5, 5), (12, 'Sales Associate', 'Lyla McKenzie', 6, 6),
  (13, 'Sales Associate', 'Efren Kertzmann', 1, 1), (14, 'Sales Associate', 'Ned Sawayn', 2, 2),
  (15, 'Sales Associate', 'Malachi Corkery', 3, 3), (16, 'Sales Associate', 'Stefanie Kemmer', 4, 4),
  (17, 'Developer', 'Josh Fetcher', 2, 2), (18, 'Developer', 'Deontae Deckow', 2, 2),
  (19, 'Developer', 'Howard Wilkinson', 3, 3), (20, 'Developer', 'Timmothy Botsford', 4, 4),
  (21, 'Developer', 'Tracey Kertzmann', 5, 5), (22, 'Developer', 'Vincent Hegmann', 6, 6),
  (23, 'Developer', 'Janick Keebler', 1, 1), (24, 'Developer', 'Kacie Conn', 2, 2),
  (25, 'Developer', 'Marcelle Kessler', 3, 3), (26, 'Developer', 'Mohammed Tillman', 4, 4),
  (27, 'Developer', 'Amie Kessler', 5, 5), (28, 'Developer', 'Kavon Rice', 6, 6),
  (29, 'Developer', 'Noemy Bartoletti', 1, 1), (30, 'Developer', 'Nat Bradtke', 2, 2),
  (31, 'Developer', 'Kaylin Kihn', 3, 3), (32, 'Developer', 'Ewald Wunsch', 4, 4),
  (33, 'Developer', 'Matilda Gaylord', 5, 5), (34, 'Developer', 'Luella Willms', 6, 6),
  (35, 'Developer', 'Kirstin Friesen', 1, 1), (36, 'Developer', 'Kirsten Lynch', 2, 2),
  (37, 'Developer', 'Layla Durgan', 3, 3), (38, 'Developer', 'Pinkie Klocko', 4, 4),
  (39, 'Developer', 'Kendrick Hane', 5, 5), (40, 'Developer', 'Jude Schneider', 6, 6),
  (41, 'Developer', 'Lowell Bechtelar', 1, 1), (42, 'Developer', 'Shaun Koelpin', 2, 2),
  (43, 'Developer', 'Aliyah Abernathy', 3, 3), (44, 'Developer', 'Kale Huels', 4, 4),
  (45, 'Developer', 'Catalina Hodkiewicz', 5, 5), (46, 'Developer', 'Kenya White', 6, 6),
  (47, 'Developer', 'Zoila Huel', 1, 1), (48, 'Developer', 'Lourdes Beahan', 2, 2),
  (49, 'Developer', 'Juanita Cormier', 3, 3), (50, 'Developer', 'Elvis Fay', 4, 4),
  (51, 'Developer', 'Barrett Bogisich', 5, 5), (52, 'Developer', 'Raphaelle Kuvalis', 6, 6),
  (53, 'Developer', 'Mariane Romaguera', 1, 1), (54, 'Developer', 'Riley Sporer', 2, 2),
  (55, 'Developer', 'Sydni Bode', 3, 3), (56, 'Developer', 'Davion Mayert', 4, 4),
  (57, 'Developer', 'Gene Spinka', 5, 5), (58, 'Developer', 'Dora Connelly', 6, 6),
  (59, 'Developer', 'Keeley Stoltenberg', 1, 1), (60, 'Developer', 'Marcelina Weissnat', 2, 2),
  (61, 'Developer', 'Barbara Jakubowski', 3, 3), (62, 'Developer', 'Elody Fritsch', 4, 4),
  (63, 'Developer', 'Jovan Kuvalis', 5, 5), (64, 'Developer', 'Johnathan Hahn', 6, 6),
  (65, 'Developer', 'Alexandre Labadie', 1, 1), (66, 'Developer', 'Van Senger', 2, 2),
  (67, 'Developer', 'Luz Lesch', 3, 3), (68, 'Developer', 'Matilda Simonis', 4, 4),
  (69, 'Developer', 'Delphine Fritsch', 5, 5), (70, 'Developer', 'Jovani Koss', 6, 6),
  (71, 'Developer', 'Reid Heidenreich', 1, 1), (72, 'Developer', 'Fanny Champlin', 2, 2),
  (73, 'Developer', 'Eli Zulauf', 3, 3), (74, 'Developer', 'Matilde Mohr', 4, 4),
  (75, 'Developer', 'Madeline VonRueden', 5, 5), (76, 'Developer', 'Guiseppe Pagac', 6, 6);

INSERT INTO Company (Id, Name, Address, ContactFirstName, ContactLastName, ContactNumber, ContactEmail)
VALUES (1, 'CSC Corp.', '62 Kent St E Lindsay ON K9V 2C5', 'Dina', 'Bins', 2146556066, 'dina.bins@schoen.info'),
  (2, 'Keebler, Keebler and Keebler', '4520 7th Ave W Vancouver BC V6R 1X3', 'Anne', 'Williamson', 1874482536,
   'anne.williamson@farrell.co'),
  (3, 'Blick, Blick and Blick', '249 4th Av SE , Altona, MB, R0G', 'Eric', 'Stehr', 1170660985, 'eric.stehr@raynor.co'),
  (4, 'Marks, Marks and Marks', '322 7 St , Beiseker, AB, T0M 0G0', 'Micah', 'Ernser', 7982755817,
   'micah.ernser@bayer.biz'), (5, 'Borer Inc', '4915 52 St , Bruderheim, AB, T0B 0S0', 'Elyse', 'Marquardt', 8371529905,
                               'elyse.marquardt@padberg.io'),
  (6, 'Gaylord Group', '54 Rue Du Calvados , Candiac, QC, J5R 6H4', 'Albert', 'Moen', 6984818195,
   'albert.moen@braun.biz');

INSERT INTO Contract (Id, Type, CompanyId, AnnualContractValue, InitialAmount, Service, StartDate)
VALUES (1, 'Gold', 1, 10251.600000, 770.390000, 'Cloud', '2016-09-09T00:00'),
  (2, 'Silver', 2, 25254.900000, 1102.650000, 'On-premises', '2017-06-02T00:00'),
  (3, 'Premium', 3, 33121.080000, 1485.220000, 'Cloud', '2017-07-28T00:00'),
  (4, 'Diamond', 4, 24686.490000, 1095.060000, 'On-premises', '2016-11-25T00:00'),
  (5, 'Gold', 5, 26176.400000, 1264.220000, 'Cloud', '2017-04-14T00:00'),
  (6, 'Silver', 6, 31646.370000, 1440.540000, 'On-premises', '2016-10-14T00:00'),
  (7, 'Premium', 1, 22731.000000, 1495.550000, 'Cloud', '2017-11-17T00:00'),
  (8, 'Diamond', 2, 26474.050000, 1951.310000, 'On-premises', '2017-04-07T00:00'),
  (9, 'Gold', 3, 26018.630000, 627.490000, 'Cloud', '2016-09-23T00:00'),
  (10, 'Gold', 4, 20420.440000, 1006.260000, 'On-premises', '2017-06-07T12:00'),
  (11, 'Premium', 5, 16839.240000, 961.490000, 'Cloud', '2016-07-01T00:00'),
  (12, 'Diamond', 6, 21978.100000, 1848.830000, 'On-premises', '2016-08-12T00:00');

INSERT INTO WorksOn (EmployeeId, ContractId)
VALUES (4, 1), (14, 1), (22, 1), (21, 1), (44, 1), (37, 1), (73, 1), (2, 2), (11, 2), (17, 2), (35, 2), (50, 2),
  (71, 2), (63, 2), (5, 3), (13, 3), (28, 3), (55, 3), (32, 3), (75, 3), (69, 3), (34, 3), (62, 3), (3, 4), (8, 4),
  (52, 4), (18, 4), (46, 4), (65, 4), (59, 4), (6, 5), (9, 5), (40, 5), (20, 5), (64, 5), (30, 5), (53, 5), (47, 5),
  (1, 6), (16, 6), (38, 6), (72, 6), (61, 6), (29, 6), (23, 6), (4, 7), (15, 7), (45, 7), (42, 7), (51, 7), (66, 7),
  (48, 7), (41, 7), (2, 8), (10, 8), (27, 8), (76, 8), (26, 8), (74, 8), (68, 8), (5, 9), (12, 9), (57, 9), (25, 9),
  (70, 9), (49, 9), (43, 9), (60, 9), (19, 9), (67, 9), (3, 10), (7, 10), (39, 10), (33, 10), (56, 10), (24, 10),
  (54, 10), (6, 11), (14, 11), (58, 11), (36, 11), (31, 11), (22, 11), (21, 11), (1, 12), (11, 12), (44, 12), (37, 12),
  (73, 12), (17, 12), (35, 12);