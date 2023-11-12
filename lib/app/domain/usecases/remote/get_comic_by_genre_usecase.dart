import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetComicByGenreUsecase {
  RepositoryApi repositoryApi;
  GetComicByGenreUsecase(this.repositoryApi);
  Future<DataState<ComicListEntity>> call(
      {String? genreId, int? page, String? status}) async {
    return await repositoryApi.getComicByGenre(
        genreId: genreId, page: page, status: status);
  }
}
