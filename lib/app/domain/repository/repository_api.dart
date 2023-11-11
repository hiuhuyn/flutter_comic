import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/models/content_chapter.dart';
import 'package:nettruyen/app/domain/models/genre.dart';
import 'package:nettruyen/core/resources/data_state.dart';

abstract class RepositoryApi {
  Future<DataState<List<GenreEntity>>> getGenres();

  Future<DataState<ComicListEntity>> getComicByGenre(
      {String genreId = "all", int page = 1, String status = "all"});

  Future<DataState<ComicListEntity>> getTrendingComics({int page = 1});

  Future<DataState<ComicListEntity>> getComicsSearch(
      {required String query, int page = 1});

  Future<DataState<List<ComicEntity>>> getComicsSearchSuggest(
      {required String query});

  Future<DataState<List<ComicEntity>>> getRecommendComics();

  Future<DataState<ComicListEntity>> getNewComics(
      {int page = 1, String status = "all"});

  Future<DataState<ComicListEntity>> getRecentUpdateComics(
      {int page = 1, String status = "all"});

  Future<DataState<ComicListEntity>> getBoyOrGirlComics(
      {required bool isBoy, int page = 1});

  Future<DataState<ComicListEntity>> getCompletedComics({int page = 1});

  Future<DataState<ComicEntity>> getComicById({required String comicId});

  Future<DataState<List<ChapterEntity>>> getChapterByComicId(
      {required String comicId});

  Future<DataState<ContentChapterEntity>> getContentOneChapter(
      {required String comicId, required int chapterId});

  Future<DataState<ComicListEntity>> getTopComics(
      {int page = 1, String status = "all"});

  Future<DataState<ComicListEntity>> getTopTypeComics(
      {required String topType, int page = 1, String status = "all"});
}
