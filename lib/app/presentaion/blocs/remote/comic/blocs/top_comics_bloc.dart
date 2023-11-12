import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_top_comics_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class TopComicsBloc extends Bloc<ComicEvent, ComicState> {
  GetTopComicsUsecase usecase;
  TopComicsBloc(this.usecase) : super(ComicLoading()) {
    on<GetTopComicsEvent>(onGet);
  }

  Future<FutureOr<void>> onGet(
      GetTopComicsEvent event, Emitter<ComicState> emit) async {
    emit(ComicLoading());
    final dataState = await usecase.call(
        page: event.page, status: event.status, topType: event.topType);
    if (dataState is DataSuccess) {
      emit(ComicSuccesfull(listComic: dataState.data));
    } else {
      emit(ComicFailed(error: dataState.error));
    }
  }
}
