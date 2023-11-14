// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/comic_id_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/app/presentaion/pages/comic/body.dart';
import 'package:nettruyen/app/presentaion/pages/comic/heading.dart';
import 'package:nettruyen/app/presentaion/widgets/failed_widget.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';

class ComicPage extends StatefulWidget {
  ComicPage({super.key, required this.comicId});
  String comicId;

  @override
  State<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<ComicByIdBloc>()
        .add(GetComicByIdEvent(comicId: widget.comicId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComicByIdBloc, ComicState>(
      builder: (context, state) {
        if (state is ComicSuccesfull && state.comic != null) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(state.comic!.title!),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.download))
              ],
            ),
            body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  HeadingComic(comic: state.comic!),
                  BodyComicPage(comic: state.comic!)
                ],
              ),
            ),
          );
        }
        if (state is ComicFailed) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Lỗi"),
            ),
            body: FailedWidet(
              error: state.error!,
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const LinearProgressIndicator(color: Colors.blue),
          ),
          body: const LoadingWidget(),
        );
      },
    );
  }
}
