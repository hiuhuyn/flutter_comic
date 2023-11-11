import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetComicsSearch {
  RepositoryApi repositoryApi;
  GetComicsSearch({
    required this.repositoryApi,
  });
  Future<DataState<ComicListEntity>> call(
      {required String query, int? page}) async {
    return await repositoryApi.getComicsSearch(query: query, page: page);
  }
}
