// ignore_for_file: always_use_package_imports

import 'package:dio/dio.dart';
import 'package:movies_app/common/data/models/movies_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('')
  Future<MoviesResponse> getMovies();
}
