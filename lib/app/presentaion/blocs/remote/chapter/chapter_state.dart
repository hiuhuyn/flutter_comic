// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/models/content_chapter.dart';

class ChapterState extends Equatable {
  ContentChapterEntity? contentChapter;
  ComicEntity? comic;
  DioException? error;
  ChapterState({
    this.contentChapter,
    this.comic,
    this.error,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [contentChapter, comic, error];

  ChapterState copyWith({
    ContentChapterEntity? contentChapter,
    ComicEntity? comic,
    DioException? error,
  }) {
    return ChapterState(
      contentChapter: contentChapter ?? this.contentChapter,
      comic: comic ?? this.comic,
      error: error ?? this.error,
    );
  }
}

class ChapterSuccessfull extends ChapterState {
  ChapterSuccessfull({super.contentChapter, super.comic});
}

class ChapterLoading extends ChapterState {
  ChapterLoading();
}

class ChapterFailed extends ChapterState {
  ChapterFailed({super.error});
}
