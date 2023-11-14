import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/genre/genre_bloc.dart';
import 'package:nettruyen/config/routes/custome_route.dart';
import 'package:nettruyen/setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initlizeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BoyComicBloc>(
          create: (context) => sl()..add(GetBoyOrGirlComicsEvent(isBoy: true)),
        ),
        BlocProvider<GirlComicBloc>(
          create: (context) => sl()..add(GetBoyOrGirlComicsEvent(isBoy: false)),
        ),
        BlocProvider<ComicByIdBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<ComicByGenreBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<CompletedComicBloc>(
          create: (context) => sl()..add(GetCompletedComicsEvent()),
        ),
        BlocProvider<NewComicsBloc>(
          create: (context) => sl()..add(GetNewComicsEvent()),
        ),
        BlocProvider<RecentUpdateComicsBloc>(
          create: (context) => sl()..add(GetRecentUpdateComicsEvent()),
        ),
        BlocProvider<RecommendComicsBloc>(
          create: (context) => sl()..add(GetRecommendComicsEvent()),
        ),
        BlocProvider<SearchComicBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<SearchSuggestComicBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<TopComicsBloc>(
          create: (context) => sl()..add(GetTopComicsEvent()),
        ),
        BlocProvider<TrendingComicsBloc>(
          create: (context) => sl()..add(GetTrendingComicsEvent()),
        ),
        BlocProvider<GenreBloc>(create: (context) => sl()),
        BlocProvider<ChapterBloc>(create: (context) => sl()),
      ],
      child: MaterialApp(
        title: 'Comic free',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => CustomeRoute.generate(settings),
        initialRoute: "/",
      ),
    );
  }
}
