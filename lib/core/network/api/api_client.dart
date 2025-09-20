import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/movies/data/models/movie_details_response.dart';
import 'package:movie_app/feature/movies/data/models/movie_result_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/movie/now_playing')
  Future<MovieResultResponse> nowShowing(
    @Query('page') int page,
    @Query('language') String language,
  );

  @GET('/movie/popular')
  Future<MovieResultResponse> popular(
    @Query('page') int page,
    @Query('language') String language,
  );

  @GET('/movie/{movieId}?append_to_response=credits')
  Future<MovieDetailsResponse> movieDetails(
    @Path() int movieId,
    @Query('language') String language,
  );

  @GET('/search/movie')
  Future<MovieResultResponse> search(
    @Query('page') int page,
    @Query('query') String query,
    @Query('language') String language,
    @Query('year') String year,
  );
}
