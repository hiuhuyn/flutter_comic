// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/presentaion/widgets/image_custome.dart';
import 'package:nettruyen/config/routes/routes_name.dart';
import 'package:nettruyen/core/unit/unit.dart';

class ItemComic2 extends StatefulWidget {
  ItemComic2({super.key, required this.comic});
  ComicEntity comic;

  @override
  State<ItemComic2> createState() => _ItemComic2State();
}

class _ItemComic2State extends State<ItemComic2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.kComicById,
            arguments: widget.comic.id);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 100,
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ImageCustome(
              url: widget.comic.thumbnail,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: Visibility(
                visible: widget.comic.is_trending ?? false,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  height: 20,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 77, 65),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "Hot",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              color: const Color.fromARGB(182, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.comic.title.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 10,
                          ),
                          Text(
                            formatNumber(widget.comic.total_views ?? 0)
                                .toString(),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 10,
                          ),
                          Text(
                            formatNumber(widget.comic.followers ?? 0)
                                .toString(),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
