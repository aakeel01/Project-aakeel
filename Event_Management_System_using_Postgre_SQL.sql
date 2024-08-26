/*1. Database Creation task_03*/
create table events
(Event_Id int primary key,
Event_Name varchar(100),
Event_Date date,
Event_Location text,
Event_Description text)

create table Attendees
(Attendee_Id int primary key,
Attendee_Name text,
Attendee_Phone numeric,
Attendee_Email varchar(100),
Attendee_City text)


create table Registrations
(Registration_id int primary key,
Event_Id int,
Attendee_Id int,
Registration_Date date,
Registration_Amount numeric,
FOREIGN KEY (Event_Id) REFERENCES events(Event_Id),
FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
)


/*2. Data Creation
Insert some sample data for Events, Attendees, and Registrations tables with respective fields.*/

insert into events values 
('1','Dance','2000-02-01','Dubai','Any form of dance'),
('2','Drawing','2000-02-02','Qatar','Narure Drawing'),
('3','Crafts','2000-02-03','KSA','paper crafts'),
('4','Skits','2000-02-04','USA','Traditional Skits'),
('5','Singing','2000-02-05','Canada','Bollywood songs')



insert into Attendees values
('101','Akeel','111222','abc@gmail.com','Delhi'),
('102','Arshiya','333444','efg@gmail.com','Agra'),
('103','Soumya','555666','hij@gmail.com','Kerala'),
('104','Sharuk','777888','klm@gmail.com','Noida'),
('105','Chithra','999000','nop@gmail.com','Goa')


insert into Registrations values
('201','1','101','2000-07-01','900'),
('202','2','102','2000-07-02','800'),
('203','3','103','2000-07-03','700'),
('204','4','104','2000-07-04','600'),
('205','5','105','2000-07-05','500'),
('206','1','102','2000-07-06','800'),
('207','2','101','2000-07-07','900')


/*3. Manage Event Details
a) Inserting a new event.*/

insert into events values 
('6','Karate','2000-02-06','Japan','Professional level');

/*b) Updating an event's information.*/

update events
set Event_Name = 'Clay modelling' ,Event_Description = 'beginners'
where Event_Id = '2';

select *
from events;

/*c) Deleting an events*/
delete 
from events
where Event_Name = 'Karate';

select *
from events

/*4) Manage Track Attendees & Handle Events
a)Inserting a new attendee.*/

insert into Attendees values
('106','Gautham','888000','qrs@gmail.com','Karwar')
select *
from Attendees

/*b)Registering an attendee for an event.*/

insert into Registrations values
('208','3','106','2000-02-03','700')

select *
from Registrations


/*5.Develop queries to retrieve event information, generate attendee lists, and calculate event
attendance statistics.*/
select e.Event_Id, e.Event_Name, e.Event_Date , e.Event_Location, e.Event_Description , a.Attendee_Id,a.Attendee_Name, SUM(r.Registration_Amount) as total_amount
from events e
inner join Registrations r
on e.Event_Id = r.Event_Id
join Attendees a
on r.Attendee_id = a.Attendee_id
group by e.Event_Id, e.Event_Name, e.Event_Date , e.Event_Location, e.Event_Description , a.Attendee_Id,a.Attendee_Name;
