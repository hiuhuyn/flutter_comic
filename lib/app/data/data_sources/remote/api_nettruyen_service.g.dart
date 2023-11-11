part of 'api_nettruyen_service.dart';

class _ApiNettruyenService implements ApiNettruyenService {
  late final Dio dio;
  _ApiNettruyenService({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<HttpResponse<ComicListEntity>> getBoyOrGirlComics(
      {required bool isBoy, int page = 1}) async {
    //pass
    String sex = isBoy ? "boy" : "girl";
    final result = await dio.get("$kBaseURL/$sex-comics?page=$page");
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<List<ChapterEntity>>> getChapterByComicId(
      {required String comicId}) async {
    //pass
    final result = await dio.get("$kBaseURL/comics/$comicId/chapters");
    final value = List<ChapterEntity>.from(
      (result.data as List<dynamic>).map<ChapterEntity>(
        (x) => ChapterModel.fromMap(x as Map<String, dynamic>),
      ),
    );
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getComicByGenre(
      {String genreId = "all", int page = 1, String status = "all"}) async {
    //pass
    final result =
        await dio.get("$kBaseURL/genres/$genreId?page=$page&status=$status");
    final value = ComicListModel.fromMap(result.data);

    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicEntity>> getComicById(
      {required String comicId}) async {
    //pass
    final result = await dio.get("$kBaseURL/comics/$comicId");
    final value = ComicModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getComicsSearch(
      {required String query, int page = 1}) async {
    //pass
    final result = await dio.get("$kBaseURL/search?q=$query&page=$page");
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<List<ComicEntity>>> getComicsSearchSuggest(
      {required String query}) async {
    //pass
    final result = await dio.get("$kBaseURL/search-suggest?q=$query");
    List<ComicEntity> value = [];
    for (var element in result.data) {
      value.add(ComicModel.fromMap(element));
    }
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getCompletedComics(
      {int page = 1}) async {
    // pass
    final result = await dio.get("$kBaseURL/completed-comics?page=$page");
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ContentChapterEntity>> getContentOneChapter(
      {required String comicId, required int chapterId}) async {
    // pass
    final result =
        await dio.get("$kBaseURL/comics/$comicId/chapters/$chapterId");
    final value = ContentChapterModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<List<GenreEntity>>> getGenres() async {
    final result = await dio.get("$kBaseURL/genres");
    // pass
    List<GenreEntity> value = [];
    for (var element in result.data) {
      value.add(GenreModel.fromMap(element));
    }
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getNewComics(
      {int page = 1, String status = "all"}) async {
    // pass
    final result =
        await dio.get("$kBaseURL/new-comics?page=$page&status=$status");
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getRecentUpdateComics(
      {int page = 1, String status = "all"}) async {
    // pass
    final result = await dio
        .get("$kBaseURL/recent-update-comics?page=$page&status=$status");
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<List<ComicEntity>>> getRecommendComics() async {
    // pass
    final result = await dio.get("$kBaseURL/recommend-comics");
    List<ComicEntity> value = [];
    for (var element in result.data) {
      value.add(ComicModel.fromMap(element));
    }
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getTopComics(
      {int page = 1, String status = "all"}) async {
    // pass
    final result = await dio.get("$kBaseURL/top?page=$page&status=$status");
    final value = ComicListModel.fromMap(result.data);

    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getTopTypeComics(
      {required String topType, int page = 1, String status = "all"}) async {
    // pass
    final result =
        await dio.get("$kBaseURL/top/$topType?page=$page&status=$status");
    final value = ComicListModel.fromMap(result.data);

    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getTrendingComics(
      {int page = 1}) async {
    // pass
    final result = await dio.get("$kBaseURL/trending-comics?page=$page");
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }
}
