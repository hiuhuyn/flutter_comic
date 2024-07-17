part of 'api_nettruyen_service.dart';

class _ApiNettruyenService implements ApiNettruyenService {
  late final Dio dio;
  _ApiNettruyenService({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<HttpResponse<ComicListEntity>> getBoyOrGirlComics(
      {required bool isBoy, int? page}) async {
    //pass
    String sex = isBoy ? "boy" : "girl";
    String api = "$kBaseURL/$sex-comics";
    api += page != null ? "?page=$page" : "?page=1";
    final result = await dio.get(api);
    final value = ComicListModel.fromMap(result.data);
    // final value = ComicListModel(comics: []);
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
      {String? genreId, int? page, String? status}) async {
    //pass
    String api = "$kBaseURL/genres/";
    api += genreId ?? "all";
    api += page != null ? "?page=$page" : "?page=1";
    if (status != null) {
      api += "&status=$status";
    }
    final result = await dio.get(api);
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
      {required String query, int? page}) async {
    //pass
    String api = "$kBaseURL/search?q=$query";
    api += page != null ? "&page=$page" : "&page=1";
    final result = await dio.get(api);
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
  Future<HttpResponse<ComicListEntity>> getCompletedComics({int? page}) async {
    // pass
    String api = "$kBaseURL/completed-comics";
    api += page != null ? "?page=$page" : "?page=1";

    final result = await dio.get(api);
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
      {int? page, String? status}) async {
    // pass
    String api = "$kBaseURL/new-comics";
    api += page != null ? "?page=$page" : "?page=1";
    if (status != null) {
      api += "&status=$status";
    }

    final result = await dio.get(api);
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getRecentUpdateComics(
      {int? page, String? status}) async {
    // pass
    String api = "$kBaseURL/recent-update-comics";
    api += page != null ? "?page=$page" : "?page=1";
    if (status != null) {
      api += "&status=$status";
    }

    final result = await dio.get(api);
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
      {String? topType, int? page, String? status}) async {
    // pass
    String api = "";
    if (topType != null && topType != TopType.all.name) {
      api = "$kBaseURL/top/$topType";
    } else {
      api = "$kBaseURL/top";
    }
    api += page != null ? "?page=$page" : "?page=1";
    if (status != null) {
      api += "&status=$status";
    }

    final result = await dio.get(api);
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }

  @override
  Future<HttpResponse<ComicListEntity>> getTrendingComics({int? page}) async {
    // pass
    String api = "$kBaseURL/trending-comics";
    api += page != null ? "?page=$page" : "?page=1";
    final result = await dio.get(api);
    final value = ComicListModel.fromMap(result.data);
    return HttpResponse(value, result);
  }
}
