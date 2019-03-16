# УПОРЯДОЧЕННЫЕ СПИСКИ НОМЕРОВ, ОСВОБОЖДАЮЩИХСЯ СЕГОДНЯ И ЗАВТРА
SELECT DISTINCT RoomNumber
FROM guests g
WHERE (DepartureDate >= CURDATE()) AND (DepartureDate <= CURDATE()+1)
ORDER BY RoomNumber;

# УПОРЯДОЧЕННЫЕ СПИСКИ ПУСТЫХ НОМЕРОВ
SELECT DISTINCT RoomNumber 
FROM guests
WHERE RoomNumber NOT IN
(SELECT DISTINCT RoomNumber
FROM guests
WHERE (ArrivalDate<= CURDATE()) AND (DepartureDate>= CURDATE()))
ORDER BY RoomNumber;

# УПОРЯДОЧЕННЫЕ СПИСКИ НОМЕРОВ, В КОТОРЫХ НЕТ СВОБОДНЫХ МЕСТ
SELECT DISTINCT Id
FROM rooms r
WHERE QuantityOfPeople = 
(SELECT COUNT(g.Passport) AS cnt
FROM guests g
WHERE (g.ArrivalDate<= CURDATE()) AND (g.DepartureDate>= CURDATE())
AND r.Id = g.RoomNumber);

# УПОРЯДОЧЕННЫЕ СПИСКИ НОМЕРОВ, В КОТОРЫХ ЕСТЬ СВОБОДНЫЕ МЕСТА: СПОСОБ 1
SELECT DISTINCT Id
FROM rooms r
WHERE QuantityOfPeople > 
(SELECT COUNT(g.Passport) AS cnt
FROM guests g
WHERE (g.ArrivalDate<= CURDATE()) AND (g.DepartureDate>= CURDATE())
AND r.Id = g.RoomNumber);

# УПОРЯДОЧЕННЫЕ СПИСКИ НОМЕРОВ, В КОТОРЫХ ЕСТЬ СВОБОДНЫЕ МЕСТА: СПОСОБ 2
SELECT DISTINCT Id
FROM rooms r, 
(SELECT COUNT(g.Passport) AS cnt
FROM guests g, rooms r1
WHERE (g.ArrivalDate<= CURDATE()) AND (g.DepartureDate>= CURDATE())
AND r1.Id = g.RoomNumber) c
WHERE QuantityOfPeople > c.cnt;

# УПОРЯДОЧЕННЫЙ СПИСОК УСЛУГ, НЕ ПОЛЬЗУЮЩИХСЯ СПРОСОМ
SELECT DISTINCT Service s
FROM providedservices ps
WHERE DateOfService < (CURDATE() - 7)
ORDER BY Service;