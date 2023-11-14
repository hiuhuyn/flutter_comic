import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/blocs/top_comics_bloc.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/app/presentaion/widgets/comic/item_comic_2.dart';
import 'package:nettruyen/app/presentaion/widgets/failed_widget.dart';
import 'package:nettruyen/app/presentaion/widgets/index_page.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';
import 'package:nettruyen/core/constants/constants.dart';

class BodyTopComicPage extends StatefulWidget {
  const BodyTopComicPage({super.key});

  @override
  State<BodyTopComicPage> createState() => _BodyTopComicPageState();
}

class _BodyTopComicPageState extends State<BodyTopComicPage> {
  StatusComic status = StatusComic.all;
  TopType topType = TopType.all;
  int totalPages = 1;
  int currentPage = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TopComicsBloc>().add(GetTopComicsEvent());
  }

  @override
  Widget build(BuildContext context) {
    var blocCommicState = context.watch<TopComicsBloc>().state;
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
                context.read<TopComicsBloc>().add(GetTopComicsEvent(
                    status: value.name, topType: topType.name));
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
        SizedBox(
          height: 45,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _itemTop(TopType.all, "Top all",
                  icon: Icons.remove_red_eye_outlined),
              _itemTop(TopType.daily, "Top ngày",
                  icon: Icons.remove_red_eye_outlined),
              _itemTop(TopType.weekly, "Top tuần",
                  icon: Icons.remove_red_eye_outlined),
              _itemTop(TopType.monthly, "Top tháng",
                  icon: Icons.remove_red_eye_outlined),
              _itemTop(TopType.follow, "Top theo dõi", icon: Icons.favorite),
              _itemTop(TopType.comment, "Top bình luận", icon: Icons.comment),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<TopComicsBloc, ComicState>(
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
            context.read<TopComicsBloc>().add(GetTopComicsEvent(
                topType: topType.name, status: status.name, page: index));
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

  Widget _itemTop(TopType type, String name, {IconData? icon}) {
    return InkWell(
      onTap: () {
        setState(() {
          topType = type;
          currentPage = 1;
          context.read<TopComicsBloc>().add(
              GetTopComicsEvent(topType: topType.name, status: status.name));
        });
      },
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: type == topType ? Colors.blue : Colors.grey),
            color: type == topType ? Colors.blue : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
                visible: icon != null,
                child: Icon(
                  icon,
                  color: type == topType ? Colors.white : Colors.grey,
                  size: 20,
                )),
            Text(
              name,
              style: TextStyle(
                  fontSize: 15,
                  color: type == topType ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
