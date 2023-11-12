import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetTopComicsUsecase {
  RepositoryApi repositoryApi;
  GetTopComicsUsecase(this.repositoryApi);
  Future<DataState<ComicListEntity>> call(
      {int? page, String? status, String? topType}) async {
    return await repositoryApi.getTopComics(
        topType: topType, page: page, status: status);
  }
}
