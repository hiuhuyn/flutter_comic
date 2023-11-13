import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nettruyen/app/domain/models/comic_list.dart';
import 'package:nettruyen/app/domain/usecases/remote/get_comics_search_suggest_usecase.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_event.dart';
import 'package:nettruyen/app/presentaion/blocs/remote/comic/comic_state.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class SearchSuggestComicBloc extends Bloc<ComicEvent, ComicState> {
  GetComicsSearchSuggestUsecase usecase;
  SearchSuggestComicBloc(this.usecase) : super(ComicLoading()) {
    on<GetComicsSearchSuggestEvent>(onSearch);
  }

  FutureOr<void> onSearch(
      GetComicsSearchSuggestEvent event, Emitter<ComicState> emit) async {
    emit(ComicLoading());
    final dataState = await usecase.call(query: event.query);
    if (dataState is DataSuccess) {
      emit(ComicSuccesfull(listComic: ComicListEntity(comics: dataState.data)));
    } else {
      emit(ComicFailed(error: dataState.error!));
    }
  }
}
