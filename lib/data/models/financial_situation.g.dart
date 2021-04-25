// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_situation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialSituation _$FinancialSituationFromJson(Map<String, dynamic> json) {
  return FinancialSituation(
    id: json['id'] as int,
    label: json['label'] as String,
    initialBudget: (json['initialBudget'] as num).toDouble(),
    familySituation:
        _$enumDecode(_$FamilySituationEnumMap, json['familySituation']),
    professionalSituation: _$enumDecode(
        _$ProfessionalSituationEnumMap, json['professionalSituation']),
  );
}

Map<String, dynamic> _$FinancialSituationToJson(FinancialSituation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'initialBudget': instance.initialBudget,
      'familySituation': _$FamilySituationEnumMap[instance.familySituation],
      'professionalSituation':
          _$ProfessionalSituationEnumMap[instance.professionalSituation],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$FamilySituationEnumMap = {
  FamilySituation.Isolated: 'Isolated',
  FamilySituation.SingleParentFamily: 'SingleParentFamily',
  FamilySituation.Couple: 'Couple',
  FamilySituation.CoupleWithChildren: 'CoupleWithChildren',
};

const _$ProfessionalSituationEnumMap = {
  ProfessionalSituation.Worker: 'Worker',
  ProfessionalSituation.Insurance: 'Insurance',
  ProfessionalSituation.OCMW: 'OCMW',
  ProfessionalSituation.Unemployment: 'Unemployment',
};
