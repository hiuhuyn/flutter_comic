import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/boy_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/completed_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/girl_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/new_comic.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/recommend_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/trending_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/app/presentaion/widgets/failed_widget.dart';
import 'package:nettruyen/app/presentaion/widgets/grid_view_comics.dart';
import 'package:nettruyen/app/presentaion/widgets/comic/item_comic_1.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';

class ItemHomePage extends StatefulWidget {
  const ItemHomePage({super.key});

  @override
  State<ItemHomePage> createState() => _ItemHomePageState();
}

class _ItemHomePageState extends State<ItemHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void loadingData() {
    context.read<RecommendComicsBloc>().add(GetRecommendComicsEvent());
    context.read<TrendingComicsBloc>().add(GetTrendingComicsEvent());
    context.read<CompletedComicBloc>().add(GetCompletedComicsEvent());
    context.read<NewComicsBloc>().add(GetNewComicsEvent());
    context.read<BoyComicBloc>().add(GetBoyOrGirlComicsEvent(isBoy: true));
    context.read<GirlComicBloc>().add(GetBoyOrGirlComicsEvent(isBoy: false));
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollNotification) {
        // Xử lý sự kiện vuốt xuống ở đây nếu cần
        if (scrollNotification is OverscrollNotification &&
            scrollNotification.overscroll < -50) {
          // Thực hiện hành động khi có sự kiện vuốt xuống
          loadingData();
        }
        return true;
      },
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(
                Icons.light_mode_outlined,
                size: 30,
                color: Color.fromARGB(255, 253, 133, 4),
              ),
              title: Text(
                "Gợi ý",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            BlocBuilder<RecommendComicsBloc, ComicState>(
                builder: (context, state) {
              if (state is ComicSuccesfull) {
                return Container(
                  height: 150,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ListView.builder(
                    itemCount: state.listComic?.comics?.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemComic1(comic: state.listComic!.comics![index]);
                    },
                  ),
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
              if (state is ComicSuccesfull) {
                int itemCount = 0;
                if (state.listComic != null &&
                    state.listComic?.comics != null) {
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
                  onPressedShowAll: () {},
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
                if (state.listComic != null &&
                    state.listComic?.comics != null) {
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
                  onPressedShowAll: () {},
                  title: "Truyện đã hoàn thành",
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
            BlocBuilder<NewComicsBloc, ComicState>(builder: (context, state) {
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
                iconColor: Colors.black,
                onPressedShowAll: () {},
                title: "Truyện mới cập nhật",
              );
            }),
            BlocBuilder<BoyComicBloc, ComicState>(builder: (context, state) {
              if (state is ComicSuccesfull) {
                int itemCount = 0;
                if (state.listComic != null &&
                    state.listComic?.comics != null) {
                  if (state.listComic!.comics!.length > 20) {
                    itemCount = 20;
                  } else {
                    itemCount = state.listComic!.comics!.length;
                  }
                }
                return GridViewComics(
                  itemCount: itemCount,
                  listValue: state.listComic?.comics ?? [],
                  icon: Icons.male,
                  iconColor: Colors.blue,
                  onPressedShowAll: () {},
                  title: "Boy",
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
            BlocBuilder<GirlComicBloc, ComicState>(builder: (context, state) {
              if (state is ComicSuccesfull) {
                int itemCount = 0;
                if (state.listComic != null &&
                    state.listComic?.comics != null) {
                  if (state.listComic!.comics!.length > 20) {
                    itemCount = 20;
                  } else {
                    itemCount = state.listComic!.comics!.length;
                  }
                }
                return GridViewComics(
                  itemCount: itemCount,
                  listValue: state.listComic?.comics ?? [],
                  icon: Icons.female,
                  iconColor: Colors.pink,
                  onPressedShowAll: () {},
                  title: "Girl",
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
          ],
        ),
      ),
    );
  }
}
