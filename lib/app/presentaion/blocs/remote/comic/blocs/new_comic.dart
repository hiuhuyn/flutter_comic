import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_new_comics_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class NewComicsBloc extends Bloc<ComicEvent, ComicState> {
  GetNewComicsUsecase usecase;
  NewComicsBloc(this.usecase) : super(ComicLoading()) {
    on<GetNewComicsEvent>(onGet);
  }

  Future<FutureOr<void>> onGet(
      GetNewComicsEvent event, Emitter<ComicState> emit) async {
    emit(ComicLoading());
    final dataState =
        await usecase.call(page: event.page, status: event.status);
    if (dataState is DataSuccess) {
      emit(ComicSuccesfull(listComic: dataState.data));
    } else {
      emit(ComicFailed(error: dataState.error!));
    }
  }
}
