-- Insert data into DerbyNames table
INSERT INTO dbo.DerbyNames (Name, Number, DateAdded, League)
VALUES ('Scarlet Joheadslam', '1013', '2010/07/28', 'Ann Arbor Derby Dimes'),
       ('Bomb Quad', '18', '2010/12/04', 'Atomic Cupcakes'),
       ('Melisshious Destructio', '28', '2010/10/19', 'Barry County Black Heart Maidens'),
       ('RockNESS Monster', NULL, '2010/07/28', 'Brighton Roller Dollz'),
       ('Rosie the Pivoter', NULL, '2010/10/26', 'Central Michigan Roller Derby'),
       ('Addy Mantium', '36', '2006/04/15', 'Detroit Derby Girls'),
       ('Chess T. James', '112 ci', '2010/02/13', 'Flint City Derby Girls'),
       ('Kit E Katastrophe', NULL, '2011/12/29', 'Grand Rapids Area Roller Derby'),
       ('Dee Structio', NULL, '2007/07/30', 'Grand Raggidy Roller Girls'),
       ('C3KO', '6106', '2010/05/02', 'Lansing Derby Vixens'),
       ('Frisky Business', 'Purrfect 10', '2010/05/02', 'Lansing Derby Vixens'),
       ('Ellota Madness', '13', '2009/02/10', 'Mid Michigan Derby Girls'),
       ('Bubonic Paige', '1400', '2010/07/16', 'Mitten Mavens'),
       ('Oscar the Ouch', NULL, '2010/12/01', 'Skee Town Skirtz'),
       ('Pam SlamHerSo', '36 dbl D', '2011/01/03', 'Traverse City Roller Derby');

-- Insert data into Leagues table
INSERT INTO dbo.Leagues (LeagueName, URL, StateProvince, CountryCode)
VALUES ('Ann Arbor Derby Dimes', NULL, 'MI', 'USA'),
       ('Atomic Cupcakes', NULL, 'MI', 'USA'),
       ('Barry County Black Heart Maidens', NULL, 'MI', 'USA'),
       ('Brighton Roller Dollz', NULL, 'MI', 'USA'),
       ('Central Michigan Roller Derby', NULL, 'MI', 'USA'),
       ('Detroit Derby Girls', NULL, 'MI', 'USA'),
       ('Flint City Derby Girls', NULL, 'MI', 'USA'),
       ('Grand Rapids Area Roller Derby', NULL, 'MI', 'USA'),
       ('Grand Raggidy Roller Girls', NULL, 'MI', 'USA'),
       ('Lansing Derby Vixens', NULL, 'MI', 'USA'),
       ('Mid Michigan Derby Girls', NULL, 'MI', 'USA'),
       ('Mitten Mavens', NULL, 'MI', 'USA'),
       ('Skee Town Skirtz', NULL, 'MI', 'USA'),
       ('Traverse City Roller Derby', NULL, 'MI', 'USA');
