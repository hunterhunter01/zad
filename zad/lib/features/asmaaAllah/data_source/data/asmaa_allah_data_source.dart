import 'package:dio/dio.dart';
import 'package:zad/features/asmaaAllah/data/model/asmaa_Allah_model.dart';


class AsmaaAllahDataSource {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.islamic.app/v1'));
  static Future<List<AsmaaAllahModel>> getAllNames() async {
    final response = await dio.get('/asma-al-husna');
    final List allNames = response.data['data'];
    return allNames.map((e) => AsmaaAllahModel.fromjson(e)).toList();
  }
}
