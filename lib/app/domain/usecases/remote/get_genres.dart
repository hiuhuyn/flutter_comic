import 'package:nettruyen/app/domain/models/genre.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetGenres {
  RepositoryApi repositoryApi;
  GetGenres({
    required this.repositoryApi,
  });
  Future<DataState<List<GenreEntity>>> call(
      {required String comicId, required int chapterId}) async {
    return await repositoryApi.getGenres();
  }
}
