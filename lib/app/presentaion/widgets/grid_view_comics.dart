import 'package:flutter/material.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/presentaion/widgets/comic/item_comic_2.dart';

// ignore: must_be_immutable
class GridViewComics extends StatelessWidget {
  GridViewComics(
      {super.key,
      required this.listValue,
      this.itemCount = 0,
      required this.title,
      required this.icon,
      required this.onPressedShowAll,
      this.iconColor});
  List<ComicEntity> listValue;
  String title;
  IconData icon;
  Function onPressedShowAll;
  Color? iconColor;
  int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 30,
            color: iconColor ?? Colors.green,
          ),
          trailing: TextButton(
            onPressed: () => onPressedShowAll(),
            child: const Text(
              "More",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: listValue.isNotEmpty ? 400 : 10,
          margin: const EdgeInsets.only(bottom: 20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.4, crossAxisCount: 2),
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (listValue.length >= itemCount) {
                return ItemComic2(comic: listValue[index]);
              } else {
                return Container(
                  color: Colors.amber,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
