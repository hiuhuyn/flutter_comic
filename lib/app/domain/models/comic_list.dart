// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nettruyen/app/domain/models/comic.dart';

class ComicListEntity {
  List<ComicEntity>? comics;
  int? total_pages;
  int? current_page;
  ComicListEntity({
    this.comics,
    this.total_pages,
    this.current_page,
  });

  ComicListEntity copyWith({
    List<ComicEntity>? comics,
    int? total_pages,
    int? current_page,
  }) {
    return ComicListEntity(
      comics: comics ?? this.comics,
      total_pages: total_pages ?? this.total_pages,
      current_page: current_page ?? this.current_page,
    );
  }

  @override
  String toString() =>
      'ComicListEntity(comics: $comics, total_pages: $total_pages, current_page: $current_page)';
}
