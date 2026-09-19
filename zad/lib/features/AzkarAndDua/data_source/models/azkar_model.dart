class AzkarModel {
  final int repeatnumber;
  final String text;
  final String translation;
  final String category;
 

  AzkarModel({
    required this.repeatnumber,
    required this.text,
    required this.translation,
    required this.category,

  });
  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      repeatnumber: json['repeatCount'] ?? 1,
      text: json['ar']?['text'] ?? '',
      translation: json['en']?['text'] ?? '',
      category: json['shortcut']?['ar'] ?? '',
    );
  }
}
