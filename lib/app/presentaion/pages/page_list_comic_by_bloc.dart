// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/boy_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/completed_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/girl_comic_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/new_comic.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/trending_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/app/presentaion/widgets/comic/item_comic_2.dart';
import 'package:nettruyen/app/presentaion/widgets/failed_widget.dart';
import 'package:nettruyen/app/presentaion/widgets/index_page.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';

class PageListComicByBloc<T> extends StatefulWidget {
  PageListComicByBloc({super.key, required this.title, required this.bloc});
  String title;
  T bloc;

  @override
  State<PageListComicByBloc> createState() => _PageListComicByBlocState();
}

class _PageListComicByBlocState extends State<PageListComicByBloc> {
  int totalPages = 1;
  int currentPage = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uploadData(page: 1);
  }

  ComicState? checkState() {
    switch (widget.bloc.runtimeType) {
      case TrendingComicsBloc:
        return context.watch<TrendingComicsBloc>().state;
      case CompletedComicBloc:
        return context.watch<CompletedComicBloc>().state;
      case NewComicsBloc:
        return context.watch<NewComicsBloc>().state;
      case BoyComicBloc:
        return context.watch<BoyComicBloc>().state;
      case GirlComicBloc:
        return context.watch<GirlComicBloc>().state;
    }
    return null;
  }

  void uploadData({int? page}) {
    print(widget.bloc.runtimeType);
    switch (widget.bloc.runtimeType) {
      case TrendingComicsBloc:
        context
            .read<TrendingComicsBloc>()
            .add(GetTrendingComicsEvent(page: page));
      case CompletedComicBloc:
        context
            .read<CompletedComicBloc>()
            .add(GetCompletedComicsEvent(page: page));
      case NewComicsBloc:
        context.read<NewComicsBloc>().add(GetNewComicsEvent(page: page));
      case BoyComicBloc:
        context
            .read<BoyComicBloc>()
            .add(GetBoyOrGirlComicsEvent(isBoy: true, page: page));
      case GirlComicBloc:
        context
            .read<GirlComicBloc>()
            .add(GetBoyOrGirlComicsEvent(isBoy: false, page: page));
    }
  }

  Widget bodyBuild() {
    switch (widget.bloc.runtimeType) {
      case TrendingComicsBloc:
        return BlocBuilder<TrendingComicsBloc, ComicState>(
          builder: (context, state) {
            return childbody(state);
          },
        );
      case CompletedComicBloc:
        return BlocBuilder<CompletedComicBloc, ComicState>(
          builder: (context, state) {
            return childbody(state);
          },
        );
      case NewComicsBloc:
        return BlocBuilder<NewComicsBloc, ComicState>(
          builder: (context, state) {
            return childbody(state);
          },
        );
      case BoyComicBloc:
        return BlocBuilder<BoyComicBloc, ComicState>(
          builder: (context, state) {
            return childbody(state);
          },
        );
      case GirlComicBloc:
        return BlocBuilder<GirlComicBloc, ComicState>(
          builder: (context, state) {
            return childbody(state);
          },
        );
    }
    return const LoadingWidget();
  }

  @override
  Widget build(BuildContext context) {
    ComicState? blocCommicState = checkState();
    if (blocCommicState != null) {
      if (blocCommicState is ComicSuccesfull) {
        setState(() {
          totalPages = blocCommicState.listComic!.total_pages!;
          currentPage = blocCommicState.listComic!.current_page!;
        });
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(child: bodyBuild()),
          IndexPage(
            onValue: (index) {
              uploadData(page: index);
            },
            totalPages: totalPages,
            currentPage: currentPage,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget childbody(ComicState state) {
    if (state is ComicSuccesfull) {
      List<ComicEntity> listComic = [];
      if (state.listComic != null && state.listComic?.comics != null) {
        listComic = state.listComic!.comics!;
      }
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8, crossAxisCount: 2),
        itemCount: listComic.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ItemComic2(comic: listComic[index]);
        },
      );
    } else if (state is ComicFailed) {
      return FailedWidet(error: state.error!);
    }
    return const LoadingWidget();
  }
}
