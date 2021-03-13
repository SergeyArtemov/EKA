create table Cars
(CarId int identity(1,1) primary key
,RegNumber varchar(50) not null
,Model varchar(100) not null
,Vin varchar(100) null
);

create table Drivers
(
DriverId int identity(1,1) primary key
,[Name] varchar(100) not null
,[LastName] varchar(100) null
,[Surname] varchar(100) not null
,DriverLicensNum varchar(100) not null
);


create table DriverDrivesCar
(DriverDrivesCarId int identity(1,1) primary key
,CarId int not null CONSTRAINT [FK_CarId] FOREIGN KEY(CarId) REFERENCES Cars (CarId)
,DriverId int not null CONSTRAINT [FK_DriverId] FOREIGN KEY(DriverId) REFERENCES Drivers(DriverId)
,timestart datetime not null
,timeend datetime not null);

create index idx1 on DriverDrivesCar(timestart desc);



-- Тестовые данные
insert into Cars(RegNumber,Model,Vin) select '1111111','1111111','1111111';
insert into Cars(RegNumber,Model,Vin) select '2222222','2222222','2222222';
insert into Cars(RegNumber,Model,Vin) select '3333333','3333333','3333333';

insert into Drivers([Name],LastName,Surname,DriverLicensNum)  select 'П','П','П','X1111';
insert into Drivers([Name],LastName,Surname,DriverLicensNum)  select 'И','И','И','Y1111';
insert into Drivers([Name],LastName,Surname,DriverLicensNum)  select 'С','С','С','Z1111';

insert DriverDrivesCar(CarId,DriverId,timestart,timeend) select 1,2,'20210109 08:00','20210109 12:00'
insert DriverDrivesCar(CarId,DriverId,timestart,timeend) select 2,2,'20210102 10:00','20210102 12:00'
insert DriverDrivesCar(CarId,DriverId,timestart,timeend) select 1,2,'20210103 09:00','20210103 12:00'
insert DriverDrivesCar(CarId,DriverId,timestart,timeend) select 3,2,'20210105 12:00','20210105 17:00'
insert DriverDrivesCar(CarId,DriverId,timestart,timeend) select 1,3,'20210101 11:00','20210101 12:00'
insert DriverDrivesCar(CarId,DriverId,timestart,timeend) select 3,3,'20210101 16:00','20210101 18:00'


select d.DriverId, d.Name, d.LastName, d.Surname, d.DriverLicensNum, ddc.timestart, ddc.timeend, c.CarId, c.Model, c.RegNumber, c.Vin
from DriverDrivesCar ddc
		inner join Drivers d
		on ddc.DriverId = d.DriverId
			inner join Cars c
			on ddc.CarId = c.CarId
order by ddc.timestart;




