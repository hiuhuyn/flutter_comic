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
import 'package:retrofit/retrofit.dart';

part 'api_nettruyen_service.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class ApiNettruyenService {
  factory ApiNettruyenService({Dio? dio}) = _ApiNettruyenService;

  static const String typeDaily = "daily";
  static const String typeMonthly = "monthly";
  static const String typeChapter = "chapter";
  static const String typeFollow = "follow";
  static const String typeWeekly = "weekly";
  static const String typeComment = "comment";

  static const String statusAll = "all"; // tất cả
  static const String statusCompleted = "completed"; // đã hoàn thành
  static const String statusOngoing = "ongoing"; // đang diễn ra

  @GET("/genres")
  Future<HttpResponse<List<GenreEntity>>> getGenres();

  @GET("/genres/{genre_id}?page={page}&status={status}")
  Future<HttpResponse<ComicListEntity>> getComicByGenre(
      {String genreId = "all", int page = 1, String status = "all"});

  @GET("/trending-comics")
  Future<HttpResponse<ComicListEntity>> getTrendingComics({int page = 1});

  @GET("/search?q={query}&page={page}")
  Future<HttpResponse<ComicListEntity>> getComicsSearch(
      {required String query, int page = 1});

  @GET("/search-suggest?q={query}")
  Future<HttpResponse<List<ComicEntity>>> getComicsSearchSuggest(
      {required String query});

  @GET("/recommend-comics")
  Future<HttpResponse<List<ComicEntity>>> getRecommendComics();

  @GET("/new-comics?page={page}&status={status}")
  Future<HttpResponse<ComicListEntity>> getNewComics(
      {int page = 1, String status = "all"});

  @GET("/recent-update-comics?page={page}&status={status}")
  Future<HttpResponse<ComicListEntity>> getRecentUpdateComics(
      {int page = 1, String status = "all"});

  @GET("/boy-comics?page={page}")
  @GET("/girl-comics?page={page}")
  Future<HttpResponse<ComicListEntity>> getBoyOrGirlComics(
      {required bool isBoy, int page = 1});

  @GET("/completed-comics?page={page}")
  Future<HttpResponse<ComicListEntity>> getCompletedComics({int page = 1});

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
      {int page = 1, String status = "all"});

  @GET("/top/{type}?page={page}&status={status}")
  Future<HttpResponse<ComicListEntity>> getTopTypeComics(
      {required String topType, int page = 1, String status = "all"});
}
