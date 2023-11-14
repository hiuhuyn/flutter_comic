// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/config/routes/routes_name.dart';

class BodyComicPage extends StatefulWidget {
  BodyComicPage({super.key, required this.comic});
  ComicEntity comic;

  @override
  State<BodyComicPage> createState() => _BodyComicPageState();
}

class _BodyComicPageState extends State<BodyComicPage> {
  int range = 0;
  int itemCount = 0;
  List<Widget> listRanges = [];
  @override
  void initState() {
    super.initState();
    if (widget.comic.chapters != null) {
      int lengthChapters = widget.comic.chapters!.length;
      print(lengthChapters);
      if (lengthChapters < 50) {
        listRanges.add(_itemChapter(0, lengthChapters));
        setState(() {
          itemCount = lengthChapters;
        });
      } else {
        for (int i = 1; i <= lengthChapters; i += 50) {
          int end = i + 49;
          end = (end < lengthChapters + 1) ? end : lengthChapters + 1;
          listRanges.add(_itemChapter(i, end));
        }
        setState(() {
          itemCount = 50;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(children: listRanges),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              height: 1,
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
            ),
            itemBuilder: (context, index) {
              int indexChapter = index + range;

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.kChapterById,
                      arguments: <String, dynamic>{
                        "comic": widget.comic,
                        "chapter": widget.comic.chapters![indexChapter]
                      });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey),
                    color: indexChapter == 0 ? Colors.blue : Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.comic.chapters![indexChapter].name,
                    style: TextStyle(
                        color: indexChapter == 0 ? Colors.white : Colors.black,
                        fontSize: 15),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget _itemChapter(int start, int end) {
    return InkWell(
      onTap: () {
        setState(() {
          if (end > widget.comic.chapters!.length) {
            itemCount = end - start - 2;
            range = end - 1;
            range = widget.comic.chapters!.length - range;
          } else {
            itemCount = end - start - 1;
            range = widget.comic.chapters!.length - end;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.grey),
          color: Colors.white,
        ),
        child: Text(
          "$start - $end",
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
