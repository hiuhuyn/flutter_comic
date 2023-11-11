import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetChapterByComicId {
  RepositoryApi repositoryApi;
  GetChapterByComicId({
    required this.repositoryApi,
  });
  Future<DataState<List<ChapterEntity>>> call({required String comicId}) async {
    return await repositoryApi.getChapterByComicId(comicId: comicId);
  }
}
