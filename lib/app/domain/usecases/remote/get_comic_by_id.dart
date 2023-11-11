import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetComicById {
  RepositoryApi repositoryApi;
  GetComicById({
    required this.repositoryApi,
  });

  Future<DataState<ComicEntity>> call({required String comicId}) async {
    return await repositoryApi.getComicById(comicId: comicId);
  }
}
