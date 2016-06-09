I18n.translations || (I18n.translations = {});
I18n.translations["it"] = I18n.extend((I18n.translations["it"] || {}), {
  "about": {
    "gift": {
      "description": "Suggeriteci musica per la festa e tappe per il viaggio di nozze, caricate foto e fateci un regalo.",
      "title": "Festa e Lista Nozze"
    },
    "header": {
      "description": "Sabato 1 Ottobre 2016.",
      "title": "Il nostro matrimonio"
    },
    "participation": {
      "description": "Trovate i dettagli sui luoghi in cui si svolgerà la giornata e confermate la vostra presenza.",
      "title": "Conferma Presenza"
    }
  },
  "activerecord": {
    "errors": {
      "models": {
        "user": {
          "attributes": {
            "email": {
              "blank": "L'email non può essere vuota",
              "invalid": "Email non valida"
            },
            "password": {
              "blank": "La password non può essere vuota",
              "too_short": "La password è troppo corta"
            },
            "password_confirmation": {
              "confirmation": "La conferma non corrisponde alla password inserita"
            }
          }
        }
      }
    }
  },
  "devise": {
    "confirmations": {
      "confirmed": "Il tuo account è stato correttamente confermato.",
      "send_instructions": "Entro qualche minuto riceverai un messaggio email con le istruzioni per confermare il tuo account.",
      "send_paranoid_instructions": "Se il tuo indirizzo email esiste nel nostro database, entro qualche minuto riceverai un messaggio email con le istruzioni per confermare il tuo account."
    },
    "failure": {
      "already_authenticated": "Hai già effettuato l'accesso.",
      "inactive": "Il tuo account non è ancora stato attivato.",
      "invalid": "%{authentication_keys} o password non validi.",
      "last_attempt": "Hai un altro tentativo prima che il tuo account venga bloccato.",
      "locked": "Il tuo account è bloccato.",
      "not_found_in_database": "%{authentication_keys} o password non validi.",
      "timeout": "La tua sessione è scaduta, accedi nuovamente per continuare.",
      "unauthenticated": "Devi accedere o registrarti per continuare.",
      "unconfirmed": "Devi confermare il tuo indirizzo email per continuare."
    },
    "mailer": {
      "confirmation_instructions": {
        "subject": "Istruzioni per la conferma"
      },
      "reset_password_instructions": {
        "subject": "Istruzioni per reimpostare la password"
      },
      "unlock_instructions": {
        "subject": "Istruzioni per sbloccare l'account"
      }
    },
    "omniauth_callbacks": {
      "failure": "Non è stato possibile autenticarti come %{kind} perché \"%{reason}\".",
      "success": "Autenticato con successo dall'account %{kind}."
    },
    "passwords": {
      "no_token": "Non è possibile accedere a questa pagina se non provieni da una e-mail di ripristino della password. Se provieni da una e-mail di ripristino della password, assicurarti di utilizzare l'URL completo.",
      "send_instructions": "Entro qualche minuto riceverai un messaggio email con le istruzioni per reimpostare la tua password.",
      "send_paranoid_instructions": "Se il tuo indirizzo email esiste nel nostro database, entro qualche minuto riceverai un messaggio email con le istruzioni per ripristinare la password.",
      "updated": "La tua password è stata cambiata correttamente. Ora sei collegato.",
      "updated_not_active": "La tua password è stata cambiata correttamente."
    },
    "registrations": {
      "destroyed": "Arrivederci! Il tuo account è stato cancellato. Speriamo di rivederti presto.",
      "signed_up": "Benvenuto! Ti sei registrato correttamente.",
      "signed_up_but_inactive": "Ti sei registrato correttamente. Tuttavia non puoi effettuare l'accesso perché il tuo account non è stato ancora attivato.",
      "signed_up_but_locked": "Ti sei registrato correttamente. Tuttavia non puoi effettuare l'accesso perché il tuo account è bloccato.",
      "signed_up_but_unconfirmed": "Ti sei registrato correttamente. Un messaggio con il link per confermare il tuo account è stato inviato al tuo indirizzo email.",
      "update_needs_confirmation": "Il tuo account è stato aggiornato, tuttavia è necessario verificare il tuo nuovo indirizzo email. Entro qualche minuto riceverai un messaggio email con le istruzioni per confermare il tuo nuovo indirizzo email.",
      "updated": "Il tuo account è stato aggiornato."
    },
    "sessions": {
      "already_signed_out": "Sei uscito correttamente.",
      "signed_in": "Accesso effettuato con successo.",
      "signed_out": "Sei uscito correttamente."
    },
    "unlocks": {
      "send_instructions": "Entro qualche minuto riceverai un messaggio email con le istruzioni per sbloccare il tuo account.",
      "send_paranoid_instructions": "Se il tuo indirizzo email esiste nel nostro database, entro qualche minuto riceverai un messaggio email con le istruzioni per sbloccare il tuo account.",
      "unlocked": "Il tuo account è stato correttamente sbloccato. Accedi per continuare."
    }
  },
  "errors": {
    "messages": {
      "already_confirmed": "è stato già confermato, prova ad effettuare un nuovo accesso",
      "confirmation_period_expired": "deve essere confermato entro %{period}, si prega di richiederne uno nuovo",
      "expired": "è scaduto, si prega di richiederne uno nuovo",
      "not_found": "non trovato",
      "not_locked": "non era bloccato",
      "not_saved": {
        "one": "Un errore ha impedito di salvare questo %{resource}:",
        "other": "%{count} errori hanno impedito di salvare questo %{resource}:"
      }
    }
  },
  "faq": {
    "carsharing": {
      "description": "Non siete automuniti? Segnalateci il vostro bisogno. Potete dare un passaggio? Indicateci la vostra disponibilità.",
      "title": "Passaggi in Auto"
    },
    "header": {
      "description": "Alcune indicazioni utili sulla giornata.",
      "title": "FAQ"
    },
    "hospitality": {
      "description": "Quanto prima cercheremo di dare indicazioni su dove allogiare a buon prezzo.",
      "title": "Alloggio"
    },
    "parking": {
      "description": "In prossimità della Chiesa non sarà possibile parcheggiare. Potete fare riferimento ai seguenti parcheggi nei dintorni.",
      "title": "Parcheggio"
    }
  },
  "gift": {
    "header": {
      "description": "Aiutateci a sostenere questa festa, il nostro viaggio di nozze ed i nostri progetti futuri. Potrete farlo con una busta, un bonifico o Paypal.",
      "title": "Lista nozze"
    },
    "iban": {
      "number": 12345678910,
      "title": "IBAN"
    }
  },
  "guest_table": {
    "description": "Ecco la lista di chi ha confermato fino ad ora",
    "table": {
      "headers": {
        "created_at": "Data Creazione",
        "email": "Email",
        "name": "Nome",
        "surname": "Cognome",
        "updated_at": "Data Ultima Modifica"
      }
    },
    "title": "Lista Ospiti"
  },
  "header": {
    "buttons": {
      "login": "Accedi",
      "more": "Scopri",
      "signup": "Registrati"
    },
    "quote": "Con grande gioia annunciano il loro matrimonio",
    "text-primary": "Mauro e Beatrice"
  },
  "locations": {
    "church": {
      "address": {
        "city": "24122 Bergamo BG",
        "street": "Via Sant'Alessandro, 35",
        "title": "Indirizzo"
      },
      "title": "Cerimonia",
      "when": {
        "description": "16.00",
        "title": "Orario"
      },
      "where": {
        "description": "Basilica di Sant'Alessando in Colonna",
        "title": "Dove"
      }
    },
    "header": {
      "description": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum, quae, laborum, voluptate delectus odio doloremque error porro obcaecati nemo animi ducimus quaerat nostrum? Ab molestiae eaque et atque architecto reiciendis.",
      "title": "Location"
    },
    "map": "Mappa",
    "restaurant": {
      "address": {
        "city": "24020 Scanzorosciate BG",
        "street": "Via Serradesca, 2",
        "title": "Indirizzo"
      },
      "title": "Ricevimento",
      "when": {
        "description": "18.30",
        "title": "Orario"
      },
      "where": {
        "description": "Tenuta Serradesca di M. Acquaroli",
        "title": "Dove"
      }
    }
  },
  "login": {
    "form": {
      "email": {
        "label": "Email",
        "placeholder": "Email"
      },
      "password": {
        "label": "Password",
        "placeholder": "Password"
      },
      "submit": "Entra",
      "title": "Accedi"
    }
  },
  "navbar": {
    "about": "About",
    "faq": "FAQ",
    "gift": "Regalo",
    "home": "Home",
    "language": {
      "choose": "Scegli Lingua",
      "eng": "English",
      "ita": "Italiano"
    },
    "locations": "Locations",
    "login": "Accedi",
    "participations": "Partecipa",
    "playlist": "Musica",
    "register": "Registrati",
    "trip": "Luna di Miele"
  },
  "participation": {
    "guest_form": {
      "add": "Conferma",
      "name": "Nome",
      "surname": "Cognome",
      "title": "Nome Invitato"
    },
    "header": {
      "description": "Confermate di seguito la vostra presenza inserendo il codice fornitovi nell'invito.",
      "title": "Conferma Presenza"
    },
    "invited_guests": {
      "title": "Invitati Confermati"
    },
    "validation_form": {
      "check": "Verifica",
      "title": "Codice di Conferma Presenza",
      "validation": {
        "label": "Codice di Conferma Presenza",
        "placeholder": "Inserite il codice di Codice di Conferma Presenza"
      }
    }
  },
  "place_table": {
    "description": "Ecco la lista dei posti da visitare suggeriti fino ad ora",
    "table": {
      "headers": {
        "address": "Indirizzo",
        "created_at": "Data Creazione",
        "email": "Email",
        "reason": "Motivo",
        "updated_at": "Data Ultima Modifica"
      }
    },
    "title": "Lista Posti Suggeriti"
  },
  "playlist": {
    "header": {
      "description": "Una band suonerà durante il nostro ricevimento, ma potete suggerire qualche brano per il resto della serata.",
      "title": "Musica"
    }
  },
  "quotes": {
    "benigni": "\"Iniziare un nuovo cammino spaventa. Ma dopo ogni passo che percorriamo ci rendiamo conto di come era pericoloso rimanere fermi\" Roberto Benigni",
    "gaius": "Ubi tu Gaius, ibi ego Gaia",
    "gibran": "\"Una delle cose più belle nella vita, è trovare qualcuno che riesca a capirti, senza il bisogno di dare tante spiegazioni!\" Kahlil Gibran",
    "party": "Festa è partecipazione! Aiutateci a rendere ancora più speciale questo giorno unico della nostra vita e a costruire il nostro futuro.",
    "roosevelt": "\"Il futuro appartiene a coloro che credono nella bellezza dei propri sogni\" Eleanor Roosevelt",
    "schopenhauer": "\"La vita e i sogni sono fogli di uno stesso libro: leggerli in ordine è vivere, sfogliarli a caso è sognare\" Arthur Schopenhauer",
    "seneca": "\"Chi non vive per un'altra persona non vive neppure per se stesso\" Seneca",
    "twain": "\"Da a ogni giornata la possibilità di essere la più bella della tua vita\" Mark Twain",
    "wek": "\"Bisogna sempre puntare alla luna, mal che vada si è comunque arrivati in mezzo alle stelle\" Alek Wek"
  },
  "register": {
    "form": {
      "email": {
        "label": "Email",
        "placeholder": "Email"
      },
      "password": {
        "label": "Password",
        "placeholder": "Password"
      },
      "password_confirmation": {
        "label": "Conferma Password",
        "placeholder": "Conferma Password"
      },
      "submit": "Registrati",
      "title": "Registrati"
    }
  },
  "search_map": {
    "button": {
      "cancel": "Annulla",
      "submit": "Conferma"
    },
    "header": {
      "description": "Perché ci consigli questo posto?",
      "title": "Nome Posto"
    },
    "reason": {
      "label": "Motivo",
      "placeholder": "Inserisci il motivo per cui suggerisci questo posto"
    }
  },
  "simple_form": {
    "error_notification": {
      "default_message": "Per cortesia controlla i dati inseriti:"
    },
    "no": "No",
    "required": {
      "html": "",
      "mark": "*",
      "text": "obbligatorio"
    },
    "yes": "Si"
  },
  "trip": {
    "body": {
      "content": "Nel corso delle prime due settimane di Ottobre faremo un giro della Penisola. Consigliateci hotel, ristoranti, posti da vedere semplicemente cercandoli nella mappa qui sottostante e ci penseremo noi a ritrovarli."
    },
    "header": {
      "description": "Suggerite una tappa del viaggio di nozze.",
      "title": "Viaggio di Nozze"
    }
  }
});
