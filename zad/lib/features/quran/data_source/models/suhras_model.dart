class SuhrasModel {
  final int id;
  final String revelationPlace;
  final String nameArabic;
  final int versesCount;
  final int startPage;
  final int endPage;


  SuhrasModel({
    required this.id,
    required this.revelationPlace,
    required this.nameArabic,
    required this.versesCount,
    required this.startPage,
    required this.endPage,
  });

  factory SuhrasModel.fromjson(Map<String, dynamic> json) {
    final List pages = json['pages'] ?? [1, 1];
    return SuhrasModel(
      id: json['id'] ?? 1,
      revelationPlace: json['revelation_place'] ?? '',
      nameArabic: json['name_arabic'] ?? '',
      versesCount: json['verses_count'] ?? 0,
      startPage: pages[0],
      endPage: pages[1],
    );
  }
}
