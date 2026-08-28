# n8n-automations

Zbiór przepływów n8n do automatyzacji procesów, self-hosted na Dockerze.

## Przepływy

- [`monitoring-terminow-bhp/`](monitoring-terminow-bhp/), codziennie sprawdza terminy
  szkoleń BHP i badań lekarskich, wysyła powiadomienia na trzech poziomach pilności.
- [`faktury-z-maila/`](faktury-z-maila/), wyciąga dane z faktur nadchodzących mailem
  i zapisuje je do bazy. Ukończony, komplet standardu jakości: Error Workflow,
  logowanie do tabeli, poświadczenia w Credentials, eksport JSON w repo.

Katalog [`alert-awarii/`](alert-awarii/) to nie osobny przepływ biznesowy, tylko wspólny
dla całego repo workflow alertujący, podpinany jako Error Workflow pod inne przepływy.
