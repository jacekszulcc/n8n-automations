-- Struktury potrzebne do odtworzenia środowiska przepływu monitoring-terminow-bhp.
-- Tabela szkolenia_bhp jest źródłem danych, logi_wykonan zbiera zapis każdego uruchomienia.

CREATE TABLE szkolenia_bhp (
    id SERIAL PRIMARY KEY,
    imie_nazwisko TEXT NOT NULL,
    typ_szkolenia TEXT NOT NULL,
    data_waznosci DATE NOT NULL,
    email_przelozonego TEXT NOT NULL
);

CREATE TABLE logi_wykonan (
    id SERIAL PRIMARY KEY,
    data_wykonania TIMESTAMP DEFAULT NOW(),
    liczba_rekordow INTEGER NOT NULL,
    liczba_maili INTEGER NOT NULL,
    status TEXT NOT NULL,
    komunikat_bledu TEXT,
    czas_trwania_ms INTEGER
);
