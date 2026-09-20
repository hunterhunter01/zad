class QuranModel {
  final String text;
  final int juz;
  final int hizb;
  final int chapterId;
  final String verseKey;
  final bool preBasmallah;

  QuranModel({
    required this.text,
    required this.juz,
    required this.hizb,
    required this.chapterId,
    required this.verseKey, required this.preBasmallah,
  });

  factory QuranModel.fromjson(Map<String, dynamic> json) {
    return QuranModel(
      text: json['text_uthmani'] ?? '',
      juz: json['juz'] ?? 0,
      hizb: json['hizb'] ?? 0,
      chapterId: json['chapter_id'] ?? 0,
      verseKey: json['verse_key'] ?? '',
      preBasmallah: json['bismillah_pre']?? true
    );
  }
}
