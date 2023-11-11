// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ChapterEntity extends Equatable {
  int id;
  String name;
  ChapterEntity({
    required this.id,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];

  @override
  bool get stringify => true;
}
