#проекция
SELECT Passport, FullName, Organisation
FROM guests;

#селекция
SELECT Passport, FullName
FROM guests
WHERE RoomNumber = 2;

#декартово произведение
SELECT r.Id, g.FullName
FROM guests g, rooms r
WHERE g.Sex = 'М';

#объединение
SELECT ps.Service, g.FullName
FROM guests g, providedservices ps
WHERE g.Passport = GuestPassport AND ps.Price <2000
UNION
SELECT ps.Service, g.FullName
FROM guests g, providedservices ps
WHERE g.Passport = GuestPassport AND ps.Price >= 4000;

#разность
SELECT 