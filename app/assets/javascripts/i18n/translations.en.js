I18n.translations || (I18n.translations = {});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {
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
      "messages": {
        "record_invalid": "Validation failed: %{errors}",
        "restrict_dependent_destroy": {
          "many": "Cannot delete record because dependent %{record} exist",
          "one": "Cannot delete record because a dependent %{record} exists"
        }
      },
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
  "date": {
    "abbr_day_names": [
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat"
    ],
    "abbr_month_names": [
      null,
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ],
    "day_names": [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ],
    "formats": {
      "default": "%Y-%m-%d",
      "long": "%B %d, %Y",
      "short": "%b %d"
    },
    "month_names": [
      null,
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ],
    "order": [
      "year",
      "month",
      "day"
    ]
  },
  "datetime": {
    "distance_in_words": {
      "about_x_hours": {
        "one": "about 1 hour",
        "other": "about %{count} hours"
      },
      "about_x_months": {
        "one": "about 1 month",
        "other": "about %{count} months"
      },
      "about_x_years": {
        "one": "about 1 year",
        "other": "about %{count} years"
      },
      "almost_x_years": {
        "one": "almost 1 year",
        "other": "almost %{count} years"
      },
      "half_a_minute": "half a minute",
      "less_than_x_minutes": {
        "one": "less than a minute",
        "other": "less than %{count} minutes"
      },
      "less_than_x_seconds": {
        "one": "less than 1 second",
        "other": "less than %{count} seconds"
      },
      "over_x_years": {
        "one": "over 1 year",
        "other": "over %{count} years"
      },
      "x_days": {
        "one": "1 day",
        "other": "%{count} days"
      },
      "x_minutes": {
        "one": "1 minute",
        "other": "%{count} minutes"
      },
      "x_months": {
        "one": "1 month",
        "other": "%{count} months"
      },
      "x_seconds": {
        "one": "1 second",
        "other": "%{count} seconds"
      }
    },
    "prompts": {
      "day": "Day",
      "hour": "Hour",
      "minute": "Minute",
      "month": "Month",
      "second": "Seconds",
      "year": "Year"
    }
  },
  "devise": {
    "confirmations": {
      "confirmed": "Your email address has been successfully confirmed.",
      "send_instructions": "You will receive an email with instructions for how to confirm your email address in a few minutes.",
      "send_paranoid_instructions": "If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes."
    },
    "failure": {
      "already_authenticated": "You are already signed in.",
      "inactive": "Your account is not activated yet.",
      "invalid": "Invalid %{authentication_keys} or password.",
      "last_attempt": "You have one more attempt before your account is locked.",
      "locked": "Your account is locked.",
      "not_found_in_database": "Invalid %{authentication_keys} or password.",
      "timeout": "Your session expired. Please sign in again to continue.",
      "unauthenticated": "You need to sign in or sign up before continuing.",
      "unconfirmed": "You have to confirm your email address before continuing."
    },
    "mailer": {
      "confirmation_instructions": {
        "subject": "Confirmation instructions"
      },
      "password_change": {
        "subject": "Password Changed"
      },
      "reset_password_instructions": {
        "subject": "Reset password instructions"
      },
      "unlock_instructions": {
        "subject": "Unlock instructions"
      }
    },
    "omniauth_callbacks": {
      "failure": "Could not authenticate you from %{kind} because \"%{reason}\".",
      "success": "Successfully authenticated from %{kind} account."
    },
    "passwords": {
      "no_token": "You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.",
      "send_instructions": "You will receive an email with instructions on how to reset your password in a few minutes.",
      "send_paranoid_instructions": "If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.",
      "updated": "Your password has been changed successfully. You are now signed in.",
      "updated_not_active": "Your password has been changed successfully."
    },
    "registrations": {
      "destroyed": "Bye! Your account has been successfully cancelled. We hope to see you again soon.",
      "signed_up": "Welcome! You have signed up successfully.",
      "signed_up_but_inactive": "You have signed up successfully. However, we could not sign you in because your account is not yet activated.",
      "signed_up_but_locked": "You have signed up successfully. However, we could not sign you in because your account is locked.",
      "signed_up_but_unconfirmed": "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.",
      "update_needs_confirmation": "You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirm link to confirm your new email address.",
      "updated": "Your account has been updated successfully."
    },
    "sessions": {
      "already_signed_out": "Signed out successfully.",
      "signed_in": "Signed in successfully.",
      "signed_out": "Signed out successfully."
    },
    "unlocks": {
      "send_instructions": "You will receive an email with instructions for how to unlock your account in a few minutes.",
      "send_paranoid_instructions": "If your account exists, you will receive an email with instructions for how to unlock it in a few minutes.",
      "unlocked": "Your account has been unlocked successfully. Please sign in to continue."
    }
  },
  "errors": {
    "connection_refused": "Oops! Failed to connect to the Web Console middleware.\nPlease make sure a rails development server is running.\n",
    "format": "%{attribute} %{message}",
    "messages": {
      "accepted": "must be accepted",
      "already_confirmed": "was already confirmed, please try signing in",
      "blank": "can't be blank",
      "confirmation": "doesn't match %{attribute}",
      "confirmation_period_expired": "needs to be confirmed within %{period}, please request a new one",
      "empty": "can't be empty",
      "equal_to": "must be equal to %{count}",
      "even": "must be even",
      "exclusion": "is reserved",
      "expired": "has expired, please request a new one",
      "greater_than": "must be greater than %{count}",
      "greater_than_or_equal_to": "must be greater than or equal to %{count}",
      "inclusion": "is not included in the list",
      "invalid": "is invalid",
      "less_than": "must be less than %{count}",
      "less_than_or_equal_to": "must be less than or equal to %{count}",
      "not_a_number": "is not a number",
      "not_an_integer": "must be an integer",
      "not_found": "not found",
      "not_locked": "was not locked",
      "not_saved": {
        "one": "1 error prohibited this %{resource} from being saved:",
        "other": "%{count} errors prohibited this %{resource} from being saved:"
      },
      "odd": "must be odd",
      "other_than": "must be other than %{count}",
      "present": "must be blank",
      "taken": "has already been taken",
      "too_long": {
        "one": "is too long (maximum is 1 character)",
        "other": "is too long (maximum is %{count} characters)"
      },
      "too_short": {
        "one": "is too short (minimum is 1 character)",
        "other": "is too short (minimum is %{count} characters)"
      },
      "wrong_length": {
        "one": "is the wrong length (should be 1 character)",
        "other": "is the wrong length (should be %{count} characters)"
      }
    },
    "unacceptable_request": "A supported version is expected in the Accept header.\n",
    "unavailable_session": "Session %{id} is is no longer available in memory.\n\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\nthis request hit doesn't store %{id} in memory. Consider turning the number of\nprocesses/workers to one (1) or using a different server in development.\n"
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
  "flash": {
    "actions": {
      "create": {
        "notice": "%{resource_name} was successfully created."
      },
      "destroy": {
        "alert": "%{resource_name} could not be destroyed.",
        "notice": "%{resource_name} was successfully destroyed."
      },
      "update": {
        "notice": "%{resource_name} was successfully updated."
      }
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
    "description": "The list of the people who confirmed their participation so far",
    "table": {
      "headers": {
        "created_at": "Created At",
        "email": "Email",
        "name": "Name",
        "surname": "Surname",
        "updated_at": "Updated At"
      }
    },
    "title": "Guest List"
  },
  "header": {
    "buttons": {
      "login": "Login",
      "more": "More",
      "signup": "Sign Up"
    },
    "quote": "Are delighted to invite you to celebrate their marriage",
    "text-primary": "Mauro e Beatrice"
  },
  "helpers": {
    "select": {
      "prompt": "Please select"
    },
    "submit": {
      "create": "Create %{model}",
      "submit": "Save %{model}",
      "update": "Update %{model}"
    }
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
      "submit": "Enter",
      "title": "Login"
    }
  },
  "navbar": {
    "about": "About",
    "faq": "FAQ",
    "gift": "Gift",
    "home": "Home",
    "language": {
      "choose": "Choose Language",
      "eng": "English",
      "ita": "Italiano"
    },
    "locations": "Locations",
    "login": "Login",
    "participations": "Participation",
    "playlist": "Music",
    "register": "Sign Up",
    "trip": "Honeymoon"
  },
  "number": {
    "currency": {
      "format": {
        "delimiter": ",",
        "format": "%u%n",
        "precision": 2,
        "separator": ".",
        "significant": false,
        "strip_insignificant_zeros": false,
        "unit": "$"
      }
    },
    "format": {
      "delimiter": ",",
      "precision": 3,
      "separator": ".",
      "significant": false,
      "strip_insignificant_zeros": false
    },
    "human": {
      "decimal_units": {
        "format": "%n %u",
        "units": {
          "billion": "Billion",
          "million": "Million",
          "quadrillion": "Quadrillion",
          "thousand": "Thousand",
          "trillion": "Trillion",
          "unit": ""
        }
      },
      "format": {
        "delimiter": "",
        "precision": 3,
        "significant": true,
        "strip_insignificant_zeros": true
      },
      "storage_units": {
        "format": "%n %u",
        "units": {
          "byte": {
            "one": "Byte",
            "other": "Bytes"
          },
          "gb": "GB",
          "kb": "KB",
          "mb": "MB",
          "tb": "TB"
        }
      }
    },
    "percentage": {
      "format": {
        "delimiter": "",
        "format": "%n%"
      }
    },
    "precision": {
      "format": {
        "delimiter": ""
      }
    }
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
    "description": "The list of place to visit suggested so far",
    "table": {
      "headers": {
        "address": "Address",
        "created_at": "Created At",
        "email": "Email",
        "reason": "Reason",
        "updated_at": "Updated At"
      }
    },
    "title": "Suggested Places List"
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
        "label": "Password Confirmation",
        "placeholder": "Password Confirmation"
      },
      "submit": "Sign Up",
      "title": "Sign Up"
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
      "default_message": "Please review the problems below:"
    },
    "no": "No",
    "required": {
      "html": "",
      "mark": "*",
      "text": "required"
    },
    "yes": "Yes"
  },
  "support": {
    "array": {
      "last_word_connector": ", and ",
      "two_words_connector": " and ",
      "words_connector": ", "
    }
  },
  "time": {
    "am": "am",
    "formats": {
      "default": "%a, %d %b %Y %H:%M:%S %z",
      "long": "%B %d, %Y %H:%M",
      "short": "%d %b %H:%M"
    },
    "pm": "pm"
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
