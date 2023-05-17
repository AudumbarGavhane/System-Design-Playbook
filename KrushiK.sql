-- User table
CREATE TABLE Users (
  User_ID INT PRIMARY KEY,
  Name VARCHAR(255),
  Contact_Information VARCHAR(255),
  Role VARCHAR(50),
  Farmer INT,
  FOREIGN KEY (Farmer) REFERENCES Farmers(Farmer_ID)
);

-- Farmer table
CREATE TABLE Farmers (
  Farmer_ID INT PRIMARY KEY,
  User_ID INT,
  Address VARCHAR(255),
  Farm_Details TEXT,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Crop table
CREATE TABLE Crops (
  Crop_ID INT PRIMARY KEY,
  Crop_Name VARCHAR(255),
  Crop_Details TEXT,
  Recommended_Practices TEXT
);

-- Land table
CREATE TABLE Lands (
  Land_ID INT PRIMARY KEY,
  Farmer_ID INT,
  Land_Area FLOAT,
  Soil_Type VARCHAR(255),
  Irrigation_Method VARCHAR(255),
  Location VARCHAR(255),
  FOREIGN KEY (Farmer_ID) REFERENCES Farmers(Farmer_ID)
);

-- Advisory table
CREATE TABLE Advisories (
  Advisory_ID INT PRIMARY KEY,
  Title VARCHAR(255),
  Description TEXT,
  Recommendations TEXT,
  Expert_Information TEXT
);

-- Produce table
CREATE TABLE Produces (
  Produce_ID INT PRIMARY KEY,
  Farmer_ID INT,
  Crop_ID INT,
  Quantity FLOAT,
  Quality VARCHAR(50),
  Harvest_Information TEXT,
  FOREIGN KEY (Farmer_ID) REFERENCES Farmers(Farmer_ID),
  FOREIGN KEY (Crop_ID) REFERENCES Crops(Crop_ID)
);

-- Market table
CREATE TABLE Markets (
  Market_ID INT PRIMARY KEY,
  Location VARCHAR(255),
  Contact_Information VARCHAR(255),
  Market_Details TEXT
);

-- Report table
CREATE TABLE Reports (
  Report_ID INT PRIMARY KEY,
  Title VARCHAR(255),
  Description TEXT,
  Generated_Date DATE,
  Analysis_Results TEXT
);
