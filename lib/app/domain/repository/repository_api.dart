import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/models/content_chapter.dart';
import 'package:nettruyen/app/domain/models/genre.dart';
import 'package:nettruyen/core/resources/data_state.dart';

abstract class RepositoryApi {
  Future<DataState<List<GenreEntity>>> getGenres();

  Future<DataState<ComicListEntity>> getComicByGenre(
      {String? genreId, int? page, String? status});

  Future<DataState<ComicListEntity>> getTrendingComics({int? page});

  Future<DataState<ComicListEntity>> getComicsSearch(
      {required String query, int? page});

  Future<DataState<List<ComicEntity>>> getComicsSearchSuggest(
      {required String query});

  Future<DataState<List<ComicEntity>>> getRecommendComics();

  Future<DataState<ComicListEntity>> getNewComics({int? page, String? status});

  Future<DataState<ComicListEntity>> getRecentUpdateComics(
      {int? page, String? status});

  Future<DataState<ComicListEntity>> getBoyOrGirlComics(
      {required bool isBoy, int? page});

  Future<DataState<ComicListEntity>> getCompletedComics({int? page});

  Future<DataState<ComicEntity>> getComicById({required String comicId});

  Future<DataState<List<ChapterEntity>>> getChapterByComicId(
      {required String comicId});

  Future<DataState<ContentChapterEntity>> getContentOneChapter(
      {required String comicId, required int chapterId});

  Future<DataState<ComicListEntity>> getTopComics(
      {String? topType, int? page, String? status});
}
