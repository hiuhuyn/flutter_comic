// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ImageChapterEntity extends Equatable {
  int? page;
  String? src;
  String? backup_src;
  ImageChapterEntity({
    this.page,
    this.src,
    this.backup_src,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [page, src, backup_src];

  ImageChapterEntity copyWith({
    int? page,
    String? src,
    String? backup_src,
  }) {
    return ImageChapterEntity(
      page: page ?? this.page,
      src: src ?? this.src,
      backup_src: backup_src ?? this.backup_src,
    );
  }

  @override
  bool get stringify => true;
}
