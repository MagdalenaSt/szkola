drop trigger DodawanieKurs;

Delimiter $$ 
Create trigger DodawanieKurs before insert on Kurs
for each row
begin
	if (new.rokSzkolny > YEAR(CURDATE())) then
		signal sqlstate '45000' set message_text = 'rok szkolny nie moze byc wiekszy niz obecny';
	end if;

	if (new.idNauczyciel NOT IN (SELECT idNauczyciel FROM Nauczyciel)) then
		signal sqlstate '45000' set message_text = 'nie ma takiego nauczyciela';
	end if;
	
	if (new.idPrzedmiot NOT IN (SELECT idPrzedmiot FROM Przedmiot)) then
		signal sqlstate '45000' set message_text = 'nie ma takiego przedmiotu';
	end if;
	
	if (new.idKlasa NOT IN (SELECT idKlasa FROM Klasa)) then
		signal sqlstate '45000' set message_text = 'nie ma takiej klasy';
	end if;

	if (new.idPrzedmiot NOT IN 
	(Select idPrzedmiot from Specjalizacja Where new.idNauczyciel=idNauczyciel)) then
		signal sqlstate '45000' set message_text = 'nauczyciel nie moze uczyc tego przedmiotu';
	end if;		

end;
$$
