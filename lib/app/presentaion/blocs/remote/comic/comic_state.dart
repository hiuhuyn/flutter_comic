// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/models/content_chapter.dart';

class ComicState extends Equatable {
  ComicListEntity? listComic;
  ComicEntity? comic;
  ContentChapterEntity? contentChapter;
  DioException? error;
  ComicState({
    this.listComic,
    this.comic,
    this.contentChapter,
    this.error,
  });

  @override
  List<Object?> get props => [listComic, comic, contentChapter, error];

  ComicState copyWith({
    ComicListEntity? listComic,
    ComicEntity? comic,
    ContentChapterEntity? contentChapter,
    DioException? error,
  }) {
    return ComicState(
      listComic: listComic ?? this.listComic,
      comic: comic ?? this.comic,
      contentChapter: contentChapter ?? this.contentChapter,
      error: error ?? this.error,
    );
  }
}

class ComicLoading extends ComicState {
  ComicLoading();
}

class ComicSuccesfull extends ComicState {
  ComicSuccesfull({super.listComic, super.comic, super.contentChapter});
}

class ComicFailed extends ComicState {
  ComicFailed({super.error});
}
