drop trigger DodawanieKlasa;
Delimiter $$
Create trigger DodawanieKlasa before insert on Klasa
for each row
begin
	if (new.rokRozpoczecia > YEAR(CURDATE())) then
		signal sqlstate '45000' set message_text = 'rok rozpoczecia nie moze byc wiekszy niz obecny';
	end if;
	
	if (new.idWychowawca NOT IN (SELECT idNauczyciel FROM Nauczyciel)) then
		signal sqlstate '45000' set message_text = 'nie ma takiego wychowawcy';
	end if;
end;
$$
