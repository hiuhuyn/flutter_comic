import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetRecentUpdateComics {
  RepositoryApi repositoryApi;
  GetRecentUpdateComics({
    required this.repositoryApi,
  });
  Future<DataState<ComicListEntity>> call({int? page, String? status}) async {
    return await repositoryApi.getRecentUpdateComics(
        page: page, status: status);
  }
}
