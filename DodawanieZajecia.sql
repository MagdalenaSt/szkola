drop trigger DodawanieZajecia;

Delimiter $$

create trigger DodawanieZajecia before insert on Zajecia
for each row 
begin
	if (new.dzienTygodnia not in('poniedzialek', 'wtorek', 'sroda', 'czwartek', 'piatek')) then
		signal sqlstate '45000' set message_text = 'W tym dniu nie ma zajec';
	end if;

	if (new.idGodzinaLekcyjna not in (Select idGodzina from GodzinaLekcyjna)) then
		signal sqlstate '45000' set message_text = 'Nie ma takiej godziny';
	end if;

	if ((Select liczbaMiejsc from Sala where idSala=new.idSala) <
		(Select COUNT(UczylSie.idKlasa) from Klasa, Kurs, UczylSie 
		 where Klasa.idKlasa=Kurs.idKlasa AND UczylSie.idKlasa=Klasa.idKlasa AND Kurs.idKurs=new.idKurs)) then
			signal sqlstate '45000' set message_text = 'za mala klasa';
	end if;

end;
$$

Select COUNT(UczylSie.idKlasa) from Klasa, Kurs, UczylSie 
		 where Klasa.idKlasa=Kurs.idKlasa AND UczylSie.idKlasa=Klasa.idKlasa AND Kurs.idKurs=1;