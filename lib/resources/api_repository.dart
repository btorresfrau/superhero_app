import 'package:superhero_app/models/models.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<SuperheroModel>> fetchSuperheros() {
    return _provider.fetchSuperheros();
  }
}

class NetworkError extends Error {}