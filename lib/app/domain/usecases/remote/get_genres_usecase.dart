import 'package:nettruyen/app/domain/models/genre.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetGenresUsecase {
  RepositoryApi repositoryApi;
  GetGenresUsecase(this.repositoryApi);
  Future<DataState<List<GenreEntity>>> call() async {
    return await repositoryApi.getGenres();
  }
}
