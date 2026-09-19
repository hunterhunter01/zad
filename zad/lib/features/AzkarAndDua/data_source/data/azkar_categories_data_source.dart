import 'package:dio/dio.dart';
import 'package:zad/features/AzkarAndDua/data_source/models/azkar_categories_model.dart';


class AzkarCategoriesDataSource {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.islamic.app/v1'));
  static Future<List<AzkarCategoryModel>> getAllCategories() async {
    final response = await dio.get('/dhikr');
    final List categories = response.data['data']['categories'];
    return categories.map((e) => AzkarCategoryModel.fromjson(e)).toList();
  }
}
