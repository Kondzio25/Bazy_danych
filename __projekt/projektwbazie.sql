
CREATE TABLE IF NOT EXISTS `lagodzinskik`.`PucharSwiataWLotachNarciarskich` (
  `idPucharSwiata` INT NOT NULL,
  `data_rozpoczecia` DATE NOT NULL,
  `data_zakonczenia` DATE NOT NULL,
  PRIMARY KEY (`idPucharSwiata`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`Skocznia` (
  `idSkocznia` INT NOT NULL,
  `nazwa` VARCHAR(45) NOT NULL,
  `kraj` VARCHAR(45) NOT NULL,
  `miejscowosc` VARCHAR(45) NOT NULL,
  `rekord_skoczni` FLOAT NULL,
  PRIMARY KEY (`idSkocznia`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`Reprezentacja` (
  `idReprezentacja` INT UNSIGNED NOT NULL,
  `kraj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idReprezentacja`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`Zawodnik` (
  `idZawodnik` INT UNSIGNED NOT NULL,
  `imie` VARCHAR(45) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `data_urodzenia` DATE NOT NULL,
  `narodowosc` VARCHAR(45) NOT NULL,
  `Reprezentacja_idReprezentacja` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idZawodnik`, `Reprezentacja_idReprezentacja`),
  INDEX `fk_Zawodnik_Reprezentacja1_idx` (`Reprezentacja_idReprezentacja` ASC) VISIBLE,
  CONSTRAINT `fk_Zawodnik_Reprezentacja1`
    FOREIGN KEY (`Reprezentacja_idReprezentacja`)
    REFERENCES `lagodzinskik`.`Reprezentacja` (`idReprezentacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`TrenerGlowny` (
  `idTrener` INT NOT NULL,
  `imie` VARCHAR(45) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `data_urodzenia` DATE NOT NULL,
  `narodowosc` VARCHAR(45) NOT NULL,
  `Reprezentacja_idReprezentacja` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTrener`, `Reprezentacja_idReprezentacja`),
  INDEX `fk_TrenerGlowny_Reprezentacja1_idx` (`Reprezentacja_idReprezentacja` ASC) VISIBLE,
  CONSTRAINT `fk_TrenerGlowny_Reprezentacja1`
    FOREIGN KEY (`Reprezentacja_idReprezentacja`)
    REFERENCES `lagodzinskik`.`Reprezentacja` (`idReprezentacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`Loty_zawodników` (
  `idLoty_zawodników` INT NOT NULL,
  PRIMARY KEY (`idLoty_zawodników`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`TurniejCzterechSkoczni` (
  `idTurniejCzterechSkoczni` INT NOT NULL,
  `data_rozpoczecia` DATE NOT NULL,
  `data_zakonczenia` DATE NOT NULL,
  PRIMARY KEY (`idTurniejCzterechSkoczni`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`PucharNarodow` (
  `idPucharNarodow` INT NOT NULL,
  `data_rozpoczecia` DATE NOT NULL,
  `data_zakonczenia` DATE NOT NULL,
  PRIMARY KEY (`idPucharNarodow`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`Trener_has_Trener` (
  `Trener_idTrener` INT NOT NULL,
  `Trener_idTrener1` INT NOT NULL,
  PRIMARY KEY (`Trener_idTrener`, `Trener_idTrener1`),
  INDEX `fk_Trener_has_Trener_Trener2_idx` (`Trener_idTrener1` ASC) VISIBLE,
  INDEX `fk_Trener_has_Trener_Trener1_idx` (`Trener_idTrener` ASC) VISIBLE,
  CONSTRAINT `fk_Trener_has_Trener_Trener1`
    FOREIGN KEY (`Trener_idTrener`)
    REFERENCES `lagodzinskik`.`TrenerGlowny` (`idTrener`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trener_has_Trener_Trener2`
    FOREIGN KEY (`Trener_idTrener1`)
    REFERENCES `lagodzinskik`.`TrenerGlowny` (`idTrener`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`TabelaWynikow_PSWLN` (
  `idWyniki_PSWLN` INT NOT NULL,
  `data_konkursu` DATE NOT NULL,
  `nr_skoku_PSWLN` INT NOT NULL,
  `odleglosc_PSWLN` FLOAT NOT NULL,
  `punkty_PSWLN` FLOAT NOT NULL,
  `Zawodnik_idZawodnik` INT UNSIGNED NOT NULL,
  `Zawodnik_Reprezentacja_idReprezentacja` INT UNSIGNED NOT NULL,
  `PucharSwiataWLotachNarciarskich_idPucharSwiata` INT NOT NULL,
  PRIMARY KEY (`idWyniki_PSWLN`, `Zawodnik_idZawodnik`, `Zawodnik_Reprezentacja_idReprezentacja`, `PucharSwiataWLotachNarciarskich_idPucharSwiata`),
  INDEX `fk_TabelaWynikow_Zawodnik1_idx` (`Zawodnik_idZawodnik` ASC, `Zawodnik_Reprezentacja_idReprezentacja` ASC) VISIBLE,
  INDEX `fk_TabelaWynikow_PSWLN_PucharSwiataWLotachNarciarskich1_idx` (`PucharSwiataWLotachNarciarskich_idPucharSwiata` ASC) VISIBLE,
  CONSTRAINT `fk_TabelaWynikow_Zawodnik1`
    FOREIGN KEY (`Zawodnik_idZawodnik` , `Zawodnik_Reprezentacja_idReprezentacja`)
    REFERENCES `lagodzinskik`.`Zawodnik` (`idZawodnik` , `Reprezentacja_idReprezentacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TabelaWynikow_PSWLN_PucharSwiataWLotachNarciarskich1`
    FOREIGN KEY (`PucharSwiataWLotachNarciarskich_idPucharSwiata`)
    REFERENCES `lagodzinskik`.`PucharSwiataWLotachNarciarskich` (`idPucharSwiata`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`TurniejCzterechSkoczni_has_Skocznia` (
  `TurniejCzterechSkoczni_idTurniejCzterechSkoczni` INT NOT NULL,
  `Skocznia_idSkocznia` INT NOT NULL,
  PRIMARY KEY (`TurniejCzterechSkoczni_idTurniejCzterechSkoczni`, `Skocznia_idSkocznia`),
  INDEX `fk_TurniejCzterechSkoczni_has_Skocznia_Skocznia1_idx` (`Skocznia_idSkocznia` ASC) VISIBLE,
  INDEX `fk_TurniejCzterechSkoczni_has_Skocznia_TurniejCzterechSkocz_idx` (`TurniejCzterechSkoczni_idTurniejCzterechSkoczni` ASC) VISIBLE,
  CONSTRAINT `fk_TurniejCzterechSkoczni_has_Skocznia_TurniejCzterechSkoczni1`
    FOREIGN KEY (`TurniejCzterechSkoczni_idTurniejCzterechSkoczni`)
    REFERENCES `lagodzinskik`.`TurniejCzterechSkoczni` (`idTurniejCzterechSkoczni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TurniejCzterechSkoczni_has_Skocznia_Skocznia1`
    FOREIGN KEY (`Skocznia_idSkocznia`)
    REFERENCES `lagodzinskik`.`Skocznia` (`idSkocznia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`PucharNarodow_has_Skocznia` (
  `PucharNarodow_idPucharNarodow` INT NOT NULL,
  `Skocznia_idSkocznia` INT NOT NULL,
  PRIMARY KEY (`PucharNarodow_idPucharNarodow`, `Skocznia_idSkocznia`),
  INDEX `fk_PucharNarodow_has_Skocznia_Skocznia1_idx` (`Skocznia_idSkocznia` ASC) VISIBLE,
  INDEX `fk_PucharNarodow_has_Skocznia_PucharNarodow1_idx` (`PucharNarodow_idPucharNarodow` ASC) VISIBLE,
  CONSTRAINT `fk_PucharNarodow_has_Skocznia_PucharNarodow1`
    FOREIGN KEY (`PucharNarodow_idPucharNarodow`)
    REFERENCES `lagodzinskik`.`PucharNarodow` (`idPucharNarodow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PucharNarodow_has_Skocznia_Skocznia1`
    FOREIGN KEY (`Skocznia_idSkocznia`)
    REFERENCES `lagodzinskik`.`Skocznia` (`idSkocznia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`PucharSwiataWLotachNarciarskich_has_Skocznia` (
  `PucharSwiataWLotachNarciarskich_idPucharSwiata` INT NOT NULL,
  `Skocznia_idSkocznia` INT NOT NULL,
  PRIMARY KEY (`PucharSwiataWLotachNarciarskich_idPucharSwiata`, `Skocznia_idSkocznia`),
  INDEX `fk_PucharSwiataWLotachNarciarskich_has_Skocznia_Skocznia1_idx` (`Skocznia_idSkocznia` ASC) VISIBLE,
  INDEX `fk_PucharSwiataWLotachNarciarskich_has_Skocznia_PucharSwiat_idx` (`PucharSwiataWLotachNarciarskich_idPucharSwiata` ASC) VISIBLE,
  CONSTRAINT `fk_PucharSwiataWLotachNarciarskich_has_Skocznia_PucharSwiataW1`
    FOREIGN KEY (`PucharSwiataWLotachNarciarskich_idPucharSwiata`)
    REFERENCES `lagodzinskik`.`PucharSwiataWLotachNarciarskich` (`idPucharSwiata`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PucharSwiataWLotachNarciarskich_has_Skocznia_Skocznia1`
    FOREIGN KEY (`Skocznia_idSkocznia`)
    REFERENCES `lagodzinskik`.`Skocznia` (`idSkocznia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`TabelaWynikow_TCS` (
  `idWyniki_TCS` INT NOT NULL,
  `data_konkursu` DATE NOT NULL,
  `nr_skoku_TCS` INT NOT NULL,
  `odleglosc_TCS` FLOAT NOT NULL,
  `punkty_TCS` FLOAT NOT NULL,
  `Zawodnik_idZawodnik` INT UNSIGNED NOT NULL,
  `Zawodnik_Reprezentacja_idReprezentacja` INT UNSIGNED NOT NULL,
  `TurniejCzterechSkoczni_idTurniejCzterechSkoczni` INT NOT NULL,
  PRIMARY KEY (`idWyniki_TCS`, `Zawodnik_idZawodnik`, `Zawodnik_Reprezentacja_idReprezentacja`, `TurniejCzterechSkoczni_idTurniejCzterechSkoczni`),
  INDEX `fk_TabelaWynikow_Zawodnik1_idx` (`Zawodnik_idZawodnik` ASC, `Zawodnik_Reprezentacja_idReprezentacja` ASC) VISIBLE,
  INDEX `fk_TabelaWynikow_TCS_TurniejCzterechSkoczni1_idx` (`TurniejCzterechSkoczni_idTurniejCzterechSkoczni` ASC) VISIBLE,
  CONSTRAINT `fk_TabelaWynikow_Zawodnik10`
    FOREIGN KEY (`Zawodnik_idZawodnik` , `Zawodnik_Reprezentacja_idReprezentacja`)
    REFERENCES `lagodzinskik`.`Zawodnik` (`idZawodnik` , `Reprezentacja_idReprezentacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TabelaWynikow_TCS_TurniejCzterechSkoczni1`
    FOREIGN KEY (`TurniejCzterechSkoczni_idTurniejCzterechSkoczni`)
    REFERENCES `lagodzinskik`.`TurniejCzterechSkoczni` (`idTurniejCzterechSkoczni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `lagodzinskik`.`TabelaWynikow_PN` (
  `idWyniki_PN` INT NOT NULL,
  `punkty_PN` FLOAT NOT NULL,
  `Zawodnik_Reprezentacja_idReprezentacja` INT UNSIGNED NOT NULL,
  `PucharNarodow_idPucharNarodow` INT NOT NULL,
  PRIMARY KEY (`idWyniki_PN`, `Zawodnik_Reprezentacja_idReprezentacja`, `PucharNarodow_idPucharNarodow`),
  INDEX `fk_TabelaWynikow_Zawodnik1_idx` (`Zawodnik_Reprezentacja_idReprezentacja` ASC) VISIBLE,
  INDEX `fk_TabelaWynikow_PN_PucharNarodow1_idx` (`PucharNarodow_idPucharNarodow` ASC) VISIBLE,
  CONSTRAINT `fk_TabelaWynikow_Zawodnik11`
    FOREIGN KEY (`Zawodnik_Reprezentacja_idReprezentacja`)
    REFERENCES `lagodzinskik`.`Zawodnik` (`Reprezentacja_idReprezentacja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TabelaWynikow_PN_PucharNarodow1`
    FOREIGN KEY (`PucharNarodow_idPucharNarodow`)
    REFERENCES `lagodzinskik`.`PucharNarodow` (`idPucharNarodow`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



# Wyzwalacz, który przed wstawieniem lub modyfikacją 
# tabeli Zawodnik ma sprawdzić, czy narodowość to Polska
DELIMITER //
CREATE TRIGGER Zawodnik_before_insert
BEFORE INSERT ON Zawodnik
FOR EACH ROW
BEGIN
	IF NEW.narodowosc = 'Polska'
    THEN
    SET NEW.narodowosc = 'Polska';
    END IF;
END
//
DELIMITER ;


# Wyzwalacz ma za zadanie zliczenie rekordów o tej samej 
# narodowości po dodaniu nowych rekordów
DELIMITER //
CREATE TRIGGER Zawodnik_z_kraju
AFTER INSERT ON Zawodnik
FOR EACH ROW
BEGIN
	DECLARE ilosc INT;
    SET ilosc = ( SELECT COUNT(*) FROM Zawodnik
    WHERE narodowosc = new.narodowosc );
END
//
DELIMITER ;


# Procedura ma za zadanie dodać po 50 pkt dla każdej reprezentacji
DELIMITER $$
CREATE PROCEDURE bonus(IN id INT)
BEGIN
	UPDATE TabelaWynikow_PN SET punkty_PN = punkty_PN + 50 WHERE idWyniki_PN = id;
END
$$
DELIMITER ;


# Funkcja ma za zadanie zliczyć wszystkie punkty Kamila Stocha, które zdobył w całym Pucharze Świata w Lotach Narciarskich
DELIMITER $$
CREATE FUNCTION suma_punktow(KS FLOAT)
	RETURNS FLOAT
BEGIN
	DECLARE KS FLOAT;
	SELECT SUM(punkty_PSWLN) WHERE Zawodnik_idZawodnik = 1 INTO @KS;
    RETURN @KS;
END
$$
DELIMITER ;
