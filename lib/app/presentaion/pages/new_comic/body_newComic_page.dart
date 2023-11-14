import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/new_comic.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/app/presentaion/widgets/comic/item_comic_2.dart';
import 'package:nettruyen/app/presentaion/widgets/failed_widget.dart';
import 'package:nettruyen/app/presentaion/widgets/index_page.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';
import 'package:nettruyen/core/constants/constants.dart';

class BodyNewComicPage extends StatefulWidget {
  const BodyNewComicPage({super.key});

  @override
  State<BodyNewComicPage> createState() => _BodyNewComicPageState();
}

class _BodyNewComicPageState extends State<BodyNewComicPage> {
  StatusComic status = StatusComic.all;
  int totalPages = 1;
  int currentPage = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewComicsBloc>().add(GetNewComicsEvent());
  }

  @override
  Widget build(BuildContext context) {
    var blocCommicState = context.watch<NewComicsBloc>().state;
    if (blocCommicState is ComicSuccesfull) {
      setState(() {
        totalPages = blocCommicState.listComic!.total_pages!;
        currentPage = blocCommicState.listComic!.current_page!;
      });
    }
    return Column(
      children: [
        ListTile(
          title: const Text("Tình trạng:"),
          trailing: DropdownButton(
            value: status,
            onChanged: (value) {
              if (value is StatusComic) {
                setState(() {
                  status = value;
                });
                context
                    .read<NewComicsBloc>()
                    .add(GetNewComicsEvent(status: value.name));
              }
            },
            items: const [
              DropdownMenuItem(
                value: StatusComic.all,
                child: Text("Tất cả"),
              ),
              DropdownMenuItem(
                value: StatusComic.ongoing,
                child: Text("Đang tiến hành"),
              ),
              DropdownMenuItem(
                value: StatusComic.completed,
                child: Text("Đã hoàn thành"),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<NewComicsBloc, ComicState>(
            builder: (context, state) {
              if (state is ComicSuccesfull) {
                List<ComicEntity> listComic = [];
                if (state.listComic != null &&
                    state.listComic?.comics != null) {
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
            },
          ),
        ),
        IndexPage(
          onValue: (index) {
            context
                .read<NewComicsBloc>()
                .add(GetNewComicsEvent(status: status.name, page: index));
          },
          totalPages: totalPages,
          currentPage: currentPage,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
