-- Struktury dla przepływu faktury-z-maila.
-- Zweryfikowane względem bazy w Adminerze (nie odtworzone z pamięci).

CREATE TABLE faktury (
    id SERIAL PRIMARY KEY,
    id_wiadomosci TEXT,
    nazwa_pliku TEXT,
    data_przetworzenia TIMESTAMPTZ DEFAULT NOW(),
    numer_faktury VARCHAR(255),
    data_wystawienia DATE,
    data_sprzedazy DATE,
    sprzedawca_nazwa VARCHAR(255),
    sprzedawca_nip VARCHAR(20),
    nabywca_nazwa VARCHAR(255),
    nabywca_nip VARCHAR(20),
    kwota_netto NUMERIC(15,2),
    kwota_brutto NUMERIC(15,2),
    termin_platnosci DATE,
    status_platnosci VARCHAR(50)
        CHECK (status_platnosci IN ('do_zaplaty', 'zaplacono')),
    data_otrzymania TIMESTAMPTZ,
    UNIQUE (numer_faktury, sprzedawca_nip)
);

CREATE TABLE do_weryfikacji (
    id SERIAL PRIMARY KEY,
    id_wiadomosci TEXT NOT NULL,
    nazwa_pliku TEXT NOT NULL,
    data_otrzymania TIMESTAMPTZ,
    data_przetworzenia TIMESTAMPTZ DEFAULT NOW(),
    powod VARCHAR(50) NOT NULL
        CHECK (powod IN ('nieobslugiwany_typ', 'nie_faktura', 'blad_zapisu')),
    szczegoly TEXT,
    surowy_odczyt TEXT,
    status_obslugi VARCHAR(50) DEFAULT 'oczekuje'
        CHECK (status_obslugi IN ('oczekuje', 'poprawione', 'odrzucone'))
);

-- logi_wykonan powstała przy pierwszym przepływie (monitoring-terminow-bhp/schema.sql).
-- Drugi przepływ dokłada kolumny, żeby nie nadpisywać liczba_maili innym znaczeniem
-- niż w pierwszym przepływie.
ALTER TABLE logi_wykonan
    ADD COLUMN nazwa_przeplywu TEXT,
    ADD COLUMN liczba_zapisanych INTEGER,
    ADD COLUMN liczba_do_weryfikacji INTEGER;
