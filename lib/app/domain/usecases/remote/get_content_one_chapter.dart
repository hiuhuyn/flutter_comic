import 'package:nettruyen/app/domain/models/content_chapter.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetContentOneChapter {
  RepositoryApi repositoryApi;
  GetContentOneChapter({
    required this.repositoryApi,
  });
  Future<DataState<ContentChapterEntity>> call(
      {required String comicId, required int chapterId}) async {
    return await repositoryApi.getContentOneChapter(
        comicId: comicId, chapterId: chapterId);
  }
}
