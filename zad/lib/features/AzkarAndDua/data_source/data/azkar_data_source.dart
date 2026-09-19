

import 'package:dio/dio.dart';
import 'package:zad/features/AzkarAndDua/data_source/models/azkar_model.dart';




class AzkarDataSource {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://api.islamic.app/v1'),
  );
  static Future<List<AzkarModel>> getAzkarByCategory(String category) async {
    final response = await dio.get('/dhikr/$category');
    final List zikrlist = response.data['data']['duas'] ?? [];
    return zikrlist.map((e) => AzkarModel.fromJson(e)).toList();
  }
}
