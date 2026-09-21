class QuranModel {
  final String text;
  final int juz;
  final int hizb;
  final int chapterId;
  final String verseKey;


  QuranModel({
    required this.text,
    required this.juz,
    required this.hizb,
    required this.chapterId,
    required this.verseKey,
  });

  factory QuranModel.fromjson(Map<String, dynamic> json) {
    return QuranModel(
      text: json['text_uthmani'] ?? '',
      juz: json['juz'] ?? 0,
      hizb: json['hizb'] ?? 0,
      chapterId: json['chapter_id'] ?? 0,
      verseKey: json['verse_key'] ?? '',
      
    );
  }
}
