import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerHome extends StatefulWidget {
  DrawerHome({super.key, required this.onChanged});
  void Function(int indexSelect) onChanged;
  static int indexSelect = 0;

  @override
  // ignore: no_logic_in_create_state
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  int indexSelect = 0;

  @override
  Widget build(BuildContext context) {
    setState(() {
      indexSelect = DrawerHome.indexSelect;
    });
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          ListTile(
            selected: true,
            selectedTileColor: Colors.green[600],
            title: const Text(
              "Nettruyen",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
          ListTile(
            onTap: () {
              setState(() {
                indexSelect = 0;
                DrawerHome.indexSelect = indexSelect;
                widget.onChanged(indexSelect);
              });
            },
            selected: indexSelect == 0,
            selectedTileColor: Colors.amber,
            leading: Icon(Icons.home,
                color: indexSelect == 0 ? Colors.white : Colors.black),
            title: Text(
              "Trang chủ",
              style: TextStyle(
                  fontSize: 20,
                  color: indexSelect == 0 ? Colors.white : Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                indexSelect = 1;
                DrawerHome.indexSelect = indexSelect;
                widget.onChanged(indexSelect);
              });
            },
            selected: indexSelect == 1,
            selectedTileColor: Colors.amber,
            leading: Icon(Icons.menu,
                color: indexSelect == 1 ? Colors.white : Colors.black),
            title: Text(
              "Thể loại",
              style: TextStyle(
                  fontSize: 20,
                  color: indexSelect == 1 ? Colors.white : Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                indexSelect = 2;
                DrawerHome.indexSelect = indexSelect;
                widget.onChanged(indexSelect);
              });
            },
            selected: indexSelect == 2,
            selectedTileColor: Colors.amber,
            leading: Icon(Icons.fiber_new,
                color: indexSelect == 2 ? Colors.white : Colors.black),
            title: Text(
              "Truyện mới",
              style: TextStyle(
                  fontSize: 20,
                  color: indexSelect == 2 ? Colors.white : Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                indexSelect = 3;
                DrawerHome.indexSelect = indexSelect;
                widget.onChanged(indexSelect);
              });
            },
            selected: indexSelect == 3,
            selectedTileColor: Colors.amber,
            leading: Icon(Icons.ac_unit,
                color: indexSelect == 3 ? Colors.white : Colors.black),
            title: Text(
              "Xếp hạng",
              style: TextStyle(
                  fontSize: 20,
                  color: indexSelect == 3 ? Colors.white : Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                indexSelect = 4;
                DrawerHome.indexSelect = indexSelect;
                widget.onChanged(indexSelect);
              });
            },
            selected: indexSelect == 4,
            selectedTileColor: Colors.amber,
            leading: Icon(Icons.history,
                color: indexSelect == 4 ? Colors.white : Colors.black),
            title: Text(
              "Lịch sử",
              style: TextStyle(
                  fontSize: 20,
                  color: indexSelect == 4 ? Colors.white : Colors.black),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.exit_to_app, color: Colors.black),
            title: const Text(
              "Thoát",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
