import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_comic_by_id_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class ComicByIdBloc extends Bloc<ComicEvent, ComicState> {
  GetComicByIdUsecase usecase;
  ComicByIdBloc(this.usecase) : super(ComicLoading()) {
    on<GetComicByIdEvent>(onGet);
  }

  Future<FutureOr<void>> onGet(
      GetComicByIdEvent event, Emitter<ComicState> emit) async {
    emit(ComicLoading());
    final dataState = await usecase.call(comicId: event.comicId);
    if (dataState is DataSuccess) {
      emit(ComicSuccesfull(comic: dataState.data));
    } else {
      emit(ComicFailed(error: dataState.error!));
    }
  }
}
