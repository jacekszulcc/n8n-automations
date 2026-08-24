# fixtures

Dane testowe do przepływu `faktury-z-maila`. Wszystkie dane w dokumentach są
fikcyjne, kontrahent, NIP, kwoty i numery dokumentów nie odpowiadają żadnej
realnej transakcji ani firmie.

Każdy plik odpowiada jednemu przypadkowi testowemu filtra załączników:

| Plik | Przypadek |
|---|---|
| `01-faktura-1.pdf` | jeden załącznik PDF w mailu |
| `02-faktura-2.pdf` | faktura z pary dwóch załączników w jednym mailu |
| `02-potwierdzenie-przelewu.pdf` | potwierdzenie przelewu z tej samej pary |
| `03-faktura-3.pdf` | plik oczekiwany po rozpakowaniu `05-archiwum.zip` |
| `04-skan-jpg.jpg` | skan faktury jako obraz, nie PDF (~300 KB, szerokość 1500 px) |
| `05-archiwum.zip` | faktura spakowana do ZIP zamiast wysłana bezpośrednio |
