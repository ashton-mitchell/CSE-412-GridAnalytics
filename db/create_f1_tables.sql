CREATE TABLE constructor ( 
name VARCHAR(100) PRIMARY KEY, -- Constructor's name is unique 
year_est INT, 
drivers VARCHAR(100), -- Store driver names 
points INT, 
wins INT, 
podiums INT 
);

CREATE TABLE driver ( 
name VARCHAR(100) UNIQUE, 
number INT PRIMARY KEY, -- Driver number is unique 
constructor VARCHAR(100), -- Foreign key referencing Constructor 
races INT, 
wins INT, 
podiums INT, 
points INT, 
name_acro VARCHAR(3), -- 3-letter acronym for the driver 
FOREIGN KEY (constructor) REFERENCES constructor(name) 
);

CREATE TABLE car ( 
constructor VARCHAR(100), -- Foreign key referencing Constructor 
name VARCHAR(100), -- Name of the car 
wins INT, 
podiums INT,  
PRIMARY KEY (constructor, name), -- Composite key (Constructor, Car name) 
FOREIGN KEY (constructor) REFERENCES constructor(name) 
);

CREATE TABLE season( 
year INT PRIMARY KEY, -- Year is unique for each season 
champion VARCHAR(100), -- References Driver (winner of the WDC) 
constructor_champion VARCHAR(100), -- References Constructor (winner of the WCC) 
races INT, 
drivers INT, 
teams INT, 
FOREIGN KEY (champion) REFERENCES driver(name), 
FOREIGN KEY (constructor_champion) REFERENCES constructor(name) 
);

CREATE TABLE race ( 
date DATE, 
name VARCHAR(100), 
circuit VARCHAR(100), 
winner VARCHAR(100), -- References Driver 
pole VARCHAR(100), -- References Driver (Pole position) 
dotd VARCHAR(100), -- Driver of the Day 
fastest_lap VARCHAR(100), -- Fastest lap driver 
weather BOOLEAN, 
PRIMARY KEY (date, name), -- Composite key (Date, Race name) 
FOREIGN KEY (winner) REFERENCES driver(name), 
FOREIGN KEY (pole) REFERENCES driver(name), 
FOREIGN KEY (dotd) REFERENCES driver(name), 
FOREIGN KEY (fastest_lap) REFERENCES driver(name) 
);

CREATE TABLE lap ( 
lap_number INT,
lead_time FLOAT, 
gap_to_lead FLOAT, 
time FLOAT, 
pit BOOLEAN, 
position INT, 
best_time FLOAT, 
driver_number INT, -- Foreign key referencing Driver 
race_date DATE, -- Foreign key referencing Race 
race_name VARCHAR(100), -- Foreign key referencing Race 
PRIMARY KEY (driver_number, lap_number), -- Composite key (Driver and Position) 
FOREIGN KEY (driver_number) REFERENCES driver(number), 
FOREIGN KEY (race_date, race_name) REFERENCES race(date, name) 
);

--constructor

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('BWT-Alpine F1 Team', 2021, 'Esteban Ocon & Pierre Gasly', 59, 0, 0);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('Aston Martin', 2021, 'Fernando Alonso & Lance Stroll', 92, 0, 0);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('Scuderia Ferrari', 1929, 'Charles Leclerc & Carlos Sainz Jr', 619, 5, 20);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('Kick Sauber', 2019, 'Guanyu Zhou & Valtteri Bottas', 4, 0, 0);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('RB', 2020, 'Liam Lawson & Yuki Tsunoda', 46, 0, 0);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('Haas F1 Team', 2016, 'Kevin Magnussen & Nico Hulkenberg', 54, 0, 0);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('McLaren F1 Team', 1963, 'Lando Norris & Oscar Piastri', 640, 5, 20);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('Oracle Red Bull Racing', 2005, 'Max Verstappen & Sergio Perez', 581, 9, 18);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('Williams Racing', 1977, 'Logan Sargeant & Alexander Albon', 17, 0, 0);

INSERT INTO constructor (name, year_est, drivers, points, wins, podiums)
VALUES ('Mercedes-AMG Pertronas F1 Team', 1970, 'George Russell & Lewis Hamilton', 446, 4, 9);

--driver

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Lando Norris', 4, 'McLaren F1 Team', 23, 3, 12, 349, 'NOR');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Oscar Piastri', 81, 'McLaren F1 Team', 23, 0, 8, 291, 'PIA');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Yuki Tsunoda', 22, 'RB', 23, 0, 0, 30, 'TSU');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Liam Lawson', 30, 'RB', 5, 0, 0, 4, 'LAW');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Logan Sargeant', 2, 'Williams Racing', 14, 0, 0, 0, 'SAR');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Alexander Albon', 23, 'Williams Racing', 23, 0, 0, 12, 'ALB');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Fernando Alonso', 14, 'Aston Martin', 23, 0, 0, 68, 'ALO');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Lance Stroll', 18, 'Aston Martin', 23, 0, 0, 24, 'STR');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Pierre Gasly', 10, 'BWT-Alpine F1 Team', 23, 0, 1, 36, 'GAS');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Esteban Ocon', 31, 'BWT-Alpine F1 Team', 23, 0, 1, 23, 'OCO');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Nico Hulkenberg', 27, 'Haas F1 Team', 23, 0, 0, 37, 'HUL');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Kevin Magnussen', 20, 'Haas F1 Team', 21, 0, 0, 16, 'MAG');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Guanyu Zhou', 24, 'Kick Sauber', 23, 0, 0, 4, 'ZHO');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Valtteri Bottas', 77, 'Kick Sauber', 23, 0, 0, 0, 'BOT');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Max Verstappen', 1, 'Oracle Red Bull Racing', 23, 9, 14, 429, 'VER');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Sergio Perez', 11, 'Oracle Red Bull Racing', 23, 0, 4, 152, 'PER');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('George Russell', 63, 'Mercedes-AMG Pertronas F1 Team', 23, 2, 4, 235, 'RUS');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Lewis Hamilton', 44, 'Mercedes-AMG Pertronas F1 Team', 23, 2, 5, 211, 'HAM');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Carlos Sainz Jr.', 55, 'Scuderia Ferrari', 22, 2, 8, 272, 'SAI');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Charles Leclerc', 16, 'Scuderia Ferrari', 23, 3, 12, 341, 'LEC');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Oliver Bearman', 87, 'Scuderia Ferrari', 3, 0, 0, 7, 'BEA');

INSERT INTO driver (name, number, constructor, races, wins, podiums, points, name_acro)
VALUES ('Daniel Ricciardo', 3, 'RB', 18, 0, 0, 12, 'BEA');


--car

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('McLaren F1 Team', 'MCL38', 5, 20);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('Oracle Red Bull Racing', 'RB20', 9, 18);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('Scuderia Ferrari', 'SF-24', 5, 20);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('Mercedes-AMG Pertronas F1 Team', 'W15', 4, 9);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('Aston Martin', 'AMR24', 0, 0);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('RB', 'VCARB 01', 0, 0);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('Haas F1 Team', 'VF-24', 0, 0);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('Williams Racing', 'FW46', 0, 0);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('BWT-Alpine F1 Team', 'A524', 0, 2);

INSERT INTO car (constructor, name, wins, podiums)
VALUES ('Kick Sauber', 'C44', 0, 0);


--season

INSERT INTO season (year, champion, constructor_champion, races, drivers, teams) 
VALUES (2023, 'Max Verstappen', 'Oracle Red Bull Racing', 23, 20, 10);

INSERT INTO season (year, champion, constructor_champion, races, drivers, teams) 
VALUES (2022, 'Max Verstappen', 'Oracle Red Bull Racing', 22, 20, 10);

INSERT INTO season (year, champion, constructor_champion, races, drivers, teams) 
VALUES (2021, 'Max Verstappen', 'Oracle Red Bull Racing', 22, 20, 10);

INSERT INTO season (year, champion, constructor_champion, races, drivers, teams) 
VALUES (2020, 'Lewis Hamilton', 'Mercedes-AMG Pertronas F1 Team', 17, 20, 10);

INSERT INTO season (year, champion, constructor_champion, races, drivers, teams) 
VALUES (2019, 'Lewis Hamilton', 'Mercedes-AMG Pertronas F1 Team', 21, 20, 10);

INSERT INTO season (year, champion, constructor_champion, races, drivers, teams) 
VALUES (2018, 'Lewis Hamilton', 'Mercedes-AMG Pertronas F1 Team', 21, 20, 10);

INSERT INTO season (year, champion, constructor_champion, races, drivers, teams) 
VALUES (2017, 'Lewis Hamilton', 'Mercedes-AMG Pertronas F1 Team', 20, 20, 10);

--race

INSERT INTO race (date, name, circuit, winner, pole, dotd, fastest_lap, weather)
VALUES 
('2024-03-02', 'Bahrain Grand Prix', 'Bahrain International Circuit', 'Max Verstappen', 'Max Verstappen', 'Carlos Sainz Jr.', 'Max Verstappen', FALSE),
('2024-03-09', 'Saudi Arabian Grand Prix', 'Jeddah Corniche Circuit', 'Max Verstappen', 'Max Verstappen', 'Oliver Bearman', 'Max Verstappen', TRUE),
('2024-03-23', 'Australian Grand Prix', 'Albert Park Circuit', 'Carlos Sainz Jr.', 'Charles Leclerc', 'Carlos Sainz Jr.', 'Lando Norris', TRUE),
('2024-04-06', 'Chinese Grand Prix', 'Shanghai International Circuit', 'Max Verstappen', 'Max Verstappen', 'Lando Norris', 'Max Verstappen', FALSE),
('2024-04-20', 'Miami Grand Prix', 'Miami International Autodrome', 'Lando Norris', 'Lando Norris', 'Lando Norris', 'George Russell', TRUE),
('2024-05-11', 'Emilia Romagna Grand Prix', 'Imola Circuit', 'Max Verstappen', 'Max Verstappen', 'Lando Norris', 'Max Verstappen', FALSE),
('2024-05-26', 'Monaco Grand Prix', 'Circuit de Monaco', 'Charles Leclerc', 'Charles Leclerc', 'Charles Leclerc', 'Charles Leclerc', FALSE),
('2024-06-09', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Max Verstappen', 'Max Verstappen', 'Lando Norris', 'Max Verstappen', TRUE),
('2024-06-23', 'Spanish Grand Prix', 'Circuit de Barcelona-Catalunya', 'Max Verstappen', 'Max Verstappen', 'Lando Norris', 'Max Verstappen', FALSE),
('2024-06-30', 'Austrian Grand Prix', 'Red Bull Ring', 'George Russell', 'George Russell', 'Lando Norris', 'Lando Norris', TRUE),
('2024-07-07', 'British Grand Prix', 'Silverstone Circuit', 'Lewis Hamilton', 'Lewis Hamilton', 'Lewis Hamilton', 'Max Verstappen', TRUE),
('2024-07-21', 'Hungarian Grand Prix', 'Hungaroring', 'Oscar Piastri', 'Oscar Piastri', 'Oscar Piastri', 'Lando Norris', FALSE),
('2024-08-04', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Lewis Hamilton', 'Max Verstappen', 'Lewis Hamilton', 'George Russell', TRUE),
('2024-08-25', 'Dutch Grand Prix', 'Circuit Zandvoort', 'Lando Norris', 'Max Verstappen', 'Lando Norris', 'Charles Leclerc', FALSE),
('2024-09-01', 'Italian Grand Prix', 'Monza', 'Charles Leclerc', 'Charles Leclerc', 'Charles Leclerc', 'Lando Norris', TRUE),
('2024-09-22', 'Singapore Grand Prix', 'Marina Bay Street Circuit', 'Lando Norris', 'Lando Norris', 'Daniel Ricciardo', 'Max Verstappen', FALSE),
('2024-10-06', 'Japanese Grand Prix', 'Suzuka Circuit', 'Max Verstappen', 'Max Verstappen', 'Charles Leclerc', 'Max Verstappen', FALSE),
('2024-10-20', 'United States Grand Prix', 'Circuit of the Americas', 'Charles Leclerc', 'Charles Leclerc', 'Charles Leclerc', 'Lando Norris', TRUE),
('2024-11-03', 'Mexican Grand Prix', 'Autódromo Hermanos Rodríguez', 'Carlos Sainz Jr.', 'Max Verstappen', 'Carlos Sainz Jr.', 'George Russell', FALSE),
('2024-11-17', 'São Paulo Grand Prix', 'Interlagos', 'Max Verstappen', 'Max Verstappen', 'Max Verstappen', 'Max Verstappen', TRUE),
('2024-11-24', 'Las Vegas Grand Prix', 'Las Vegas Street Circuit', 'George Russell', 'George Russell', 'Lewis Hamilton', 'George Russell', TRUE),
('2024-12-01', 'Qatar Grand Prix', 'Lusail International Circuit', 'Max Verstappen', 'Max Verstappen', 'Guanyu Zhou', 'Max Verstappen', TRUE);



