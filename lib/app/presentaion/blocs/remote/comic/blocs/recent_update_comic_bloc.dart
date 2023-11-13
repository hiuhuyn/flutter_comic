import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_recent_update_comics_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class RecentUpdateComicsBloc extends Bloc<ComicEvent, ComicState> {
  GetRecentUpdateComicsUsecase usecase;
  RecentUpdateComicsBloc(this.usecase) : super(ComicLoading()) {
    on<GetRecentUpdateComicsEvent>(onGet);
  }

  Future<FutureOr<void>> onGet(
      GetRecentUpdateComicsEvent event, Emitter<ComicState> emit) async {
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
