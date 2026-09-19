class SuhrasModel {
  final int id;
  final String revelationPlace;
  final String nameArabic;
  final int versesCount;

  SuhrasModel({
    required this.id,
    required this.revelationPlace,
    required this.nameArabic,
    required this.versesCount,
  });

  factory SuhrasModel.fromjson(Map<String, dynamic> json) {
    return SuhrasModel(
      id: json['id']??1,
      revelationPlace: json['revelation_place']??'',
      nameArabic: json['name_arabic']??'',
      versesCount: json['verses_count']??0,
    );
  }
}
