import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetCompletedComics {
  RepositoryApi repositoryApi;
  GetCompletedComics({
    required this.repositoryApi,
  });
  Future<DataState<ComicListEntity>> call({int? page}) async {
    return await repositoryApi.getCompletedComics(page: page);
  }
}
