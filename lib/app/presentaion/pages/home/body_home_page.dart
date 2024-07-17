import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/boy_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/completed_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/girl_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/recent_update_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/recommend_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/trending_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/app/presentaion/widgets/failed_widget.dart';
import 'package:nettruyen/app/presentaion/widgets/grid_view_comics.dart';
import 'package:nettruyen/app/presentaion/widgets/comic/item_comic_1.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';
import 'package:nettruyen/config/routes/routes_name.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({super.key});
  static void loadingData(BuildContext context) {
    context.read<RecommendComicsBloc>().add(GetRecommendComicsEvent());
    context.read<TrendingComicsBloc>().add(GetTrendingComicsEvent());
    context.read<CompletedComicBloc>().add(GetCompletedComicsEvent());
    context.read<RecentUpdateComicsBloc>().add(GetRecentUpdateComicsEvent());
    context.read<BoyComicBloc>().add(GetBoyOrGirlComicsEvent(isBoy: true));
    context.read<GirlComicBloc>().add(GetBoyOrGirlComicsEvent(isBoy: false));
  }

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          BlocBuilder<RecommendComicsBloc, ComicState>(
              builder: (context, state) {
            if (state is ComicSuccesfull && state.listComic != null) {
              return Column(
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.light_mode_outlined,
                      size: 30,
                      color: Color.fromARGB(255, 253, 133, 4),
                    ),
                    title: Text(
                      "Gợi ý",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 160,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                      itemCount: state.listComic!.comics!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ItemComic1(
                            comic: state.listComic!.comics![index]);
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is ComicFailed) {
              return FailedWidet(
                  error: state.error!,
                  onReset: () {
                    context
                        .read<RecommendComicsBloc>()
                        .add(GetRecommendComicsEvent());
                  });
            }
            return const LoadingWidget();
          }),
          BlocBuilder<TrendingComicsBloc, ComicState>(
              builder: (context, state) {
            log(state.toString());
            if (state is ComicSuccesfull) {
              int itemCount = 0;
              if (state.listComic != null && state.listComic?.comics != null) {
                if (state.listComic!.comics!.length > 20) {
                  itemCount = 20;
                } else {
                  itemCount = state.listComic!.comics!.length;
                }
              }
              return GridViewComics(
                itemCount: itemCount,
                listValue: state.listComic?.comics ?? [],
                icon: Icons.local_fire_department_outlined,
                iconColor: Colors.red,
                onPressedShowAll: () {
                  Navigator.pushNamed(context, RoutesName.kPopular);
                },
                title: "Truyện nổi bật",
              );
            }
            if (state is ComicFailed) {
              return FailedWidet(
                  error: state.error!,
                  onReset: () {
                    context
                        .read<TrendingComicsBloc>()
                        .add(GetTrendingComicsEvent());
                  });
            }
            return const LoadingWidget();
          }),
          BlocBuilder<CompletedComicBloc, ComicState>(
              builder: (context, state) {
            if (state is ComicSuccesfull) {
              int itemCount = 0;
              if (state.listComic != null && state.listComic?.comics != null) {
                if (state.listComic!.comics!.length > 20) {
                  itemCount = 20;
                } else {
                  itemCount = state.listComic!.comics!.length;
                }
              }
              return GridViewComics(
                itemCount: itemCount,
                listValue: state.listComic?.comics ?? [],
                icon: Icons.verified,
                onPressedShowAll: () {
                  Navigator.pushNamed(context, RoutesName.kCompleted);
                },
                title: "Truyện đã hoàn thành",
              );
            }
            if (state is ComicFailed) {
              return FailedWidet(
                  error: state.error!,
                  onReset: () {
                    context
                        .read<CompletedComicBloc>()
                        .add(GetCompletedComicsEvent());
                  });
            }
            return const LoadingWidget();
          }),
          BlocBuilder<RecentUpdateComicsBloc, ComicState>(
              builder: (context, state) {
            if (state is ComicSuccesfull) {
              int itemCount = 0;
              if (state.listComic != null && state.listComic?.comics != null) {
                if (state.listComic!.comics!.length > 20) {
                  itemCount = 20;
                } else {
                  itemCount = state.listComic!.comics!.length;
                }
              }
              return GridViewComics(
                itemCount: itemCount,
                listValue: state.listComic?.comics ?? [],
                icon: Icons.access_time,
                iconColor: const Color.fromARGB(255, 255, 200, 0),
                onPressedShowAll: () {
                  Navigator.pushNamed(context, RoutesName.kRecentUpdate);
                },
                title: "Truyện mới cập nhật",
              );
            }
            if (state is ComicFailed) {
              return FailedWidet(
                  error: state.error!,
                  onReset: () {
                    context
                        .read<RecentUpdateComicsBloc>()
                        .add(GetRecentUpdateComicsEvent());
                  });
            }
            return const LoadingWidget();
          }),
          // BlocBuilder<BoyComicBloc, ComicState>(builder: (context, state) {
          //   if (state is ComicSuccesfull) {
          //     int itemCount = 0;
          //     if (state.listComic != null && state.listComic?.comics != null) {
          //       if (state.listComic!.comics!.length > 20) {
          //         itemCount = 20;
          //       } else {
          //         itemCount = state.listComic!.comics!.length;
          //       }
          //     }
          //     return GridViewComics(
          //       itemCount: itemCount,
          //       listValue: state.listComic?.comics ?? [],
          //       icon: Icons.male,
          //       iconColor: Colors.blue,
          //       onPressedShowAll: () {
          //         Navigator.pushNamed(context, RoutesName.kBoy);
          //       },
          //       title: "Boy",
          //     );
          //   }
          //   if (state is ComicFailed) {
          //     return FailedWidet(
          //         error: state.error!,
          //         onReset: () {
          //           context
          //               .read<BoyComicBloc>()
          //               .add(GetBoyOrGirlComicsEvent(isBoy: true));
          //         });
          //   }
          //   return const LoadingWidget();
          // }),
          // BlocBuilder<GirlComicBloc, ComicState>(builder: (context, state) {
          //   if (state is ComicSuccesfull) {
          //     int itemCount = 0;
          //     if (state.listComic != null && state.listComic?.comics != null) {
          //       if (state.listComic!.comics!.length > 20) {
          //         itemCount = 20;
          //       } else {
          //         itemCount = state.listComic!.comics!.length;
          //       }
          //     }
          //     return GridViewComics(
          //       itemCount: itemCount,
          //       listValue: state.listComic?.comics ?? [],
          //       icon: Icons.female,
          //       iconColor: Colors.pink,
          //       onPressedShowAll: () {
          //         Navigator.pushNamed(context, RoutesName.kGirl);
          //       },
          //       title: "Girl",
          //     );
          //   }
          //   if (state is ComicFailed) {
          //     return FailedWidet(
          //         error: state.error!,
          //         onReset: () {
          //           context
          //               .read<GirlComicBloc>()
          //               .add(GetBoyOrGirlComicsEvent(isBoy: false));
          //         });
          //   }
          //   return const LoadingWidget();
          // }),
        ],
      ),
    );
  }
}
