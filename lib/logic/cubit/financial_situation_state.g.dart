// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_situation_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialSituationState _$FinancialSituationStateFromJson(
    Map<String, dynamic> json) {
  return FinancialSituationState(
    (json['financialSituations'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          _$enumDecode(_$FamilySituationEnumMap, k),
          (e as Map<String, dynamic>).map(
            (k, e) => MapEntry(_$enumDecode(_$ProfessionalSituationEnumMap, k),
                FinancialSituation.fromJson(e as Map<String, dynamic>)),
          )),
    ),
    json['selected'] == null
        ? null
        : FinancialSituation.fromJson(json['selected'] as Map<String, dynamic>),
    _$enumDecodeNullable(
        _$FamilySituationEnumMap, json['selectedFamilySituation']),
    _$enumDecodeNullable(
        _$ProfessionalSituationEnumMap, json['selectedProfessionalSituation']),
  );
}

Map<String, dynamic> _$FinancialSituationStateToJson(
        FinancialSituationState instance) =>
    <String, dynamic>{
      'financialSituations': instance.financialSituations.map((k, e) =>
          MapEntry(
              _$FamilySituationEnumMap[k],
              e.map((k, e) =>
                  MapEntry(_$ProfessionalSituationEnumMap[k], e.toJson())))),
      'selected': instance.selected?.toJson(),
      'selectedFamilySituation':
          _$FamilySituationEnumMap[instance.selectedFamilySituation],
      'selectedProfessionalSituation': _$ProfessionalSituationEnumMap[
          instance.selectedProfessionalSituation],
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

const _$ProfessionalSituationEnumMap = {
  ProfessionalSituation.Worker: 'Worker',
  ProfessionalSituation.Insurance: 'Insurance',
  ProfessionalSituation.OCMW: 'OCMW',
  ProfessionalSituation.Unemployment: 'Unemployment',
};

const _$FamilySituationEnumMap = {
  FamilySituation.Isolated: 'Isolated',
  FamilySituation.SingleParentFamily: 'SingleParentFamily',
  FamilySituation.Couple: 'Couple',
  FamilySituation.CoupleWithChildren: 'CoupleWithChildren',
};

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}
