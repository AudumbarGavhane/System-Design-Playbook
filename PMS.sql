-- User table
CREATE TABLE Users (
  User_ID INT PRIMARY KEY,
  Name VARCHAR(255),
  Email VARCHAR(255),
  Password VARCHAR(255),
  Role VARCHAR(50),
  Project INT,
  FOREIGN KEY (Project) REFERENCES Projects(Project_ID)
);

-- Project table
CREATE TABLE Projects (
  Project_ID INT PRIMARY KEY,
  Title VARCHAR(255),
  Description TEXT,
  Start_Date DATE,
  End_Date DATE,
  Project_Manager_ID INT,
  FOREIGN KEY (Project_Manager_ID) REFERENCES Users(User_ID)
);

-- Task table
CREATE TABLE Tasks (
  Task_ID INT PRIMARY KEY,
  Project_ID INT,
  Title VARCHAR(255),
  Description TEXT,
  Due_Date DATE,
  Status VARCHAR(50),
  Priority VARCHAR(50),
  Assignee_ID INT,
  FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID),
  FOREIGN KEY (Assignee_ID) REFERENCES Users(User_ID)
);

-- Document table
CREATE TABLE Documents (
  Document_ID INT PRIMARY KEY,
  Name VARCHAR(255),
  Description TEXT,
  Version VARCHAR(50),
  File_Path VARCHAR(255),
  Project_ID INT,
  Task_ID INT,
  FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID),
  FOREIGN KEY (Task_ID) REFERENCES Tasks(Task_ID)
);

-- Team table
CREATE TABLE Teams (
  Team_ID INT PRIMARY KEY,
  Name VARCHAR(255),
  Project_ID INT,
  FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID)
);

-- Discussion table
CREATE TABLE Discussions (
  Discussion_ID INT PRIMARY KEY,
  Topic VARCHAR(255),
  Message TEXT,
  Timestamp DATETIME,
  Project_ID INT,
  Task_ID INT,
  User_ID INT,
  FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID),
  FOREIGN KEY (Task_ID) REFERENCES Tasks(Task_ID),
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Notification table
CREATE TABLE Notifications (
  Notification_ID INT PRIMARY KEY,
  Content TEXT,
  Timestamp DATETIME,
  User_ID INT,
  Project_ID INT,
  Task_ID INT,
  Discussion_ID INT,
  FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
  FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID),
  FOREIGN KEY (Task_ID) REFERENCES Tasks(Task_ID),
  FOREIGN KEY (Discussion_ID) REFERENCES Discussions(Discussion_ID)
);
