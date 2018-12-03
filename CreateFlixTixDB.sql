Use FlixTix
GO

CREATE TABLE [Films] (
	[Id] [smallint] IDENTITY(1,1)  NOT NULL  ,
	[Title] nvarchar (200) ,
	[Plot] nvarchar (300),
	[Poster] nvarchar (20),
	[Time1] nvarchar(7),
	[Time2] nvarchar(7),
	[Time3] nvarchar(7),
	[Time4] nvarchar(7),
	[Time5] nvarchar(7),	 	  
)
GO

CREATE TABLE [Users] (
	[Id] [smallint] IDENTITY(1,1) NOT NULL ,
	[Username] nvarchar (20),
	[Password] nvarchar (20),
	[Email] nvarchar(250),
	[FirstName] nvarchar(250),
	[LastName] nvarchar(250),
	[MiddleInt] nvarchar(1),
)
GO

CREATE TABLE [Ticket] (
	[Ticket_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Ticket_Price] smallint,
	[Ticket_Type] nvarchar(20),
)
GO

CREATE TABLE [Reservation](
	[Reservation_Id][smallint] IDENTITY(1,1) NOT NULL,
	[Showing_Id] smallint,
	[User_Id] smallint,
	[Seat_Reserved_Id] smallint,
	[Ticket_Id] smallint,
)
GO

CREATE TABLE [Seat_Reserved] (
	[Seat_Reserved_Id][smallint] IDENTITY(1,1) NOT NULL,
	[Seat_Id] smallint,
	[Reservation_Id] smallint,
	[Showing_Id] smallint,
)
GO

CREATE TABLE [Seat](
	[Seat_Id][smallint] IDENTITY(1,1) NOT NULL,
	[Auditorium_Id] smallint,
	[Seat_Row] smallint,
	[Seat_Number] smallint,
)
GO

CREATE TABLE [Auditorium](
	[Auditorium_Id][smallint] IDENTITY(1,1) NOT NULL,
	[Auditorium_Seats] smallint,
)
GO

CREATE TABLE [Showing](
	[Showing_Id][smallint] IDENTITY(1,1) NOT NULL,
	[Showing_Movie] smallint,
	[Showing_Time] nvarchar(7),
	[Showing_Room] nvarchar(30),
)
GO

CREATE TABLE [Movie](
	[Movie_Id][smallint] IDENTITY(1,1) NOT NULL,
	[Title] nvarchar(200),
	[Plot] nvarchar(300),
	[Movie_Duration] smallint,
)
GO

ALTER TABLE Films
ADD
CONSTRAINT [PK_Films] PRIMARY KEY (Id)
GO

ALTER TABLE Users
ADD
CONSTRAINT [PK_User] PRIMARY KEY (Id)
GO

ALTER TABLE Ticket
ADD
CONSTRAINT [PK_Ticket] PRIMARY KEY(Ticket_Id)
GO

ALTER TABLE Reservation
ADD
CONSTRAINT [PK_Reseravtion] PRIMARY KEY(Reservation_Id)
GO

ALTER TABLE Seat_Reserved
ADD
CONSTRAINT [PK_Seat_Reserved] PRIMARY KEY(Seat_Reserved_Id)
GO

ALTER TABLE Seat
ADD
CONSTRAINT [PK_Seat] PRIMARY KEY(Seat_Id)
GO

ALTER TABLE Auditorium
ADD
CONSTRAINT [PK_Auditorium] PRIMARY KEY(Auditorium_Id)
GO

ALTER TABLE Showing
ADD
CONSTRAINT [PK_Showing] PRIMARY KEY(Showing_Id)
GO

ALTER TABLE Movie
ADD
CONSTRAINT [PK_Movie] PRIMARY KEY(Movie_Id)
GO

ALTER TABLE Reservation
ADD
CONSTRAINT [FK_Showing_Id] FOREIGN KEY (Showing_Id) REFERENCES Showing(Showing_Id),
CONSTRAINT [FK_User_Id] FOREIGN KEY (User_Id) REFERENCES Users(Id),
CONSTRAINT [FK_Seat_Reserved_Id] FOREIGN KEY (Seat_Reserved_Id) REFERENCES Seat_Reserved(Seat_Reserved_Id)
GO

ALTER TABLE Seat_Reserved
ADD
CONSTRAINT [FK_Seat] FOREIGN KEY (Seat_Id) REFERENCES Seat(Seat_Id),
CONSTRAINT [FK_Reservation] FOREIGN KEY(Reservation_Id) REFERENCES Reservation(Reservation_Id),
CONSTRAINT [FK_Showing] FOREIGN KEY(Showing_Id) REFERENCES Showing(Showing_Id)
GO

ALTER TABLE Seat
ADD
CONSTRAINT [FK_Auditorium] FOREIGN KEY(Auditorium_Id) REFERENCES Auditorium(Auditorium_Id)
GO

ALTER TABLE Showing
ADD
CONSTRAINT [FK_Showing_Movie] FOREIGN KEY(Showing_Movie) REFERENCES Movie(Movie_Id)
GO

ALTER TABLE Movie
ADD
CONSTRAINT [FK_Title] FOREIGN KEY(Title) REFERENCES Films(Title),
CONSTRAINT [FK_Plot] FOREIGN KEY(Plot) REFERENCES Films(Plot)
GO

Insert dbo.Ticket (Ticket_Price,Ticket_Type) Values (10, 'General Ticket')
Insert dbo.Ticket (Ticket_Price,Ticket_Type) Values (5, 'Kids Ticket')
Insert dbo.Ticket (Ticket_Price,Ticket_Type) Values (8, 'Senior Ticket')
GO

Insert dbo.Films (Title,Plot,Poster,Time1,Time2,Time3,Time4,Time5) Values ('Deadpool 2','Anti-Superhero and timetraveler form a bromance.','deadpool2.jpg','10:00AM','11:00AM','12:00PM','1:00PM','2:00PM')
Insert dbo.Films (Title,Plot,Poster,Time1,Time2,Time3,Time4,Time5) Values ('Fantasic Beasts The Crimes of Grindelwald','Wizards and magical beasts... what a cool plot!','fantasicbeasts2.jpg','10:00AM','11:00AM','12:00PM','1:00PM','2:00PM')
Insert dbo.Films (Title,Plot,Poster,Time1,Time2,Time3,Time4,Time5) Values ('Overlord','Call of Duty: Zombies mode turned into a movie.','overlord2018.jpg','10:00AM','11:00AM','12:00PM','1:00PM','2:00PM')
Insert dbo.Films (Title,Plot,Poster,Time1,Time2,Time3,Time4,Time5) Values ('Ralph Breaks the Internet','See title for plot.','ralph2.jpg','10:00AM','11:00AM','12:00PM','1:00PM','2:00PM')
Insert dbo.Films (Title,Plot,Poster,Time1,Time2,Time3,Time4,Time5) Values ('The Grinch','2018s version of the grinch told again.','thegrinch2018.jpg','10:00AM','11:00AM','12:00PM','1:00PM','2:00PM')
Go

Insert dbo.Auditorium (Auditorium_Seats) Values (25)
Insert dbo.Auditorium (Auditorium_Seats) Values (25)
Insert dbo.Auditorium (Auditorium_Seats) Values (25)
Insert dbo.Auditorium (Auditorium_Seats) Values (25)
Insert dbo.Auditorium (Auditorium_Seats) Values (25)
Go

Insert dbo.Movie (Title, Plot, Movie_Duration) Values ('Deadpool 2', 'Anti-Superhero and timetraveler form a bromance.', 120)
Insert dbo.Movie (Title, Plot, Movie_Duration) Values ('Overlord','Call of Duty: Zombies mode turned into a movie.', 108)
Insert dbo.Movie (Title, Plot, Movie_Duration) Values ('Ralph Breaks the Internet','See title for plot.', 116)
Insert dbo.Movie (Title, Plot, Movie_Duration) Values ('The Grinch','2018s version of the grinch told again.', 105)
GO

Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,1,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,1,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,1,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,1,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,1,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,2,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,2,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,2,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,2,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,2,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,3,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,3,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,3,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,3,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,3,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,4,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,4,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,4,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,4,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,4,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,5,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,5,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,5,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,5,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (1,5,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,1,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,1,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,1,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,1,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,1,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,2,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,2,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,2,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,2,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,2,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,3,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,3,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,3,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,3,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,3,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,4,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,4,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,4,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,4,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,4,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,5,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,5,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,5,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,5,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (2,5,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,1,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,1,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,1,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,1,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,1,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,2,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,2,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,2,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,2,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,2,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,3,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,3,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,3,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,3,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,3,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,4,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,4,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,4,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,4,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,4,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,5,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,5,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,5,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,5,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (3,5,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,1,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,1,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,1,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,1,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,1,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,2,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,2,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,2,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,2,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,2,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,3,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,3,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,3,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,3,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,3,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,4,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,4,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,4,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,4,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,4,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,5,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,5,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,5,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,5,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (4,5,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,1,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,1,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,1,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,1,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,1,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,2,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,2,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,2,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,2,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,2,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,3,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,3,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,3,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,3,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,3,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,4,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,4,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,4,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,4,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,4,5)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,5,1)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,5,2)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,5,3)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,5,4)
Insert dbo.Seat (Auditorium_Id, Seat_Row, Seat_Number) Values (5,5,5)
GO

Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (1,1,'10:00AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (1,1,'11:00AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (1,1,'12:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (1,1,'1:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (1,1,'2:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (1,1,'3:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (2,2,'10:30AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (2,2,'11:30AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (2,2,'12:30PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (2,2,'1:30PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (2,2,'2:30PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (2,2,'3:30PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (3,3,'10:00AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (3,3,'11:00AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (3,3,'12:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (3,3,'1:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (3,3,'2:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (3,3,'3:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (4,4,'10:00AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (4,4,'11:00AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (4,4,'12:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (4,4,'1:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (4,4,'2:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (4,4,'3:00PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (5,5,'10:15AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (5,5,'11:15AM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (5,5,'12:15PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (5,5,'1:15PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (5,5,'2:15PM')
Insert dbo.Showing (Showing_Movie, Showing_Room, Showing_Time) Values (5,5,'3:15PM')
GO

Insert dbo.Users (Username,Password) Values ('ADMIN','ADMIN')
GO
Insert dbo.Users (Username,Password) Values ('joe','0000')
GO

 