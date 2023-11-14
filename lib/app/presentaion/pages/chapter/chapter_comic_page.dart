// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidable/hidable.dart';
import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/chapter/chapter_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/chapter/chapter_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/chapter/chapter_state.dart';
import 'package:nettruyen/app/presentaion/widgets/failed_widget.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';

class ChapterComicPage extends StatefulWidget {
  ChapterComicPage({super.key, required this.comic, required this.chapter});
  ComicEntity comic;
  ChapterEntity chapter;

  @override
  State<ChapterComicPage> createState() => _ChapterComicPageState();
}

class _ChapterComicPageState extends State<ChapterComicPage> {
  final _scrollController = ScrollController();
  ChapterEntity chapter = ChapterEntity(id: 0, name: "");
  @override
  void initState() {
    super.initState();
    chapter = widget.chapter;
    context.read<ChapterBloc>().add(GetContentChapterEvent(
        chapterId: widget.chapter.id, comic: widget.comic));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ChapterBloc, ChapterState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: Hidable(
                controller: _scrollController,
                deltaFactor: 1,
                child: AppBar(
                    title: ListTile(
                  title: Text(
                    widget.comic.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    chapter.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
              ),
              body: buildBody(state),
              bottomNavigationBar: Hidable(
                  controller: _scrollController,
                  child: Row(
                    children: [
                      IconButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            var value =
                                state.contentChapter!.chapters!.indexWhere(
                              (element) => element.id == chapter.id,
                            );
                            if (value >= 0 &&
                                value <
                                    state.contentChapter!.chapters!.length) {
                              context.read<ChapterBloc>().add(
                                  GetContentChapterEvent(
                                      chapterId: state.contentChapter!
                                          .chapters![value + 1].id,
                                      comic: widget.comic));
                              setState(() {
                                chapter =
                                    state.contentChapter!.chapters![value + 1];
                              });
                            } else {
                              print("Không có tồn tại hoặc là giá trị cuối");
                            }
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white)),
                      IconButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            var value =
                                state.contentChapter!.chapters!.indexWhere(
                              (element) => element.id == chapter.id,
                            );
                            if (value >= 0) {
                              context.read<ChapterBloc>().add(
                                  GetContentChapterEvent(
                                      chapterId: state.contentChapter!
                                          .chapters![value - 1].id,
                                      comic: widget.comic));
                              setState(() {
                                chapter =
                                    state.contentChapter!.chapters![value - 1];
                              });
                            } else {
                              print("Không có tồn tại hoặc là giá trị đầu");
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                    ],
                  )));
        },
      ),
    );
  }

  Widget buildBody(ChapterState state) {
    if (state is ChapterSuccessfull) {
      return ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) {
          return const SizedBox();
        },
        shrinkWrap: true,
        itemCount: state.contentChapter?.images?.length ?? 0,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: Image.network(
                  state.contentChapter!.images![index].src!,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      state.contentChapter!.images![index].backup_src!,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.red,
                        ));
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      );
    }
    if (state is ChapterFailed) {
      return FailedWidet(error: state.error!);
    }
    return const LoadingWidget();
  }
}
