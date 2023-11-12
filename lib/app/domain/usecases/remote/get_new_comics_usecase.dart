import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetNewComicsUsecase {
  RepositoryApi repositoryApi;
  GetNewComicsUsecase(this.repositoryApi);
  Future<DataState<ComicListEntity>> call({int? page, String? status}) async {
    return await repositoryApi.getNewComics(page: page, status: status);
  }
}
