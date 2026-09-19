import 'dart:convert';

class AsmaaAllahModel {
  final int number;
  final String name;
  final String transliteration;
  final String meaning;

  AsmaaAllahModel({
    required this.number,
    required this.name,
    required this.transliteration, required this.meaning,
  });
  factory AsmaaAllahModel.fromjson(Map<String, dynamic> json) {
    return AsmaaAllahModel(
      number: json['number'] ?? 1,
      name: json['name'] ?? '',
      transliteration: json['transliteration'] ?? '', meaning: json['en']?['meaning']??'',
    );
  }
}
