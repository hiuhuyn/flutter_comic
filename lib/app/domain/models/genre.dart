import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GenreEntity extends Equatable {
  String? id;
  String? name;
  String? description;
  GenreEntity({
    this.id,
    this.name,
    this.description,
  });

  GenreEntity copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return GenreEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
      ];

  @override
  bool get stringify => true;
}
