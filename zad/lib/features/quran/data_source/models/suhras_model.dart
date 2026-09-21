class SuhrasModel {
  final int id;
  final String revelationPlace;
  final String nameArabic;
  final int versesCount;
  final int startPage;
  final int endPage;
  final bool preBasmallah;

  String get placeArabic => revelationPlace.toLowerCase() == 'makkah' ? 'مكية' : 'مدنية';
      
  String get ayahLabel => versesCount <= 10 ? 'آيات' : 'آية';

  int get resolvedEndPage {
  if (startPage == endPage) {
     const surahNumbers = { 80, 84, 88, 90, 94, 96};

    if (surahNumbers.contains(id)) {
      return startPage + 1;
    }
  }
  return endPage;
}



  SuhrasModel({
    required this.id,
    required this.revelationPlace,
    required this.nameArabic,
    required this.versesCount,
    required this.startPage,
    required this.endPage, required this.preBasmallah,
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
      preBasmallah: json['bismillah_pre']?? true
    );
  }

}
