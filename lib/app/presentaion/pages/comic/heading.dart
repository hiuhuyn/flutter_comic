// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/presentaion/widgets/image_custome/image_custome.dart';
import 'package:nettruyen/config/routes/routes_name.dart';

class HeadingComic extends StatefulWidget {
  HeadingComic({super.key, required this.comic});
  ComicEntity comic;

  @override
  State<HeadingComic> createState() => _HeadingComicState();
}

class _HeadingComicState extends State<HeadingComic> {
  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    Widget? otherName;
    Widget? genres;
    if (widget.comic.other_names != null) {
      List<Widget> listOther = [];
      for (var element in widget.comic.other_names!) {
        String value = element;
        if (element != widget.comic.other_names!.last) {
          value += " - ";
        }
        listOther.add(Text(
          value,
          style: const TextStyle(fontSize: 15, color: Colors.black),
        ));
      }
      otherName = Wrap(children: listOther);
    }

    if (widget.comic.genres != null) {
      List<Widget> listOther = [];
      for (var element in widget.comic.genres!) {
        String value = element.name!;
        listOther.add(Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.green),
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            value,
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
        ));
      }
      genres = Wrap(children: listOther);
    }

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.comic.title!,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          if (otherName != null) otherName,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCustome2(
                url: widget.comic.thumbnail,
                margin: const EdgeInsets.only(right: 10),
                width: 150,
                height: 200,
                borderRadius: BorderRadius.circular(10),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (genres != null) genres,
                    Row(
                      children: [
                        const Icon(
                          Icons.remove_red_eye,
                          color: Colors.blue,
                          size: 15,
                        ),
                        Text(
                          widget.comic.total_views ?? "0",
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          widget.comic.followers ?? "0",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Tác giả:",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                widget.comic.authors ?? "Đang cập nhật",
                style: const TextStyle(fontSize: 15, color: Colors.black),
              )
            ],
          ),
          if (widget.comic.description != null)
            InkWell(
              onTap: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(
                widget.comic.description!,
                overflow: TextOverflow.ellipsis,
                maxLines: isShowMore ? 1000 : 3,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          Wrap(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.kChapterById,
                      arguments: <String, dynamic>{
                        "comic": widget.comic,
                        "chapter": widget.comic.chapters!.last
                      });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: Colors.white,
                      ),
                      Text(
                        " Đọc từ đầu",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.kChapterById,
                      arguments: <String, dynamic>{
                        "comic": widget.comic,
                        "chapter": widget.comic.chapters!.first
                      });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.green),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fiber_new,
                        color: Colors.green,
                      ),
                      Text(
                        " Đọc mới nhất",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Đọc tiếp ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
