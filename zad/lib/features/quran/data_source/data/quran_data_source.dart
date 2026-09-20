import 'package:dio/dio.dart';
import 'package:zad/features/quran/data_source/models/quran_model.dart';

class QuranDataSource {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.islamic.app/v1'));
  static Future<List<QuranModel>> getAyahsByPage(int pageNumber) async {
    final pageNum = await dio.get('/verses/by_page/$pageNumber');
    final List ayah = pageNum.data['data']['verses'];
    return ayah.map((e) => QuranModel.fromjson(e)).toList();
  }
}
