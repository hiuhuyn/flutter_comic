// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:nettruyen/app/domain/models/genre.dart';

class GenreState extends Equatable {
  List<GenreEntity>? listGenre;
  DioException? error;
  GenreState({
    this.listGenre,
    this.error,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [listGenre, error];

  GenreState copyWith({
    List<GenreEntity>? listGenre,
    DioException? error,
  }) {
    return GenreState(
      listGenre: listGenre ?? this.listGenre,
      error: error ?? this.error,
    );
  }
}

class GenreLoading extends GenreState {
  GenreLoading();
}

class GenreSuccessfull extends GenreState {
  GenreSuccessfull({super.listGenre});
}

class GenreFailed extends GenreState {
  GenreFailed({super.error});
}
