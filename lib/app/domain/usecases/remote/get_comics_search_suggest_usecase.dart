import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetComicsSearchSuggestUsecase {
  RepositoryApi repositoryApi;
  GetComicsSearchSuggestUsecase(this.repositoryApi);
  Future<DataState<List<ComicEntity>>> call({required String query}) async {
    return await repositoryApi.getComicsSearchSuggest(query: query);
  }
}
