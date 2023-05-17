CREATE TABLE Employee (
  Employee_ID INT PRIMARY KEY,
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50),
  Email VARCHAR(100),
  Phone_Number VARCHAR(20),
  Address VARCHAR(200),
  Date_of_Hire DATE,
  Department VARCHAR(50),
  Manager_ID INT,
  Attendance_ID INT,
  Leave_ID INT,
  Performance_ID INT,
  Document_ID INT,
  FOREIGN KEY (Manager_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Attendance (
  Attendance_ID INT PRIMARY KEY,
  Employee_ID INT,
  Date DATE,
  Clock_In_Time TIME,
  Clock_Out_Time TIME,
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Leave (
  Leave_ID INT PRIMARY KEY,
  Employee_ID INT,
  Start_Date DATE,
  End_Date DATE,
  Leave_Type VARCHAR(50),
  Leave_Status VARCHAR(50),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Performance (
  Performance_ID INT PRIMARY KEY,
  Employee_ID INT,
  Reviewer_ID INT,
  Rating INT,
  Comments VARCHAR(200),
  Goal_Details VARCHAR(200),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
  FOREIGN KEY (Reviewer_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Document (
  Document_ID INT PRIMARY KEY,
  Employee_ID INT,
  Document_Type VARCHAR(50),
  File_Name VARCHAR(100),
  File_Path VARCHAR(200),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE User (
  User_ID INT PRIMARY KEY,
  Employee_ID INT,
  Username VARCHAR(50),
  Password VARCHAR(50),
  Role VARCHAR(50),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);
