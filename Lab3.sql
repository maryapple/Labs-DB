# Постояльцы, проживающие в гостинице в данное время
CREATE VIEW Current_Guests (Passport, ArrivalDate, RoomNumber, FullName, Sex, Organisation, DepartureDate, GuestStatus) 
AS SELECT *
FROM Guests 
WHERE ArrivalDate <= CURDATE() AND DepartureDate > CURDATE(); 

UPDATE Current_Guests
SET Organisation='Nestle' 
WHERE Passport=123453939;

# "Свободные места": класс – номер – общее количество мест в номере – количество свободных мест
CREATE VIEW Free_Places(Class, Id, GuantityOfPeople, FreePlaces)
AS SELECT Class, Id, QuantityOfPeople, QuantityOfPeople - 
(SELECT COUNT(g.Passport) AS cnt
FROM guests g
WHERE (g.ArrivalDate<= CURDATE()) AND (g.DepartureDate>= CURDATE())
AND r.Id = g.RoomNumber) 
FROM rooms r;

INSERT INTO free_places 
VALUES (0);

# Представление "Счёт на оплату номера": сумма оплаты за номер (стоимость, 
# умноженная на количество дней проживания) и общей стоимости оказанных услуг
CREATE VIEW Bills(Guest, PayforRoom, ServicePrice)
AS SELECT g.FullName, rc.Price*(g.DepartureDate - g.ArrivalDate), SUM(pc.Price)
FROM guests g, roomsclasses rc, providedservices pc, rooms ro
WHERE ro.Id = g.RoomNumber AND 
ro.Class = rc.Class AND
g.Passport = pc.GuestPassport
GROUP BY g.Passport;

UPDATE bills 
SET ServicePrice=11000 
WHERE resident='Попова Анна Николаевна';