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
SELECT g.Passport, g.FullName, g.RoomNumber, ps.Service
FROM guests g
LEFT JOIN providedservices ps
ON g.Passport = ps.GuestPassport;

#пересечение
SELECT g.Passport, g.FullName, g.RoomNumber, ps.Service
FROM guests g
INNER JOIN providedservices ps
ON g.Passport = ps.GuestPassport;

#соединение
SELECT r.Id, r.Class, rc.Price
FROM rooms r, roomsclasses rc
WHERE r.Class = rc.Class;