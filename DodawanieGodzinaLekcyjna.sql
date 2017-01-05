-- TRIGERY PRZY DODAWANIU WARTOSCI

insert into GodzinaLekcyjna values ('','10:10:00', '17:45:00');
select * from GodzinaLekcyjna;
drop trigger DodawanieGodzinaLekcyjna;
Select * from GodzinaLekcyjna;
insert into GodzinaLekcyjna values ('','08:15:00','09:00:00');

DELIMITER $$
Create trigger DodawanieGodzinaLekcyjna before insert on GodzinaLekcyjna
for each row
begin
	if (HOUR(new.godzinaRozpoczecia) < HOUR('08:00:00')) then
		signal sqlstate '45000' set message_text = 'O tej godzinie szkola jest zamknieta, zbyt wczesnie';
	end if;
		
	if (HOUR(new.godzinaZakonczenia) > HOUR('19:00:00')) then
		signal sqlstate '45000' set message_text = 'O tej godzinie szkola jest zamknieta, zbyt pozno';
	end if;
	
	if (TIME_TO_SEC(new.godzinaZakonczenia)-TIME_TO_SEC(new.godzinaRozpoczecia) <> 2700) then
		signal sqlstate '45000' set message_text = 'lekcja powinna trwac 45 minut';
	end if;

-- Czy lekcje moga sie na siebie nasuwac?

end;
$$




 