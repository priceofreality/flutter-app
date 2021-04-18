--
-- File generated with SQLiteStudio v3.2.1 on dim. avr. 18 19:10:34 2021
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: additional_charges
CREATE TABLE additional_charges (
    option                 INTEGER NOT NULL
                                   REFERENCES options (id),
    daily_situation_choice INTEGER NOT NULL
                                   REFERENCES daily_situation_choices (id),
    charge                 DOUBLE  NOT NULL,
    PRIMARY KEY (
        option,
        daily_situation_choice
    )
);

INSERT INTO additional_charges (
                                   option,
                                   daily_situation_choice,
                                   charge
                               )
                               VALUES (
                                   1,
                                   1,
                                   7.25
                               );


-- Table: choices
CREATE TABLE choices (
    id    INTEGER PRIMARY KEY,
    label TEXT    NOT NULL
);

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        0,
                        'Payer loyer directement'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        1,
                        'Remettre à plus tard'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        2,
                        'Courses hebdomadaires de base'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        3,
                        'Négocier sept jours de délais'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        4,
                        'Payer factures directement'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        5,
                        'Payer directement le montant plus les intérêts'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        6,
                        'Payer directement'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        7,
                        'Payer directement le loyer avec les intérêts de la société de recouvrement'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        8,
                        'Percevoir salaire'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        9,
                        'Visite des Huissiers de Justice'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        10,
                        'Tu le déposes dans un refuge'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        11,
                        'Tu l’adoptes'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        12,
                        'Achat de nourriture pour chat'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        13,
                        'Payer la consultation '
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        14,
                        'Non'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        15,
                        'Percevoir les aides'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        16,
                        'Y aller'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        17,
                        'Ne pas y aller'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        18,
                        'Oui, le sport me fait du bien'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        19,
                        'Non, je n''en ai pas envie'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        20,
                        'Dans une friperie / en seconde main'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        21,
                        'Neuf dans un magasin de prêt à porter bas de gamme'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        22,
                        'Neuf dans un magasin de prêt à porter moyenne gamme'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        23,
                        'Remboursement de la différence entre la provision de charge payée mensuellement et la consommation réelle de l''année'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        24,
                        'Je suis syndiqué'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        25,
                        'Je n''ai pas de syndicat'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        26,
                        'Un ticket de Lotto'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        27,
                        'Un livre de poche '
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        28,
                        'Un journal'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        29,
                        'Un magasine'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        30,
                        'Accepter'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        31,
                        'Refuser'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        32,
                        'Payer la prochaine tournée '
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        33,
                        'Reprendre une bière '
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        34,
                        'S’arrêter là'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        35,
                        'Paquet de cigarettes industrielle'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        36,
                        'Tabac à rouler'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        37,
                        'Payer'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        38,
                        'Acheter'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        39,
                        'Payer les frais'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        40,
                        'Tu prends le taxi'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        41,
                        'Tu prends le transport en commun STIB'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        42,
                        'Tu tentes de frauder en prenant le train SNCB sans ticket'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        43,
                        'Payer tout de suite le ticket tarif à bord'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        44,
                        'Ne pas payer le ticket tarif à bord'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        45,
                        'Demande de régularisation à faire'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        46,
                        'Ne fait pas la régularisation'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        47,
                        'Payer l''amende  administrative de la SNCB'
                    );

INSERT INTO choices (
                        id,
                        label
                    )
                    VALUES (
                        48,
                        'Participer au cadeau commun'
                    );


-- Table: daily_situation_choices
CREATE TABLE daily_situation_choices (
    id                     INTEGER PRIMARY KEY,
    daily_situation        INTEGER REFERENCES daily_situations (id) 
                                   NOT NULL,
    choice                 INTEGER REFERENCES choices (id) 
                                   NOT NULL,
    unlock_daily_situation INTEGER REFERENCES daily_situations (id),
    concludes              BOOLEAN NOT NULL
);

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        1,
                                        0,
                                        0,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        2,
                                        0,
                                        1,
                                        2,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        3,
                                        1,
                                        2,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        4,
                                        2,
                                        0,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        5,
                                        2,
                                        1,
                                        3,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        6,
                                        2,
                                        3,
                                        6,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        7,
                                        3,
                                        0,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        8,
                                        3,
                                        1,
                                        5,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        9,
                                        4,
                                        4,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        10,
                                        4,
                                        1,
                                        7,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        11,
                                        5,
                                        5,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        12,
                                        5,
                                        1,
                                        8,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        13,
                                        6,
                                        0,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        14,
                                        6,
                                        1,
                                        8,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        15,
                                        7,
                                        6,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        16,
                                        7,
                                        1,
                                        9,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        17,
                                        8,
                                        5,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        18,
                                        8,
                                        1,
                                        9,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        19,
                                        9,
                                        9,
                                        NULL,
                                        1
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        20,
                                        10,
                                        8,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        21,
                                        11,
                                        0,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        22,
                                        12,
                                        10,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        23,
                                        12,
                                        11,
                                        13,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        24,
                                        12,
                                        11,
                                        14,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        25,
                                        13,
                                        12,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        26,
                                        14,
                                        13,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        27,
                                        14,
                                        14,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        28,
                                        15,
                                        2,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        29,
                                        16,
                                        15,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        30,
                                        17,
                                        16,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        31,
                                        17,
                                        17,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        32,
                                        18,
                                        2,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        33,
                                        19,
                                        18,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        34,
                                        19,
                                        19,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        35,
                                        20,
                                        20,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        36,
                                        20,
                                        21,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        37,
                                        20,
                                        22,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        38,
                                        21,
                                        23,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        39,
                                        22,
                                        24,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        40,
                                        22,
                                        25,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        41,
                                        23,
                                        2,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        42,
                                        24,
                                        26,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        43,
                                        24,
                                        27,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        44,
                                        24,
                                        28,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        45,
                                        24,
                                        29,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        46,
                                        25,
                                        2,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        47,
                                        26,
                                        30,
                                        27,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        48,
                                        26,
                                        31,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        49,
                                        27,
                                        32,
                                        28,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        50,
                                        27,
                                        33,
                                        28,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        51,
                                        27,
                                        34,
                                        NULL,
                                        1
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        52,
                                        28,
                                        32,
                                        29,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        53,
                                        28,
                                        33,
                                        29,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        54,
                                        28,
                                        34,
                                        NULL,
                                        1
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        55,
                                        29,
                                        34,
                                        NULL,
                                        1
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        56,
                                        30,
                                        35,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        57,
                                        30,
                                        36,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        58,
                                        31,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        59,
                                        32,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        60,
                                        33,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        61,
                                        34,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        62,
                                        35,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        63,
                                        36,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        64,
                                        37,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        65,
                                        38,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        66,
                                        39,
                                        38,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        67,
                                        40,
                                        39,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        68,
                                        41,
                                        40,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        69,
                                        41,
                                        41,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        70,
                                        41,
                                        42,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        71,
                                        42,
                                        43,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        72,
                                        42,
                                        44,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        73,
                                        43,
                                        45,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        74,
                                        43,
                                        46,
                                        48,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        75,
                                        44,
                                        35,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        76,
                                        44,
                                        36,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        77,
                                        45,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        78,
                                        46,
                                        35,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        79,
                                        46,
                                        36,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        80,
                                        47,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        81,
                                        48,
                                        47,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        82,
                                        49,
                                        35,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        83,
                                        49,
                                        36,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        84,
                                        50,
                                        37,
                                        NULL,
                                        0
                                    );

INSERT INTO daily_situation_choices (
                                        id,
                                        daily_situation,
                                        choice,
                                        unlock_daily_situation,
                                        concludes
                                    )
                                    VALUES (
                                        85,
                                        51,
                                        48,
                                        NULL,
                                        0
                                    );


-- Table: daily_situations
CREATE TABLE daily_situations (
    id     INTEGER PRIMARY KEY,
    day    INTEGER NOT NULL,
    event  INTEGER REFERENCES events (id) 
                   NOT NULL,
    locked BOOLEAN NOT NULL
                   CHECK (locked IN (0, 1) ) 
);

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 0,
                                 1,
                                 0,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 1,
                                 2,
                                 1,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 2,
                                 3,
                                 2,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 3,
                                 6,
                                 3,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 4,
                                 7,
                                 4,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 5,
                                 8,
                                 5,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 6,
                                 10,
                                 6,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 7,
                                 22,
                                 7,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 8,
                                 23,
                                 8,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 9,
                                 31,
                                 9,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 10,
                                 32,
                                 10,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 11,
                                 32,
                                 0,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 12,
                                 5,
                                 11,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 13,
                                 5,
                                 12,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 14,
                                 5,
                                 13,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 15,
                                 9,
                                 1,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 16,
                                 11,
                                 14,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 17,
                                 14,
                                 15,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 18,
                                 16,
                                 1,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 19,
                                 17,
                                 16,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 20,
                                 18,
                                 17,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 21,
                                 19,
                                 18,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 22,
                                 20,
                                 19,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 23,
                                 23,
                                 1,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 24,
                                 24,
                                 20,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 25,
                                 30,
                                 1,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 26,
                                 33,
                                 21,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 27,
                                 33,
                                 22,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 28,
                                 33,
                                 22,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 29,
                                 33,
                                 23,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 30,
                                 2,
                                 24,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 31,
                                 2,
                                 25,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 32,
                                 4,
                                 26,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 33,
                                 4,
                                 27,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 34,
                                 4,
                                 28,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 35,
                                 4,
                                 29,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 36,
                                 4,
                                 30,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 37,
                                 4,
                                 31,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 38,
                                 4,
                                 32,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 39,
                                 9,
                                 33,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 40,
                                 12,
                                 34,
                                 0
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 41,
                                 13,
                                 35,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 42,
                                 13,
                                 36,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 43,
                                 13,
                                 37,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 44,
                                 16,
                                 24,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 45,
                                 16,
                                 25,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 46,
                                 23,
                                 24,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 47,
                                 27,
                                 38,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 48,
                                 28,
                                 39,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 49,
                                 30,
                                 24,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 50,
                                 30,
                                 25,
                                 1
                             );

INSERT INTO daily_situations (
                                 id,
                                 day,
                                 event,
                                 locked
                             )
                             VALUES (
                                 51,
                                 15,
                                 40,
                                 0
                             );


-- Table: events
CREATE TABLE events (
    id    INTEGER PRIMARY KEY,
    label TEXT    NOT NULL
);

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       0,
                       'Payer le loyer du mois'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       1,
                       'Course alimentaire de la semaine pour le ménage'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       2,
                       'Premier rappel du propriétaire : Payer le loyer du mois'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       3,
                       'Second rappel du propriétaire : Payer le loyer du mois'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       4,
                       'Premier Rappel : Facture d’eau gaz et électricité'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       5,
                       'RAPPEL 3: Lettre de la société de recouvrement'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       6,
                       'Le délais prend fin : Payer le loyer du mois'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       7,
                       'Second Rappel : Facture d’eau gaz et électricité'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       8,
                       'Dernier rappel : Lettre de la société de recouvrement - Payer le loyer du mois'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       9,
                       'VISITE DES HUISSIERS DE JUSTICE'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       10,
                       'Revenus du mois'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       11,
                       'Tu trouves un chaton abandonné'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       12,
                       'Bravo pour l''adoption'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       13,
                       'Souhaites-tu passer chez le vétérinaire ?'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       14,
                       'Allocations familiales'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       15,
                       'Séance de sport gratuite'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       16,
                       'Souhaites-tu t''affilier à la salle de sport à un tarif avantageux'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       17,
                       'Tu achètes un nouveau pantalon …'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       18,
                       'Relevé électricité et gaz'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       19,
                       'Jour de grève syndical'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       20,
                       'C’est une belle journée, tu décides de te faire un petit plaisir et tu achètes ?'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       21,
                       'Ton ami Jean-Marie propose de t’offrir un verre au café du coin'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       22,
                       'Vous passez un bon moment en terrasse'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       23,
                       'Il est temps de rentrer'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       24,
                       'Achat de tabac'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       25,
                       'Il est temps de faire le plein d''essence'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       26,
                       'Payer l''abonnement internet-télévision-Smartphone'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       27,
                       'Payer l''abonnement internet-télévision'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       28,
                       'Payer l''abonnement internet - téléphone'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       29,
                       'Payer l''abonnement télévision - smartphone'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       30,
                       'Payer l''abonnement internet'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       31,
                       'Payer l''abonnement télévision'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       32,
                       'Payer l''abonnement smartphone'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       33,
                       'Achat d''un briquet'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       34,
                       'Accident – frais médicaux occasionnels'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       35,
                       'Tu dois te rendre à l’autre bout de la capitale…'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       36,
                       'Pas de chance : contrôle des titres de transport dans le train'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       37,
                       'Si ne paye pas le ticket tarif à bord'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       38,
                       'Assurance obligatoire RC voiture'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       39,
                       'L''amende administrative de la sncb est arrivée par recommandé.'
                   );

INSERT INTO events (
                       id,
                       label
                   )
                   VALUES (
                       40,
                       'C’est l’anniversaire surprise de Mich-Mich, ton meilleur ami'
                   );


-- Table: financial_choice_costs
CREATE TABLE financial_choice_costs (
    financial_situation    INTEGER NOT NULL
                                   REFERENCES financial_situations (id),
    daily_situation_choice INTEGER NOT NULL
                                   REFERENCES daily_situation_choices (id),
    min_cost               DOUBLE  NOT NULL,
    max_cost               DOUBLE,
    PRIMARY KEY (
        financial_situation,
        daily_situation_choice
    )
);

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       1,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       1,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       1,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       1,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       4,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       4,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       4,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       4,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       7,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       7,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       7,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       7,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       13,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       13,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       13,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       13,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       21,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       21,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       21,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       21,
-                                      1200.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       3,
-                                      70.0,
-                                      170.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       3,
-                                      30.0,
-                                      130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       3,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       3,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       28,
-                                      70.0,
-                                      170.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       28,
-                                      30.0,
-                                      130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       28,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       28,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       32,
-                                      70.0,
-                                      170.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       32,
-                                      30.0,
-                                      130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       32,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       32,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       41,
-                                      70.0,
-                                      170.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       41,
-                                      30.0,
-                                      130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       41,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       41,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       46,
-                                      70.0,
-                                      170.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       46,
-                                      30.0,
-                                      130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       46,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       46,
-                                      90.0,
-                                      190.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       9,
-                                      100.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       9,
-                                      40.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       9,
-                                      100.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       9,
-                                      100.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       11,
-                                      990.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       11,
-                                      590.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       11,
-                                      1320.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       11,
-                                      1320.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       17,
-                                      990.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       17,
-                                      590.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       17,
-                                      1320.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       17,
-                                      1320.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       15,
-                                      107.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       15,
-                                      47.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       15,
-                                      107.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       15,
-                                      107.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       20,
                                       1330.74,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       20,
                                       953.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       20,
                                       2600.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       20,
                                       2450.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       25,
-                                      20.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       25,
-                                      20.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       25,
-                                      20.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       25,
-                                      20.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       29,
                                       427.6,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       29,
                                       407.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       37,
-                                      24.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       37,
-                                      24.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       37,
-                                      24.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       37,
-                                      24.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       38,
                                       43.02,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       38,
                                       93.77,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       38,
                                       74.64,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       38,
                                       69.13,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       39,
                                       8.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       43,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       43,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       43,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       43,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       44,
-                                      2.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       44,
-                                      2.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       44,
-                                      2.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       44,
-                                      2.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       1,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       1,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       1,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       1,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       1,
-                                      700.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       1,
-                                      1000.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       3,
-                                      50.0,
                                       100.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       3,
-                                      30.0,
                                       80.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       3,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       3,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       3,
-                                      80.0,
                                       130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       56,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       57,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       58,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       4,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       4,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       4,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       4,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       4,
-                                      700.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       4,
-                                      1000.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       59,
-                                      70.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       59,
-                                      70.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       59,
-                                      70.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       59,
-                                      80.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       59,
-                                      80.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       59,
-                                      86.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       59,
-                                      86.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       59,
-                                      86.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       59,
-                                      95.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       59,
-                                      95.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       60,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       61,
-                                      55.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       62,
-                                      27.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       62,
-                                      27.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       62,
-                                      27.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       62,
-                                      43.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       62,
-                                      43.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       62,
-                                      43.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       62,
-                                      43.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       62,
-                                      43.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       62,
-                                      61.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       62,
-                                      61.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       63,
-                                      30.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       64,
-                                      11.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       64,
-                                      7.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       65,
-                                      19.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       65,
-                                      19.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       65,
-                                      19.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       65,
-                                      34.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       65,
-                                      34.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       65,
-                                      34.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       65,
-                                      34.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       65,
-                                      34.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       65,
-                                      54.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       65,
-                                      54.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       25,
-                                      16.49,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       25,
-                                      16.49,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       25,
-                                      16.49,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       25,
-                                      16.49,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       25,
-                                      16.49,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       25,
-                                      16.49,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       26,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       7,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       7,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       7,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       7,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       7,
-                                      700.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       7,
-                                      1000.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       9,
-                                      40.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       9,
-                                      40.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       9,
-                                      100.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       9,
-                                      100.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       9,
-                                      100.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       9,
-                                      100.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       11,
-                                      550.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       11,
-                                      550.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       11,
-                                      990.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       11,
-                                      990.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       11,
-                                      770.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       11,
-                                      1100.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       28,
-                                      50.0,
                                       100.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       28,
-                                      30.0,
                                       80.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       28,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       28,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       28,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       28,
-                                      80.0,
                                       130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       66,
-                                      80.0,
                                       1.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       13,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       13,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       13,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       13,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       13,
-                                      700.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       13,
-                                      1000.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       29,
-                                      427.6,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       29,
-                                      407.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       67,
-                                      20.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       68,
-                                      35.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       69,
-                                      10.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       71,
-                                      12.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       73,
-                                      75.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       32,
-                                      50.0,
                                       100.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       32,
-                                      30.0,
                                       80.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       32,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       32,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       32,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       32,
-                                      80.0,
                                       130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       75,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       76,
-                                      9.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       77,
-                                      37.48,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       33,
-                                      15.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       35,
-                                      9.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       36,
-                                      14.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       37,
-                                      29.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       37,
-                                      29.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       37,
-                                      29.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       37,
-                                      29.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       37,
-                                      29.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       37,
-                                      29.99,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       38,
-                                      21.67,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       38,
-                                      19.98,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       38,
-                                      28.68,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       38,
-                                      27.92,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       38,
-                                      23.64,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       38,
-                                      28.85,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       15,
-                                      47.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       15,
-                                      47.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       15,
-                                      107.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       15,
-                                      107.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       15,
-                                      107.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       15,
-                                      107.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       41,
-                                      50.0,
                                       100.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       41,
-                                      30.0,
                                       80.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       41,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       41,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       41,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       41,
-                                      80.0,
                                       130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       78,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       79,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       42,
-                                      2.2,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       43,
-                                      6.9,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       43,
-                                      6.9,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       43,
-                                      6.9,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       43,
-                                      6.9,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       43,
-                                      6.9,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       43,
-                                      6.9,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       44,
                                       0.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       44,
                                       0.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       44,
                                       0.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       44,
                                       0.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       44,
                                       0.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       44,
                                       0.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       45,
-                                      4.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       80,
-                                      24.7,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       81,
-                                      250.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       46,
-                                      50.0,
                                       100.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       46,
-                                      30.0,
                                       80.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       46,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       46,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       46,
-                                      70.0,
                                       120.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       46,
-                                      80.0,
                                       130.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       82,
-                                      6.5,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       83,
-                                      9.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       84,
-                                      34.79,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       20,
-                                      715.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       20,
-                                      984.68,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       20,
-                                      1135.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       20,
-                                      1312.9,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       20,
-                                      980.72,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       20,
-                                      1330.74,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       49,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       50,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       52,
-                                      14.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       53,
-                                      3.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       0,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       1,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       2,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       3,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       85,
                                       0.0,
                                       50.0
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       4,
                                       21,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       5,
                                       21,
-                                      500.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       6,
                                       21,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       7,
                                       21,
-                                      900.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       8,
                                       21,
-                                      700.0,
                                       NULL
                                   );

INSERT INTO financial_choice_costs (
                                       financial_situation,
                                       daily_situation_choice,
                                       min_cost,
                                       max_cost
                                   )
                                   VALUES (
                                       9,
                                       21,
-                                      1000.0,
                                       NULL
                                   );


-- Table: financial_daily_situations
CREATE TABLE financial_daily_situations (
    financial_situation INTEGER REFERENCES financial_situations (id),
    daily_situation     INTEGER REFERENCES daily_situations (id),
    PRIMARY KEY (
        financial_situation,
        daily_situation
    )
);

INSERT INTO financial_daily_situations (
                                           financial_situation,
                                           daily_situation
                                       )
                                       VALUES (
                                           0,
                                           16
                                       );

INSERT INTO financial_daily_situations (
                                           financial_situation,
                                           daily_situation
                                       )
                                       VALUES (
                                           3,
                                           16
                                       );

INSERT INTO financial_daily_situations (
                                           financial_situation,
                                           daily_situation
                                       )
                                       VALUES (
                                           2,
                                           22
                                       );

INSERT INTO financial_daily_situations (
                                           financial_situation,
                                           daily_situation
                                       )
                                       VALUES (
                                           6,
                                           16
                                       );

INSERT INTO financial_daily_situations (
                                           financial_situation,
                                           daily_situation
                                       )
                                       VALUES (
                                           9,
                                           16
                                       );


-- Table: financial_situations
CREATE TABLE financial_situations (
    id                     INTEGER PRIMARY KEY,
    label                  TEXT    NOT NULL,
    budget                 DOUBLE  NOT NULL,
    family_situation       INTEGER NOT NULL,
    professional_situation INTEGER NOT NULL
);

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     0,
                                     '2.C (Famille Monoparentale)',
                                     1330.74,
                                     1,
                                     2
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     1,
                                     '1.D (Isolé.e)',
                                     953.0,
                                     0,
                                     3
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     2,
                                     '3.A (En couple)',
                                     2600.0,
                                     2,
                                     0
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     3,
                                     '4.B (Couple avec enfants)',
                                     2450.0,
                                     3,
                                     1
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     4,
                                     '1.B (Isolé.e)',
                                     715.0,
                                     0,
                                     1
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     5,
                                     '1.C (Isolé.e)',
                                     715.0,
                                     0,
                                     2
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     6,
                                     '2.D (Famille Monoparentale)',
                                     1135.0,
                                     1,
                                     3
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     7,
                                     '3.C (En couple)',
                                     1312.9,
                                     2,
                                     2
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     8,
                                     '3.D (En couple)',
                                     1312.9,
                                     2,
                                     3
                                 );

INSERT INTO financial_situations (
                                     id,
                                     label,
                                     budget,
                                     family_situation,
                                     professional_situation
                                 )
                                 VALUES (
                                     9,
                                     '4.C (Couple avec enfants)',
                                     1330.74,
                                     3,
                                     2
                                 );


-- Table: glossary
CREATE TABLE glossary (
    id         INTEGER PRIMARY KEY,
    label      TEXT    NOT NULL,
    definition TEXT    NOT NULL
);

INSERT INTO glossary (
                         id,
                         label,
                         definition
                     )
                     VALUES (
                         1,
                         'Actiris',
                         'Actiris est l’organisme régional chargé de la politique de l’emploi de Bruxelles-capitale. Les missions principales d’Actiris sont de faciliter le Matching entre chercheur d’emploi et employeur et aider à la transition vers l’emploi. La transition peut se faire à travers des stages, une reprise d’étude,...'
                     );

INSERT INTO glossary (
                         id,
                         label,
                         definition
                     )
                     VALUES (
                         2,
                         'Service de médiation de dette',
                         'Le service de médiation de dette est une des aides proposées par le CPAS. a comme mission de proposer un accompagnement à toute personne désirant assainir sa situation financière. L''accompagnement a pour but d’aider à trouver un compromis pour vivre décemment et rembourser les dettes. Le médiateur de dette fait le pont entre la personne aidée et le créancier pour trouver un compromis et faire valoir ses droits.'
                     );

INSERT INTO glossary (
                         id,
                         label,
                         definition
                     )
                     VALUES (
                         3,
                         'ONEM',
                         'L’Office National de l’emploi est une institution publique de sécurité sociale responsable principalement de l’organisation l’assurance chômage, d’interruption de carrière et de crédit-temps. Ils sont donc responsables de l’admissibilité d’une personne à l’allocation de chômage et contrôlent le montant. Ils sont responsables de l’intégration sur le marché de l’emploi ou à la reprise après une longue période de chômage et de la gestion des régimes d’allocations lors de la reprise d’un emploi ou pendant le chômage temporaire.'
                     );

INSERT INTO glossary (
                         id,
                         label,
                         definition
                     )
                     VALUES (
                         4,
                         'CAPAC',
                         'La Caisse auxiliaire de paiement des allocations de chômage est chargée du paiement des allocations de chômage. Elle assure chaque mois le versement d''un revenu de remplacement. La sécurité sociale est principalement financée par : les cotisations des travailleurs salariés et des employeurs ; et l''intervention de l''État. Pour le secteur chômage, les fonds sont gérés par l''ONEM, qui les répartit entre les 4 organismes de paiement des allocations de chômage (la CAPAC et les syndicats) en fonction des paiements effectués.'
                     );

INSERT INTO glossary (
                         id,
                         label,
                         definition
                     )
                     VALUES (
                         5,
                         'CPAS',
                         'centre public d''action sociale, assure la prestation d''un certain nombre de services sociaux et veille au bien-être de chaque citoyen. Chaque commune ou ville à son propre CPAS offrant un large éventail de services.En Belgique bon nombre de gens disposent de moyens de subsistance insuffisants ou sont parfois sans domicile fixe. Toutes ces personnes peuvent bénéficier de l''assistance sociale du CPAS. Chaque personne résidant légalement en Belgique a droit à une assistance sociale. Cette assistance sociale a pour but de garantir un revenu minimum à l''ensemble de la population.'
                     );

INSERT INTO glossary (
                         id,
                         label,
                         definition
                     )
                     VALUES (
                         6,
                         'Mutuelle',
                         'La mutualité est l’organisme qui gère l’assurance obligatoire permettant de bénéficier d’une assurance maladie de base. Si tu travailles ou que tu as plus de 25 ans, tu dois impérativement t’inscrire dans une mutualité pour pouvoir être remboursé des soins de santé, ou toucher des indemnités en cas de souci.Une fois que tu t’es inscrit à une mutualité en tant que titulaire, ta cotisation te couvre ainsi que les personnes à ta charge (tes enfants, les personnes domiciliées chez toi (conjoint, cohabitant, ascendant) et qui ont un revenu inférieur à un plafond déterminé).De façon générale, tu es couvert par la mutuelle de tes parents jusqu’à ce que tu travailles ou jusqu’à tes 25 ans. '
                     );

INSERT INTO glossary (
                         id,
                         label,
                         definition
                     )
                     VALUES (
                         7,
                         'Société de recouvrement',
                         'Une société de recouvrement est un intermédiaire qui va aider le créancier, à la demande de ce dernier, à récupérer sa créance chez son débiteur.'
                     );

INSERT INTO glossary (
                         id,
                         label,
                         definition
                     )
                     VALUES (
                         8,
                         'Etre syndiqué',
                         'Une personne syndiquée est une personne qui choisit d''adhérer à une organisation syndicale.
                         C’est avant tout trouver du soutien lorsque l’on en a besoin. C’est aussi aider les autres à différents degrés selon votre implication. C’est enfin l’opportunité de faire des rencontres, de participer à des échanges aussi constructifs qu’intéressants et de participer à la vie de votre entreprise.
                         Il n’existe pas de condition particulière requise pour appartenir à un syndicat (sauf évidemment, l’obligation de payer la cotisation annuelle demandée par l’organisation elle-même).'
                     );


-- Table: option_daily_situations
CREATE TABLE option_daily_situations (
    option          INTEGER NOT NULL
                            REFERENCES options (id),
    daily_situation INTEGER NOT NULL
                            REFERENCES daily_situations (id),
    PRIMARY KEY (
        option,
        daily_situation
    )
);

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        1,
                                        30
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        1,
                                        39
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        1,
                                        44
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        1,
                                        46
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        1,
                                        49
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        2,
                                        45
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        2,
                                        47
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        2,
                                        50
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        10,
                                        41
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        10,
                                        42
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        10,
                                        43
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        3,
                                        32
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        4,
                                        33
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        5,
                                        34
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        6,
                                        35
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        7,
                                        36
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        8,
                                        37
                                    );

INSERT INTO option_daily_situations (
                                        option,
                                        daily_situation
                                    )
                                    VALUES (
                                        9,
                                        38
                                    );


-- Table: option_groups
CREATE TABLE option_groups (
    id    INTEGER PRIMARY KEY,
    label TEXT    NOT NULL
);

INSERT INTO option_groups (
                              id,
                              label
                          )
                          VALUES (
                              1,
                              'Divers'
                          );

INSERT INTO option_groups (
                              id,
                              label
                          )
                          VALUES (
                              2,
                              'Telecom'
                          );

INSERT INTO option_groups (
                              id,
                              label
                          )
                          VALUES (
                              3,
                              'Transports'
                          );


-- Table: options
CREATE TABLE options (
    id           INTEGER PRIMARY KEY,
    option_group INTEGER NOT NULL
                         REFERENCES option_groups (id),
    label        TEXT    NOT NULL
);

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        1,
                        1,
                        'Fumeur'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        2,
                        3,
                        'Véhicule'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        3,
                        2,
                        'Ordinateur + télévision + smartphone'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        4,
                        2,
                        'Ordinateur + télévision'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        5,
                        2,
                        'Ordinateur + smartphone'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        6,
                        2,
                        'Télévision + smartphone'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        7,
                        2,
                        'Télévision'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        8,
                        2,
                        'Ordinateur'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        9,
                        2,
                        'Smartphone'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        10,
                        3,
                        'Sans véhicule'
                    );

INSERT INTO options (
                        id,
                        option_group,
                        label
                    )
                    VALUES (
                        11,
                        2,
                        'Sans abonnement'
                    );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
