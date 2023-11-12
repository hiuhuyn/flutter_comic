import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/models/content_chapter.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_chapter_by_comic_id_usecase.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_content_one_chapter_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/chapter/chapter_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/chapter/chapter_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  GetChapterByComicIdUsecase usecaseGetChapter;
  GetContentOneChapterUsecase usecaseGetContentChapter;
  ChapterBloc(this.usecaseGetChapter, this.usecaseGetContentChapter)
      : super(ChapterState()) {
    on<GetChapterEvent>(onGetChapterEvent);
    on<GetContentChapterEvent>(onGetContentChapterEvent);
  }

  FutureOr<void> onGetChapterEvent(
      GetChapterEvent event, Emitter<ChapterState> emit) async {
    emit(ChapterLoading());
    final dataState = await usecaseGetChapter.call(comicId: event.comic.id!);
    if (dataState is DataSuccess) {
      emit(ChapterSuccessfull(
          comic: event.comic,
          contentChapter: ContentChapterEntity(chapters: dataState.data)));
    } else {
      emit(ChapterFailed(error: dataState.error));
    }
  }

  FutureOr<void> onGetContentChapterEvent(
      GetContentChapterEvent event, Emitter<ChapterState> emit) async {
    emit(ChapterLoading());
    final dataState = await usecaseGetContentChapter.call(
        comicId: event.comic.id!, chapterId: event.chapterId);
    if (dataState is DataSuccess) {
      emit(ChapterSuccessfull(
          comic: event.comic, contentChapter: dataState.data));
    } else {
      emit(ChapterFailed(error: dataState.error));
    }
  }
}
