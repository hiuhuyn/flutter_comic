import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_recommend_comics_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class RecommendComicsBloc extends Bloc<ComicEvent, ComicState> {
  GetRecommendComicsUsecase usecase;
  RecommendComicsBloc(this.usecase) : super(ComicLoading()) {
    on<GetRecommendComicsEvent>(onGet);
  }

  Future<FutureOr<void>> onGet(
      GetRecommendComicsEvent event, Emitter<ComicState> emit) async {
    emit(ComicLoading());
    final dataState = await usecase.call();
    if (dataState is DataSuccess) {
      emit(ComicSuccesfull(listComic: ComicListEntity(comics: dataState.data)));
    } else {
      emit(ComicFailed(error: dataState.error!));
    }
  }
}
