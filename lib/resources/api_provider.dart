import 'package:dio/dio.dart';
import 'package:superhero_app/models/models.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://akabab.github.io/superhero-api/api/all.json';

  Future<List<SuperheroModel>> fetchSuperheros() async {
    try {
      Response response = await _dio.get(_url);
      return (response.data as List<dynamic>).map((i) => SuperheroModel.fromMap(i)).toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}