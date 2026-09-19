class AzkarCategoryModel {
  final String number;
  final String title;
  final String translate;
  final int count;

  AzkarCategoryModel({
    required this.number,
    required this.title,
    required this.count, required this.translate,
  });
  factory AzkarCategoryModel.fromjson(Map<String, dynamic> json) {
    return AzkarCategoryModel(
      number: json['number'] ?? '',
      title: json['ar'] ?? '',
      count: json['count'] ?? 0, 
      translate: json['en']??'',
    );
  }
}
