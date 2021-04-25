// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) {
  return Option(
    id: json['id'] as int,
    label: json['label'] as String,
    optionGroup:
        OptionGroup.fromJson(json['optionGroup'] as Map<String, dynamic>),
    optionGroupIcons: (json['optionGroupIcons'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$OptionGroupIconsEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'optionGroup': instance.optionGroup.toJson(),
      'optionGroupIcons': instance.optionGroupIcons
          ?.map((e) => _$OptionGroupIconsEnumMap[e])
          .toList(),
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

const _$OptionGroupIconsEnumMap = {
  OptionGroupIcons.Tv: 'Tv',
  OptionGroupIcons.Smartphone: 'Smartphone',
  OptionGroupIcons.Laptop: 'Laptop',
  OptionGroupIcons.Vehicle: 'Vehicle',
};
