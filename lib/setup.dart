import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nettruyen/app/data/data_sources/remote/api_nettruyen_service.dart';
import 'package:nettruyen/app/data/repository/repository_api.dart';
import 'package:nettruyen/app/domain/models/genre.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_boy_or_girl_comics_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_chapter_by_comic_id_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_comic_by_genre_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_comic_by_id_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_comics_search_suggest_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_comics_search_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_completed_comics_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_content_one_chapter_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_genres_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_new_comics_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_recent_update_comics_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_recommend_comics_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_top_comics_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_trending_comics_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/chapter/chapter_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/boy_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/comic_id_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/comic_by_genre_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/completed_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/girl_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/new_comic.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/recent_update_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/recommend_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/search_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/search_suggest_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/top_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/trending_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/genre/genre_bloc.dart';

final sl = GetIt.instance;

Future<void> initlizeDependencies() async {
  sl.registerLazySingleton<GenreEntity>(() => GenreEntity(
      id: "all", name: "Tất cả", description: "Tất cả thể loại truyện tranh"));

  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiNettruyenService>(
      () => ApiNettruyenService(dio: sl()));
  sl.registerLazySingleton<RepositoryApi>(
      () => RepositoryApiImpl(service: sl()));

  // use case
  sl.registerLazySingleton<GetBoyOrGirlComicsUsecase>(
      () => GetBoyOrGirlComicsUsecase(sl()));

  sl.registerLazySingleton<GetChapterByComicIdUsecase>(
      () => GetChapterByComicIdUsecase(sl()));

  sl.registerLazySingleton<GetComicByGenreUsecase>(
      () => GetComicByGenreUsecase(sl()));

  sl.registerLazySingleton<GetComicByIdUsecase>(
      () => GetComicByIdUsecase(sl()));

  sl.registerLazySingleton<GetComicsSearchUsecase>(
      () => GetComicsSearchUsecase(sl()));

  sl.registerLazySingleton<GetComicsSearchSuggestUsecase>(
      () => GetComicsSearchSuggestUsecase(sl()));

  sl.registerLazySingleton<GetCompletedComicsUsecase>(
      () => GetCompletedComicsUsecase(sl()));

  sl.registerLazySingleton<GetContentOneChapterUsecase>(
      () => GetContentOneChapterUsecase(sl()));

  sl.registerLazySingleton<GetGenresUsecase>(() => GetGenresUsecase(sl()));

  sl.registerLazySingleton<GetNewComicsUsecase>(
      () => GetNewComicsUsecase(sl()));

  sl.registerLazySingleton<GetRecentUpdateComicsUsecase>(
      () => GetRecentUpdateComicsUsecase(sl()));

  sl.registerLazySingleton<GetRecommendComicsUsecase>(
      () => GetRecommendComicsUsecase(sl()));

  sl.registerLazySingleton<GetTopComicsUsecase>(
      () => GetTopComicsUsecase(sl()));

  sl.registerLazySingleton<GetTrendingComicsUsecase>(
      () => GetTrendingComicsUsecase(sl()));

  // blocs
  // chapter
  sl.registerFactory<ChapterBloc>(() => ChapterBloc(sl(), sl()));
  // genre
  sl.registerFactory<GenreBloc>(() => GenreBloc(sl()));

  // comics
  sl.registerFactory<BoyComicBloc>(() => BoyComicBloc(sl()));

  sl.registerFactory<GirlComicBloc>(() => GirlComicBloc(sl()));

  sl.registerFactory<ComicByIdBloc>(() => ComicByIdBloc(sl()));

  sl.registerFactory<ComicByGenreBloc>(() => ComicByGenreBloc(sl()));

  sl.registerFactory<CompletedComicBloc>(() => CompletedComicBloc(sl()));

  sl.registerFactory<NewComicsBloc>(() => NewComicsBloc(sl()));

  sl.registerFactory<RecentUpdateComicsBloc>(
      () => RecentUpdateComicsBloc(sl()));

  sl.registerFactory<RecommendComicsBloc>(() => RecommendComicsBloc(sl()));

  sl.registerFactory<SearchComicBloc>(() => SearchComicBloc(sl()));

  sl.registerFactory<SearchSuggestComicBloc>(
      () => SearchSuggestComicBloc(sl()));

  sl.registerFactory<TopComicsBloc>(() => TopComicsBloc(sl()));

  sl.registerFactory<TrendingComicsBloc>(() => TrendingComicsBloc(sl()));
}
