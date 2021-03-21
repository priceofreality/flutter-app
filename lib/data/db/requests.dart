import 'package:projet4/data/db/options.dart';

class Requests {
  String get createEvents => '''CREATE TABLE IF NOT EXISTS events (
      id INTEGER PRIMARY KEY, 
      label TEXT NOT NULL
    );''';

  String get createChoices => '''CREATE TABLE IF NOT EXISTS choices (
      id INTEGER PRIMARY KEY, 
      label TEXT NOT NULL
    );''';

  String get createDailySituations =>
      '''CREATE TABLE IF NOT EXISTS daily_situations (
    id INTEGER PRIMARY KEY, 
    day INTEGER NOT NULL, 
    event INTEGER REFERENCES events(id) NOT NULL, 
    locked BOOLEAN NOT NULL,
    option INTEGER REFERENCES option(id)
  );''';

  String get createDailySituationsChoices =>
      '''CREATE TABLE IF NOT EXISTS daily_situation_choices (
    daily_situation INTEGER REFERENCES daily_situations(id) NOT NULL, 
    choice INTEGER REFERENCES choices(id) NOT NULL, 
    unlock_daily_situation INTEGER REFERENCES daily_situations(id),
    concludes BOOLEAN NOT NULL,
    initial_min_cost DOUBLE,
    initial_max_cost DOUBLE,
    PRIMARY KEY (daily_situation, choice)
  );''';

  String get createOptions => '''CREATE TABLE IF NOT EXISTS option (
    id INTEGER PRIMARY KEY, 
    label TEXT NOT NULL, 
    situation INTEGER NOT NULL,
    initial_budget DOUBLE NOT NULL
  );''';

  String get createAdditionalCharges =>
      '''CREATE TABLE IF NOT EXISTS additional_charges (
    id INTEGER PRIMARY KEY, 
    additional_charge DOUBLE NOT NULL, 
    option INTEGER REFERENCES option(id) NOT NULL,
    daily_situation INTEGER NOT NULL,
    choice INTEGER NOT NULL,
    FOREIGN KEY (daily_situation, choice) REFERENCES daily_situation_choices(daily_situation, choice) 
  );''';

  String get insertAdditionalCharges =>
      '''INSERT INTO additional_charges(additional_charge, option, daily_situation, choice) VALUES

    (3, 1, 0, 0),
    (3, 1, 1, 2),
    (3, 1, 2, 0),
    (3, 1, 3, 0),
    (3, 1, 4, 4),
    (3, 1, 5, 5),
    (3, 1, 5, 1),
    (3, 1, 6, 0),
    (3, 1, 7, 6)
    (3, 1, 7, 1),
    (3, 1, 8, 5),
    (3, 1, 9, 9),
    (3, 1, 10, 8),
    (3, 1, 11, 0),
    
    (3, 2, 0, 0),
    (3, 2, 1, 2),
    (3, 2, 2, 0),
    (3, 2, 3, 0),
    (3, 2, 4, 4),
    (3, 2, 5, 5),
    (3, 2, 5, 1),
    (3, 2, 6, 0),
    (3, 2, 7, 6)
    (3, 2, 7, 1),
    (3, 2, 8, 5),
    (3, 2, 9, 9),
    (3, 2, 10, 8),
    (3, 2, 11, 0),
  
    (3, 3, 0, 0),
    (3, 3, 1, 2),
    (3, 3, 2, 0),
    (3, 3, 3, 0),
    (3, 3, 4, 4),
    (3, 3, 5, 5),
    (3, 3, 5, 1),
    (3, 3, 6, 0),
    (3, 3, 7, 6)
    (3, 3, 7, 1),
    (3, 3, 8, 5),
    (3, 3, 9, 9),
    (3, 3, 10, 8),
    (3, 3, 11, 0),

    (3, 6, 4, 4),
    (3, 6, 7, 6)

    (3, 7, 4, 4),
    (3, 7, 7, 6)

    (3, 8, 4, 4),
    (3, 8, 7, 6)

    (-300, 9, 10, 8),

    (-200, 10, 10, 8),

    (-200, 11, 10, 8),

    (-50, 12, 10, 8)

    ;''';

  String get insertDailySituationChoices =>
      '''INSERT INTO daily_situation_choices(daily_situation, choice, unlock_daily_situation, concludes, initial_min_cost, initial_max_cost) VALUES
    (0, 0, NULL, FALSE, -800, NULL),
    (0, 1, 3, FALSE, NULL, NULL),
    (1, 2, NULL, FALSE, -80, -170),
    (2, 0, NULL, FALSE, -800, NULL),
    (2, 1, 3, FALSE, NULL, NULL),
    (2, 3, 6, FALSE, NULL, NULL),
    (3, 0, NULL, FALSE, -900, NULL),
    (3, 1, 5, FALSE, NULL, NULL),
    (4, 4, NULL, FALSE, -800, NULL),
    (4, 1, 7, FALSE, NULL, NULL),
    (5, 5, NULL, FALSE, -890, NULL),
    (5, 1, NULL, FALSE, NULL, NULL),
    (6, 0, NULL, FALSE, -800, NULL),
    (6, 1, 8, FALSE, NULL, NULL),
    (7, 6, NULL, FALSE, -97.50, NULL),
    (7, 1, NULL, FALSE, NULL, NULL),
    (8, 5, NULL, FALSE, -890, NULL),
    (8, 1, 9, FALSE, NULL, NULL),
    (9, 9, NULL, TRUE, NULL, NULL),
    (10, 8, NULL, FALSE, 1330, NULL),
    (11, 0, NULL, FALSE, 800, NULL);''';

//TODO change (5, 1, ...) and (7, 1, ...)

  String get insertOptions =>
      '''INSERT INTO option(id, label, situation, initial_budget) VALUES
    (${Option.Isolated.index}, "Isole", ${Situation.FamilySituation.index}, 1100), 
    (${Option.SingleParentFamily.index}, "Famille monoparentale", ${Situation.FamilySituation.index}, 1330.74),
    (${Option.Couple.index}, "En couple", ${Situation.FamilySituation.index}, 2000),
    (${Option.CoupleWithChildren.index}, "Couple avec enfants", ${Situation.FamilySituation.index}, 3000),
    (${Option.Smoker.index}, "Fumeur", ${Situation.OptionSituation.index}, NULL),
    (${Option.PrivateVehicle.index}, "Véhicule privé", ${Situation.OptionSituation.index}, NULL),
    (${Option.PrivateComputer.index}, "Ordinateur privé", ${Situation.OptionSituation.index}, NULL),
    (${Option.Television.index}, "Télévision", ${Situation.OptionSituation.index}, NULL),
    (${Option.Smartphone.index}, "Smartphone", ${Situation.OptionSituation.index}, NULL),
    (${Option.Worker.index}, "Travailleur", ${Situation.FinancialSituation.index}, NULL),
    (${Option.Insurance.index}, "Mutuelle", ${Situation.FinancialSituation.index}, NULL)
    (${Option.OCMW.index}, "CPAS", ${Situation.FinancialSituation.index}, NULL),
    (${Option.Unemployment.index}, "Chômage", ${Situation.FinancialSituation.index}, NULL)
    ;''';

  String get insertEvents => '''INSERT INTO events(id, label) VALUES
    (0,"Payer le loyer du mois"),
    (1,"Course alimentaire de la semaine pour le ménage"),
    (2,"Premier rappel du propriétaire : Payer le loyer du mois"),
    (3,"Second rappel du propriétaire : Payer le loyer du mois"),
    (4,"Premier Rappel : Facture d’eau gaz et électricité"),
    (5,"RAPPEL 3: Lettre de la société de recouvrement"),
    (6,"Le délais prend fin : Payer le loyer du mois"),
    (7,"Second Rappel : Facture d’eau gaz et électricité"),
    (8,"Dernier rappel : Lettre de la société de recouvrement - Payer le loyer du mois"),
    (9,"VISITE DES HUISSIERS DE JUSTICE"),
    (10,"Revenus du mois");''';

  String get insertDailySituations =>
      '''INSERT INTO daily_situations(id, day, event, locked, option) VALUES
    (0, 1, 0, FALSE, NULL),
    (1, 2, 1,  FALSE, NULL),
    (2, 3, 2,  TRUE, NULL),
    (3, 6, 3,  TRUE, NULL),
    (4, 7, 4,  FALSE, NULL),
    (5, 8, 5,  TRUE, NULL),
    (6, 10, 6,  TRUE, NULL),
    (7, 22, 7,  TRUE, NULL),
    (8, 23, 8,  TRUE, NULL),
    (9, 31, 9,  TRUE, NULL),
    (10, 31, 10,  FALSE, NULL),
    (11, 32, 0,  FALSE, NULL)
    ;''';

  String get insertChoices => '''INSERT INTO choices(id, label) VALUES 
    (0, "Payer loyer directement"),
    (1, "Remettre à plus tard"),
    (2, "Courses hebdomadaires de base"),
    (3, "Négocier sept jours de délais"),
    (4, "Payer factures directement"),
    (5, "Payer directement le montant plus les intérêts"),
    (6, "Payer directement"),
    (7, "Payer directement le loyer avec les intérêts de la société de recouvrement"),
    (8, "Percevoir salaire"),
    (9, "Visite des Huissiers de Justice");''';
}
