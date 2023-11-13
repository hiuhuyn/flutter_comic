import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_comic_by_genre_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class ComicByGenreBloc extends Bloc<ComicEvent, ComicState> {
  GetComicByGenreUsecase usecase;
  ComicByGenreBloc(this.usecase) : super(ComicLoading()) {
    on<GetComicByGenreEvent>(onGet);
  }

  Future<FutureOr<void>> onGet(
      GetComicByGenreEvent event, Emitter<ComicState> emit) async {
    emit(ComicLoading());
    final dataState = await usecase.call(
        page: event.page, genreId: event.genreId, status: event.status);
    if (dataState is DataSuccess) {
      emit(ComicSuccesfull(listComic: dataState.data));
    } else {
      emit(ComicFailed(error: dataState.error!));
    }
  }
}
