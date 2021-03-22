import 'package:projet4/data/db/options.dart';

class Requests {
  String get createFinancialSituations =>
      '''CREATE TABLE IF NOT EXISTS financial_situations(
      id INTEGER PRIMARY KEY AUTO_INCREMENT, 
      label TEXT NOT NULL, 
      budget DOUBLE NOT NULL,
      familial_situation INT NOT NULL,
      professional_situation INT NOT NULL  
    );''';

  String get createChoices => '''CREATE TABLE IF NOT EXISTS choices (
      id INTEGER PRIMARY KEY, 
      label TEXT NOT NULL
    );''';

  String get createEvents => '''CREATE TABLE IF NOT EXISTS events (
    id INTEGER PRIMARY KEY, 
    label TEXT NOT NULL
  );''';
/*
  String get createOptions => '''CREATE TABLE IF NOT EXISTS option (
    id INTEGER PRIMARY KEY, 
    label TEXT NOT NULL
  );''';
*/
  String get createDailySituations =>
      '''CREATE TABLE IF NOT EXISTS daily_situations (
    id INTEGER PRIMARY KEY, 
    day INTEGER NOT NULL, 
    event INTEGER REFERENCES events(id) NOT NULL, 
    locked BOOLEAN NOT NULL
    );''';

  String get createDailySituationsChoices =>
      '''CREATE TABLE IF NOT EXISTS daily_situation_choices (
    id INTEGER PRIMARY KEY,
    daily_situation INTEGER REFERENCES daily_situations(id) NOT NULL, 
    choice INTEGER REFERENCES choices(id) NOT NULL, 
    unlock_daily_situation INTEGER REFERENCES daily_situations(id),
    concludes BOOLEAN NOT NULL,
  );''';

  String get createFinancialChoiceCosts =>
      '''CREATE TABLE IF NOT EXISTS financial_choice_costs(
    financial_situation INTEGER NOT NULL,
    choice INTEGER NOT NULL,
    daily_situation INTEGER NOT NULL,
    cost_min DOUBLE NOT NULL,
    cost_max DOUBLE,
    PRIMARY KEY (choice, financial_situation)
  );''';

  //    FOREIGN KEY (daily_situation, choice) REFERENCES daily_situation_choices(daily_situation, choice),

/*
  String get createAdditionalCharges =>
      '''CREATE TABLE IF NOT EXISTS additional_charges (
    id INTEGER PRIMARY KEY, 
    additional_charge DOUBLE NOT NULL, 
    option INTEGER REFERENCES option(id) NOT NULL,
    daily_situation INTEGER NOT NULL,
    choice INTEGER NOT NULL,
    FOREIGN KEY (daily_situation, choice) REFERENCES daily_situation_choices(daily_situation, choice) 
  );''';
*/
  String get insertFinancialSituations =>
      '''INSERT INTO financial_situations(id, label, budget, familial_situation, professional_situation) VALUES
    (0, "2.C (Famille Monoparentale)", 1330.74, ${FamilySituation.SingleParentFamily}, ${ProfessionalSituation.OCMW}),
    (1, "1.D (Isolé.e)", 953.00, ${FamilySituation.Isolated}, ${ProfessionalSituation.Unemployment}),
    (2, "3.A (En couple)", 2600.00, ${FamilySituation.Couple}, ${ProfessionalSituation.Worker}),
    (3, "4.B (Couple avec enfants)", 2450.00, ${FamilySituation.CoupleWithChildren}, ${ProfessionalSituation.Insurance});
  ''';

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
    (9, "Visite des Huissiers de Justice"),
    (10, "Tu le déposes dans un refuge"),
    (11, "Tu l’adoptes"),
    (12, "Achat de nourriture pour chat"),
    (13, "Payer la consultation "),
    (14, "Non"),
    (15, "Percevoir les aides"),
    (16, "Y aller"),
    (17, "Ne pas y aller"),
    (18, "Oui, le sport me fait du bien"),
    (19, "Non, je n'en ai pas envie"),
    (20, "Dans une friperie / en seconde main"),
    (21, "Neuf dans un magasin de prêt à porter bas de gamme"),
    (22, "Neuf dans un magasin de prêt à porter moyenne gamme"),
    (23, "Remboursement de la différence entre la provision de charge payée mensuellement et la consommation réelle de l'année"),
    (24, "Je suis syndiqué"),
    (25, "Je n'ai pas de syndicat"),
    (26, "Un ticket de Lotto"),
    (27, "Un livre de poche "),
    (28, "Un journal"),
    (29, "Un magasine"),
    (30, "Accepter"),
    (31, "Refuser"),
    (32, "Payer la prochaine tournée "),
    (33, "Reprendre une bière "),
    (34, "S’arrêter là");''';

  String get insertEvents => '''INSERT INTO events(id, label) VALUES
    (0, "Payer le loyer du mois"),
    (1, "Course alimentaire de la semaine pour le ménage"),
    (2, "Premier rappel du propriétaire : Payer le loyer du mois"),
    (3, "Second rappel du propriétaire : Payer le loyer du mois"),
    (4, "Premier Rappel : Facture d’eau gaz et électricité"),
    (5, "RAPPEL 3: Lettre de la société de recouvrement"),
    (6, "Le délais prend fin : Payer le loyer du mois"),
    (7, "Second Rappel : Facture d’eau gaz et électricité"),
    (8, "Dernier rappel : Lettre de la société de recouvrement - Payer le loyer du mois"),
    (9, "VISITE DES HUISSIERS DE JUSTICE"),
    (10, "Revenus du mois"),
    (11, "Tu trouves un chaton abandonné"),
    (12, "Bravo pour l'adoption"),
    (13, "Souhaites-tu passer chez le vétérinaire ?"),
    (14, "Allocations familiales"),
    (15, "Séance de sport gratuite"),
    (16, "Souhaites-tu t'affilier à la salle de sport à un tarif avantageux"),
    (17, "Tu achètes un nouveau pantalon …"),
    (18, "Relevé électricité et gaz"),
    (19, "Jour de grève syndical"),
    (20, "C’est une belle journée, tu décides de te faire un petit plaisir et tu achètes … ?"),
    (21, "Ton ami Jean-Marie propose de t’offrir un verre au café du coin"),
    (22, "Vous passez un bon moment en terrasse"),
    (23, "Il est temps de rentrer");''';
/*
  String get insertOptions => '''INSERT INTO option(id, label) VALUES
    (${Option.Smoker.index}, "Fumeur"),
    (${Option.PrivateVehicle.index}, "Véhicule privé"),
    (${Option.PrivateComputer.index}, "Ordinateur privé"),
    (${Option.Television.index}, "Télévision"),
    (${Option.Smartphone.index}, "Smartphone")
    ;''';
*/
  String get insertDailySituations =>
      '''INSERT INTO daily_situations(id, day, event, locked) VALUES
    (0, 1, 0,  FALSE),
    (1, 2, 1,  FALSE),
    (2, 3, 2,  TRUE),
    (12, 5, 11, TRUE),
    (13, 5, 12, FALSE),
    (14, 5, 13, FALSE),
    (3, 6, 3,  TRUE),
    (4, 7, 4,  FALSE),
    (5, 8, 5,  TRUE),
    (15, 9, 1,  TRUE),
    (6, 10, 6,  TRUE),
    (16, 11, 14, TRUE),
    (17, 14, 15, TRUE),
    (18, 16, 1,  TRUE),
    (19, 17, 16, TRUE),
    (20, 18, 17, TRUE),
    (21, 19, 18, TRUE),
    (22, 20, 19, TRUE),
    (7, 22, 7,  TRUE),
    (23, 23, 1,  TRUE),
    (8, 23, 8,  TRUE),
    (24, 24, 20, TRUE),
    (25, 30, 1, TRUE),
    (9, 31, 9,  TRUE),
    (10, 31, 10,  FALSE),
    (11, 32, 0,  FALSE),
    (26, 33, 21, TRUE),
    (27, 33, 22, FALSE),
    (28, 33, 22, FALSE),
    (29, 33, 23, FALSE);
    ;''';

  String get insertDailySituationChoices =>
      '''INSERT INTO daily_situation_choices(daily_situation, choice, unlock_daily_situation, concludes) VALUES
    (0, 0, NULL, FALSE),
    (0, 1, 2, FALSE),
    (1, 2, NULL, FALSE),
    (2, 0, NULL, FALSE),
    (2, 1, 3, FALSE),
    (2, 3, 6, FALSE),
    (3, 0, NULL, FALSE),
    (3, 1, 5, FALSE),
    (4, 4, NULL, FALSE),
    (4, 1, 7, FALSE),
    (5, 5, NULL, FALSE),
    (5, 1, 8, FALSE),
    (6, 0, NULL, FALSE),
    (6, 1, 8, FALSE),
    (7, 6, NULL, FALSE),
    (7, 1, 9, FALSE),
    (8, 5, NULL, FALSE),
    (8, 1, 9, FALSE),
    (9, 9, NULL, TRUE),
    (10, 8, NULL, FALSE),
    (11, 0, NULL, FALSE),
    (12, 10, NULL, FALSE),
    (12, 11, 13, FALSE),
    (12, 11, 14, FALSE),
    (13, 12, NULL, FALSE),
    (14, 13, NULL, FALSE),
    (14, 14, NULL, FALSE),
    (15, 2, NULL, FALSE),
    (16, 15, NULL, FALSE),
    (17, 16, NULL, FALSE),
    (17, 17, NULL, FALSE),
    (18, 2, NULL, FALSE),
    (19, 18, NULL, FALSE),
    (19, 19, NULL, FALSE),
    (20, 20, NULL, FALSE),
    (20, 21, NULL, FALSE),
    (20, 22, NULL, FALSE),
    (21, 23, NULL, FALSE),
    (22, 24, NULL, FALSE),
    (22, 25, NULL, FALSE),
    (23, 2, NULL, FALSE),
    (24, 26, NULL, FALSE),
    (24, 27, NULL, FALSE),
    (24, 28, NULL, FALSE),
    (24, 29, NULL, FALSE),
    (25, 2, NULL, FALSE),
    (26, 30, 27, FALSE),
    (26, 31, NULL, FALSE),
    (27, 32, 28, FALSE),
    (27, 33, 28, FALSE),
    (27, 34, NULL, TRUE),
    (28, 32, 29, FALSE),
    (28, 33, 29, FALSE),
    (28, 34, NULL, TRUE),
    (29, 34, NULL, TRUE);
    
  ''';

  String get insertFinancialChoiceCost => '''
  INSERT INTO financial_choice_costs (choice, financial_situation, daily_situation, cost_min, cost_max) VALUES
    (0, 0, 0, 900.0, NULL),
    (0, 1, 0, 500.0, NULL),
    (0, 2, 0, 1200.0, NULL),
    (0, 3, 0, 1200.0, NULL),
    (0, 0, 2, 900.0, NULL),
    (0, 1, 2, 500.0, NULL),
    (0, 2, 2, 1200.0, NULL),
    (0, 3, 2, 1200.0, NULL),
    (0, 0, 3, 900.0, NULL),
    (0, 1, 3, 500.0, NULL),
    (0, 2, 3, 1200.0, NULL),
    (0, 3, 3, 1200.0, NULL),
    (0, 0, 6, 900.0, NULL),
    (0, 1, 6, 500.0, NULL),
    (0, 2, 6, 1200.0, NULL),
    (0, 3, 6, 1200.0, NULL),
    (0, 0, 11, 900.0, NULL),
    (0, 1, 11, 500.0, NULL),
    (0, 2, 11, 1200.0, NULL),
    (0, 3, 11, 1200.0, NULL),
    (2, 0, 1, 70.0, 170.0),
    (2, 1, 1, 30.0, 130.0),
    (2, 2, 1, 90.0, 190.0),
    (2, 3, 1, 90.0, 190.0),
    (2, 0, 15, 70.0, 170.0),
    (2, 1, 15, 30.0, 130.0),
    (2, 2, 15, 90.0, 190.0),
    (2, 3, 15, 90.0, 190.0),
    (2, 0, 18, 70.0, 170.0),
    (2, 1, 18, 30.0, 130.0),
    (2, 2, 18, 90.0, 190.0),
    (2, 3, 18, 90.0, 190.0),
    (2, 0, 23, 70.0, 170.0),
    (2, 1, 23, 30.0, 130.0),
    (2, 2, 23, 90.0, 190.0),
    (2, 3, 23, 90.0, 190.0),
    (2, 0, 25, 70.0, 170.0),
    (2, 1, 25, 30.0, 130.0),
    (2, 2, 25, 90.0, 190.0),
    (2, 3, 25, 90.0, 190.0),
    (4, 0, 4, 100.0, NULL),
    (4, 1, 4, 40.0, NULL),
    (4, 2, 4, 100.0, NULL),
    (4, 3, 4, 100.0, NULL),
    (5, 0, 5, 990.0, NULL),
    (5, 1, 5, 590.0, NULL),
    (5, 2, 5, 1320.0, NULL),
    (5, 3, 5, 1320.0, NULL),
    (5, 0, 8, 990.0, NULL),
    (5, 1, 8, 590.0, NULL),
    (5, 2, 8, 1320.0, NULL),
    (5, 3, 8, 1320.0, NULL),
    (6, 0, 7, 107.5, NULL),
    (6, 1, 7, 47.5, NULL),
    (6, 2, 7, 107.5, NULL),
    (6, 3, 7, 107.5, NULL),
    (8, 0, 10, -1330.74, NULL),
    (8, 1, 10, -953.0, NULL),
    (8, 2, 10, -2600.0, NULL),
    (8, 3, 10, -2450.0, NULL),
    (12, 0, 13, 20.0, NULL),
    (12, 1, 13, 20.0, NULL),
    (12, 2, 13, 20.0, NULL),
    (12, 3, 13, 20.0, NULL),
    (13, 0, 14, 35.0, NULL),
    (13, 1, 14, 35.0, NULL),
    (13, 2, 14, 35.0, NULL),
    (13, 3, 14, 35.0, NULL),
    (15, 0, 16, -427.6,NULL),
    (15, 3, 16, -407.2, NULL),
    (18, 0, 19, 15.0, NULL),
    (18, 1, 19, 15.0, NULL),
    (18, 2, 19, 15.0, NULL),
    (18, 3, 19, 15.0, NULL),
    (20, 0, 20, 9.99, NULL),
    (20, 1, 20, 9.99, NULL),
    (20, 2, 20, 9.99, NULL),
    (20, 3, 20, 9.99, NULL),
    (21, 0, 20, 14.99,NULL),
    (21, 1, 20, 14.99,NULL),
    (21, 2, 20, 14.99,NULL),
    (21, 3, 20, 14.99,NULL),
    (22, 0, 20, 24.99,NULL),
    (22, 1, 20, 24.99,NULL),
    (22, 2, 20, 24.99,NULL),
    (22, 3, 20, 24.99,NULL),
    (23, 0, 21, -43.02, NULL),
    (23, 1, 21, -93.77, NULL),
    (23, 2, 21, -74.64,NULL),
    (23, 3, 21, -69.13,NULL),
    (24, 2, 22, -8.0, NULL),
    (26, 0, 24, 2.2, NULL),
    (26, 1, 24, 2.2, NULL),
    (26, 2, 24, 2.2, NULL),
    (26, 3, 24, 2.2, NULL),
    (27, 0, 24, 10.0, NULL),
    (27, 1, 24, 10.0, NULL),
    (27, 2, 24, 10.0, NULL),
    (27, 3, 24, 10.0, NULL),
    (28, 0, 24, 2.0, NULL),
    (28, 1, 24, 2.0, NULL),
    (28, 2, 24, 2.0, NULL),
    (28, 3, 24, 2.0, NULL),
    (29, 0, 24, 4.0, NULL),
    (29, 1, 24, 4.0, NULL),
    (29, 2, 24, 4.0, NULL),
    (29, 3, 24, 4.0, NULL),
    (32, 0, 27, 14.0, NULL),
    (32, 1, 27, 14.0, NULL),
    (32, 2, 27, 14.0, NULL),
    (32, 3, 27, 14.0, NULL),
    (32, 0, 28, 14.0, NULL),
    (32, 1, 28, 14.0, NULL),
    (32, 2, 28, 14.0, NULL),
    (32, 3, 28, 14.0, NULL),
    (33, 0, 27, 3.0, NULL),
    (33, 1, 27, 3.0, NULL),
    (33, 2, 27, 3.0, NULL),
    (33, 3, 27, 3.0, NULL),
    (33, 0, 28, 3.0, NULL),
    (33, 1, 28, 3.0, NULL),
    (33, 2, 28, 3.0, NULL),
    (33, 3, 28, 3.0, NULL);
    ''';
/*
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
    (3, 1, 7, 6),
    (3, 1, 7, 1),
    (3, 1, 8, 5),
    (3, 1, 9, 9),
    (3, 1, 10, 8),
    (3, 1, 11, 0)
    ;''';
    */
}
