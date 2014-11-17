-- Rosemary Bulgarelli --
-- 11/16/2014 --
-- Lab 9: Normalization three --
-- I think I am close to having this correct --


DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS coaches;
DROP TABLE IF EXISTS headCoaches;
DROP TABLE IF EXISTS assistantCoaches;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS ageGroups;

-- People --
CREATE TABLE lab9people (
  pid           char(4) not null,
  firstName     text,
  lastName      text,
  address	text,
  zipCode	char(5),
  phoneNumber   char(10),
 primary key(pid)
);


-- Coaches --
CREATE TABLE coaches (
  pid     	   char(4) not null references lab9people(pid),
  yearsCoaching    Integer,
 primary key(pid)
);        


-- Head Coaches --
CREATE TABLE headCoaches (
  hid     char(4),
  pid     char(4) not null references lab9people(pid),
 primary key(hid)
);


-- Assitant Coaches --
CREATE TABLE assistantCoaches (
  aid     char(4),
  pid     char(4) not null references lab9people(pid),
 primary key(aid)
);


-- Players --
CREATE TABLE players (
  pid     	   char(4) not null references lab9people(pid),
  dateOfBirth      date,
 primary key(pid)
);

-- Age Groups --
CREATE TABLE ageGroups (
  ageGroupid   	char(4) not null,
  hid		char(4) not null references headCoaches(hid),
  aid		char(4) not null references assistantCoaches(aid),
  ageGroupName  text,
  minimumAge	Integer,
  maximumAge 	Integer,
 primary key(ageGroupid)
);

-- Teams --
CREATE TABLE teams (
  tid     	char(4) not null,
  pid		char(4) not null references players(pid),
  ageGroupid    char(4) not null references ageGroups(ageGroupid),
  teamName	text, 
 primary key(tid)
);




