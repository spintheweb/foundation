# Spin the Web – Documentazione per la costituzione della Fondazione (IT)

Questo repository contiene modelli in LaTeX per redigere la documentazione necessaria alla costituzione della Fondazione dedicata al progetto “Spin the Web”. I modelli sono in italiano e includono:

- Atto costitutivo (modello personalizzabile)
- Statuto (con opzioni per fondazione “classica” o Ente del Terzo Settore – ETS)
- Regolamento interno (facoltativo)
- Codice etico (facoltativo)
- Relazione programmatica/pluriennale (facoltativa, utile per riconoscimento e RUNTS)

I modelli sono pensati per essere compilati con LaTeX e adattati ai dati reali (denominazione, sede, scopi, organi, dotazione patrimoniale, ecc.).

> Nota legale: questi modelli hanno scopo informativo e operativo; non sostituiscono la consulenza di un notaio/consulente. La costituzione di una fondazione richiede l’atto notarile e l’eventuale riconoscimento della personalità giuridica, nonché (se applicabile) l’iscrizione al RUNTS.

---

## Missione e valori
La Fondazione “Spin the Web” nasce per promuovere la cultura digitale, l’innovazione sociale e la condivisione di conoscenze, con particolare attenzione all’inclusività e all’etica.

## Struttura del repository
- Documenti LaTeX suddivisi in:
	- `docs/latex/istituzionale/`: atti, statuto, regolamento, codice etico, relazione programmatica, allegati
	- `docs/latex/extra/`: policy operative e modelli gestionali
- File di configurazione e preambolo condiviso (`docs/latex/config.tex`, `docs/latex/preamble.tex`)
- Script di compilazione automatica (`build.sh`)
- File di licenza (CC BY-SA 4.0)

## Navigazione e utilizzo
- Personalizza `docs/latex/config.tex` con i dati della fondazione
- Consulta le introduzioni nei file `.tex` per comprendere lo scopo di ciascun documento
- Compila i PDF tramite `build.sh` (produce solo `documentazione_istituzionale.pdf` e `documentazione_extra.pdf` nella root) o tramite editor LaTeX

## File principali
- `LICENSE`: licenza Creative Commons BY-SA 4.0
- `build.sh`: script di compilazione automatica

## Informazioni di contatto
Per domande, suggerimenti o segnalazioni, contatta i responsabili della fondazione all’indirizzo email info@spintheweb.org.
Sito web ufficiale: [www.spintheweb.org](https://www.spintheweb.org)

## Output della build
La compilazione produce **solo due PDF finali** nella root del repository:
- `documentazione_istituzionale.pdf`: raccoglie tutti i documenti istituzionali
- `documentazione_extra.pdf`: raccoglie policy operative e modelli gestionali
Tutti gli altri file intermedi e sorgenti rimangono nelle rispettive cartelle.
- Verifica la conformità dei testi alle normative vigenti
- Consulta un professionista per la revisione finale

---

## Struttura dei file principali

- `docs/latex/`
  - `preamble.tex`: preambolo LaTeX condiviso (pacchetti, stile).
  - `config.tex`: variabili e opzioni (nome fondazione, sede, ETS sì/no, ecc.).
  - `documentazione_istituzionale.tex`: file master per il PDF con gli atti ufficiali.
  - `documentazione_extra.tex`: file master per il PDF con la documentazione operativa.
  - `documentazione_operativa.tex`: modello non incluso nella build standard.
  - `istituzionale/`: contiene i singoli capitoli del PDF istituzionale.
    - `atto_costitutivo.tex`
    - `statuto.tex`
    - `regolamento_interno.tex` (opzionale)
    - `codice_etico.tex` (opzionale)
    - `relazione_programmatica.tex` (opzionale)
    - `fondatori.tex` (allegato)
  - `extra/`: contiene i capitoli del PDF extra.
  - `operativa/`: attualmente vuota.

## Come personalizzare

1) Apri `docs/latex/config.tex` e imposta:
- Denominazione della fondazione, sigla breve
- Sede legale, eventuali sedi operative
- Scopi e attività di interesse generale (con tag ebranding/digitalizzazione)
- Dotazione patrimoniale iniziale e fonti di finanziamento
- Configurazione organi (CdA, Presidente, eventuale Direttore, Organo di controllo, Revisore)
- Opzione ETS (abilita/disabilita clausole specifiche del Codice del Terzo Settore)

2) Rivedi i documenti (`atto_costitutivo.tex`, `statuto.tex`, ecc.) e adatta gli articoli/commi alle scelte effettive. Le parti condizionali sono indicate e si attivano con l’opzione ETS.

## Compilazione

Pre-requisiti: una distribuzione LaTeX (TeX Live o MiKTeX) e `latexmk` consigliato.

Compilazione rapida (PDFLaTeX) con script dedicato:

```bash
cd d:/Projects/spintheweb/foundation
./build.sh
```

Gli artefatti intermedi vengono salvati in `build/`, mentre i PDF finali vengono spostati automaticamente nella cartella root del repository.

Pulizia artefatti:

```bash
# Rimuove solo i file intermedi LaTeX (mantiene i PDF)
./build.sh clean

# Rimuove anche i PDF nella root (mantiene build/.gitkeep)
./build.sh distclean
```

In alternativa, puoi aprire i file `.tex` in un editor LaTeX (VS Code + LaTeX Workshop) e compilare, impostando l'output directory su `build/`.

## Suggerimenti operativi (Italia)

- Fondazione “riconosciuta”: atto notarile + richiesta riconoscimento (Prefettura/Regione) con dotazione patrimoniale adeguata.
- Fondazione ETS: conformità al D.Lgs. 117/2017 (Codice del Terzo Settore) + iscrizione al RUNTS, con clausole statutarie specifiche (devoluzione patrimonio, bilanci, organi di controllo al superamento soglie, ecc.).
- Verifica fiscale/contabile: regime fiscale applicabile, tenuta scritture, bilanci e rendicontazione delle attività.

Consulta sempre un notaio e un consulente per allineare i testi alle normative vigenti e al caso concreto.

## Modello di finanziamento e benefici per gli sponsor
La fondazione è finanziata esclusivamente tramite sponsorizzazioni. Gli sponsor ricevono consulenza gratuita e altri benefici, modulati in base al livello di sponsorship, come stabilito dal Consiglio di Amministrazione.

I potenziali sponsor possono contattare la fondazione all’indirizzo email (da inserire) per discutere le opportunità di sponsorizzazione e i relativi benefici fiscali e di visibilità.

Le sponsorizzazioni possono essere destinate a progetti specifici o alla fondazione in generale, e saranno utilizzate per sostenere le attività istituzionali, i progetti di innovazione sociale e le iniziative di formazione e sensibilizzazione sulla cultura digitale.

La fondazione si impegna a riconoscere pubblicamente il contributo degli sponsor, nel rispetto della normativa vigente e delle linee guida etiche del progetto “Spin the Web”.
