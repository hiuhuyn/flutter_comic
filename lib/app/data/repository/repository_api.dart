import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nettruyen/app/data/data_sources/remote/api_nettruyen_service.dart';
import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/models/content_chapter.dart';
import 'package:nettruyen/app/domain/models/genre.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';
import 'package:retrofit/dio.dart';

class RepositoryApiImpl implements RepositoryApi {
  late ApiNettruyenService service;
  RepositoryApiImpl({ApiNettruyenService? service}) {
    this.service = service ?? ApiNettruyenService();
  }

  @override
  Future<DataState<ComicListEntity>> getBoyOrGirlComics(
      {required bool isBoy, int? page}) async {
    try {
      final httpReponse =
          await service.getBoyOrGirlComics(isBoy: isBoy, page: page);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getBoyOrGirlComics Status code: ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getBoyOrGirlComics: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<List<ChapterEntity>>> getChapterByComicId(
      {required String comicId}) async {
    try {
      final httpReponse = await service.getChapterByComicId(comicId: comicId);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getChapterByComicId StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getChapterByComicId: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ComicListEntity>> getComicByGenre(
      {String? genreId, int? page, String? status}) async {
    try {
      final httpReponse = await service.getComicByGenre(
          genreId: genreId, page: page, status: status);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getComicByGenre StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getComicByGenre: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ComicEntity>> getComicById({required String comicId}) async {
    try {
      final httpReponse = await service.getComicById(comicId: comicId);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getComicById StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getComicById: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ComicListEntity>> getComicsSearch(
      {required String query, int? page}) async {
    try {
      final httpReponse =
          await service.getComicsSearch(query: query, page: page);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getComicsSearch StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getComicsSearch: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<List<ComicEntity>>> getComicsSearchSuggest(
      {required String query}) async {
    try {
      final httpReponse = await service.getComicsSearchSuggest(query: query);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getComicsSearchSuggest StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getComicsSearchSuggest: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ComicListEntity>> getCompletedComics({int? page}) async {
    try {
      final httpReponse = await service.getCompletedComics(page: page);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getCompletedComics StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getCompletedComics: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ContentChapterEntity>> getContentOneChapter(
      {required String comicId, required int chapterId}) async {
    try {
      final httpReponse = await service.getContentOneChapter(
          comicId: comicId, chapterId: chapterId);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getContentOneChapter StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getContentOneChapter: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<List<GenreEntity>>> getGenres() async {
    try {
      final httpReponse = await service.getGenres();
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getGenres StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getGenres: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ComicListEntity>> getNewComics(
      {int? page, String? status}) async {
    try {
      final httpReponse =
          await service.getNewComics(page: page, status: status);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getNewComics StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getNewComics: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ComicListEntity>> getRecentUpdateComics(
      {int? page, String? status}) async {
    try {
      final httpReponse =
          await service.getRecentUpdateComics(page: page, status: status);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getRecentUpdateComics StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getRecentUpdateComics: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<List<ComicEntity>>> getRecommendComics() async {
    try {
      final httpReponse = await service.getRecommendComics();
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getRecommendComics StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getRecommendComics: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ComicListEntity>> getTopComics(
      {String? topType, int? page, String? status}) async {
    try {
      final HttpResponse<ComicListEntity> httpReponse = await service
          .getTopComics(topType: topType, page: page, status: status);

      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getTopTypeComics StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getTopTypeComics: ${e.toString()}"));
    }
  }

  @override
  Future<DataState<ComicListEntity>> getTrendingComics({int? page}) async {
    try {
      final httpReponse = await service.getTrendingComics(page: page);
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpReponse.data);
      } else {
        return DataFailed(DioException(
            message:
                "Faild getTrendingComics StatusCode = ${httpReponse.response.statusCode}",
            error: httpReponse.response.statusCode,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(
          requestOptions: RequestOptions(),
          message: "Exception getTrendingComics: ${e.toString()}"));
    }
  }
}
