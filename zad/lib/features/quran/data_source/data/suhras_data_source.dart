import 'package:dio/dio.dart';
import 'package:zad/features/quran/data_source/models/suhras_model.dart';


class SuhrasDataSource {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://api.islamic.app/v1'),
  );
  static Future<List<SuhrasModel>> getSuhras() async {
    final suhras = await dio.get('/chapters');
    final List allSuhras = suhras.data['data']['chapters'];
    return allSuhras.map((e) => SuhrasModel.fromjson(e)).toList();
  }
}
