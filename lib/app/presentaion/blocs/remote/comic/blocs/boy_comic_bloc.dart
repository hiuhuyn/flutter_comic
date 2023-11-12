import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_boy_or_girl_comics_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class BoyComicBloc extends Bloc<ComicEvent, ComicState> {
  GetBoyOrGirlComicsUsecase usecase;
  BoyComicBloc(this.usecase) : super(ComicLoading()) {
    on<GetBoyOrGirlComicsEvent>(onGet);
  }

  Future<FutureOr<void>> onGet(
      GetBoyOrGirlComicsEvent event, Emitter<ComicState> emit) async {
    emit(ComicLoading());
    final dataState = await usecase.call(isBoy: true, page: event.page);
    if (dataState is DataSuccess) {
      emit(ComicSuccesfull(listComic: dataState.data));
    } else {
      emit(ComicFailed(error: dataState.error));
    }
  }
}
