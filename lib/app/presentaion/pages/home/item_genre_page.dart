import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/models/genre.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/comic_by_genre_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/genre/genre_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/genre/genre_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/genre/genre_state.dart';
import 'package:nettruyen/app/presentaion/widgets/comic/item_comic_2.dart';
import 'package:nettruyen/app/presentaion/widgets/failed_widget.dart';
import 'package:nettruyen/app/presentaion/widgets/index_page.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';
import 'package:nettruyen/core/constants/constants.dart';
import 'package:nettruyen/setup.dart';

class ItemGenrePage extends StatefulWidget {
  const ItemGenrePage({super.key});

  @override
  State<ItemGenrePage> createState() => _ItemGenrePageState();
}

class _ItemGenrePageState extends State<ItemGenrePage> {
  Status status = Status.all;
  GenreEntity genre = sl();
  int totalPages = 1;
  int currentPage = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ComicByGenreBloc>().add(GetComicByGenreEvent());
    context.read<GenreBloc>().add(GetGenresEvent());
  }

  @override
  Widget build(BuildContext context) {
    var blocCommicState = context.watch<ComicByGenreBloc>().state;
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
              if (value is Status) {
                setState(() {
                  status = value;
                });
                context
                    .read<ComicByGenreBloc>()
                    .add(GetComicByGenreEvent(status: value.name));
              }
            },
            items: const [
              DropdownMenuItem(
                value: Status.all,
                child: Text("Tất cả"),
              ),
              DropdownMenuItem(
                value: Status.ongoing,
                child: Text("Đang tiến hành"),
              ),
              DropdownMenuItem(
                value: Status.completed,
                child: Text("Đã hoàn thành"),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text("Thể loại:"),
          trailing: BlocBuilder<GenreBloc, GenreState>(
            builder: (context, state) {
              if (state is GenreSuccessfull) {
                List<DropdownMenuItem> listItemGenre = [];
                for (var element in state.listGenre!) {
                  listItemGenre.add(DropdownMenuItem(
                      value: element.name,
                      child: Text(
                        element.name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )));
                }
                return DropdownButton(
                    value: genre.name,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          genre = state.listGenre!.firstWhere(
                            (element) => element.name == value,
                            orElse: () => sl(),
                          );
                        });

                        context.read<ComicByGenreBloc>().add(
                            GetComicByGenreEvent(
                                genreId: genre.id, status: status.name));
                      }
                    },
                    items: listItemGenre);
              } else if (state is GenreFailed) {
                return SizedBox(
                  width: 30,
                  child: Text(
                    state.error!.message.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }
              return const SizedBox(
                width: 30,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<ComicByGenreBloc, ComicState>(
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
            context.read<ComicByGenreBloc>().add(GetComicByGenreEvent(
                genreId: genre.id, status: status.name, page: index));
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
