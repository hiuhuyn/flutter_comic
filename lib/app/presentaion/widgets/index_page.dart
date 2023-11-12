// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  IndexPage(
      {super.key,
      required this.totalPages,
      required this.onValue,
      this.currentPage = 1});
  int totalPages;
  int currentPage;
  Function(int index) onValue;

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int currentPage = 1;
  int totalPages = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (totalPages != widget.totalPages) {
        currentPage = 1;
        totalPages = widget.totalPages;
      }
    });
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Visibility(
            visible: currentPage > 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  currentPage--;
                  widget.onValue(currentPage);
                });
              },
              child: Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.all(1),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_back_ios,
                  )),
            ),
          ),
          Visibility(
            visible: currentPage < widget.totalPages,
            child: InkWell(
              onTap: () {
                setState(() {
                  currentPage++;
                  widget.onValue(currentPage);
                });
              },
              child: Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.all(1),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: SizedBox(
            height: 32,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.totalPages - 1,
              itemBuilder: (context, index) {
                index += 1;
                return InkWell(
                  onTap: () {
                    widget.onValue(index);
                    setState(() {
                      currentPage = index;
                    });
                  },
                  child: Container(
                    width: 30,
                    margin: const EdgeInsets.all(1),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:
                            currentPage == index ? Colors.blue : Colors.white,
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Text(index.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            color: currentPage == index
                                ? Colors.white
                                : Colors.black)),
                  ),
                );
              },
            ),
          )),
          InkWell(
            onTap: () {
              widget.onValue(widget.totalPages);
              setState(() {
                currentPage = widget.totalPages;
              });
            },
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.all(1),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: currentPage == widget.totalPages
                      ? Colors.blue
                      : Colors.white,
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Text(widget.totalPages.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      color: currentPage == widget.totalPages
                          ? Colors.white
                          : Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
