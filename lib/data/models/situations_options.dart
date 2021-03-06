enum FamilySituation {
  Isolated,
  SingleParentFamily,
  Couple,
  CoupleWithChildren
}

extension FamilySituationModifier on FamilySituation {
  String get label {
    switch (this) {
      case FamilySituation.Couple:
        return "En couple";
      case FamilySituation.Isolated:
        return "Personne isolée";
      case FamilySituation.CoupleWithChildren:
        return "En couple avec 2 enfants";
      case FamilySituation.SingleParentFamily:
        return "Famille monoparentale (2 enfants)";
    }
  }
}

enum ProfessionalSituation { Worker, Insurance, OCMW, Unemployment }

extension ProfessionalSituationModifier on ProfessionalSituation {
  String get label {
    switch (this) {
      case ProfessionalSituation.Worker:
        return "Travailleur";
      case ProfessionalSituation.Insurance:
        return "Mutuelle";
      case ProfessionalSituation.OCMW:
        return "CPAS";
      case ProfessionalSituation.Unemployment:
        return "Chômage";
    }
  }
}
