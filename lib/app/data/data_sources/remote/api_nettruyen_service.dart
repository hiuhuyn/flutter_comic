import 'package:dio/dio.dart';
import 'package:nettruyen/app/data/models/chapter.dart';
import 'package:nettruyen/app/data/models/comic.dart';
import 'package:nettruyen/app/data/models/comic_list.dart';
import 'package:nettruyen/app/data/models/content_chapter.dart';
import 'package:nettruyen/app/data/models/genre.dart';
import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/models/content_chapter.dart';
import 'package:nettruyen/app/domain/models/genre.dart';
import 'package:nettruyen/core/constants/api.dart';
import 'package:nettruyen/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_nettruyen_service.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class ApiNettruyenService {
  factory ApiNettruyenService({Dio? dio}) = _ApiNettruyenService;

  @GET("/genres")
  Future<HttpResponse<List<GenreEntity>>> getGenres();

  @GET("/genres/{genre_id}?page={page}&status={status}")
  Future<HttpResponse<ComicListEntity>> getComicByGenre(
      {String? genreId, int? page, String? status});

  @GET("/trending-comics")
  Future<HttpResponse<ComicListEntity>> getTrendingComics({int? page});

  @GET("/search?q={query}&page={page}")
  Future<HttpResponse<ComicListEntity>> getComicsSearch(
      {required String query, int? page});

  @GET("/search-suggest?q={query}")
  Future<HttpResponse<List<ComicEntity>>> getComicsSearchSuggest(
      {required String query});

  @GET("/recommend-comics")
  Future<HttpResponse<List<ComicEntity>>> getRecommendComics();

  @GET("/new-comics?page={page}&status={status}")
  Future<HttpResponse<ComicListEntity>> getNewComics(
      {int? page, String? status});

  @GET("/recent-update-comics?page={page}&status={status}")
  Future<HttpResponse<ComicListEntity>> getRecentUpdateComics(
      {int? page, String? status});

  @GET("/boy-comics?page={page}")
  @GET("/girl-comics?page={page}")
  Future<HttpResponse<ComicListEntity>> getBoyOrGirlComics(
      {required bool isBoy, int? page});

  @GET("/completed-comics?page={page}")
  Future<HttpResponse<ComicListEntity>> getCompletedComics({int? page});

  @GET("/comics/{comic_id}")
  Future<HttpResponse<ComicEntity>> getComicById({required String comicId});

  @GET("/comics/{comic_id}/chapters")
  Future<HttpResponse<List<ChapterEntity>>> getChapterByComicId(
      {required String comicId});

  @GET("/comics/{comic_id}/chapters/{chapter_id}")
  Future<HttpResponse<ContentChapterEntity>> getContentOneChapter(
      {required String comicId, required int chapterId});

  @GET("/top?page={page}&status={status}")
  Future<HttpResponse<ComicListEntity>> getTopComics(
      {String? topType, int? page, String? status});
}
