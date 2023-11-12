abstract class ComicEvent {}

class GetComicByGenreEvent extends ComicEvent {
  String? genreId;
  int? page;
  String? status;
  GetComicByGenreEvent({this.genreId, this.page, this.status});
}

class GetTrendingComicsEvent extends ComicEvent {
  int? page;
  GetTrendingComicsEvent({this.page});
}

class GetComicsSearchEvent extends ComicEvent {
  String query;
  int? page;
  GetComicsSearchEvent({required this.query, this.page});
}

class GetComicsSearchSuggestEvent extends ComicEvent {
  String query;
  GetComicsSearchSuggestEvent({required this.query});
}

class GetRecommendComicsEvent extends ComicEvent {
  GetRecommendComicsEvent();
}

class GetNewComicsEvent extends ComicEvent {
  int? page;
  String? status;
  GetNewComicsEvent({this.page, this.status});
}

class GetRecentUpdateComicsEvent extends ComicEvent {
  int? page;
  String? status;
  GetRecentUpdateComicsEvent({this.page, this.status});
}

class GetBoyOrGirlComicsEvent extends ComicEvent {
  bool isBoy;
  int? page;

  GetBoyOrGirlComicsEvent({required this.isBoy, this.page});
}

class GetCompletedComicsEvent extends ComicEvent {
  int? page;

  GetCompletedComicsEvent({this.page});
}

class GetComicByIdEvent extends ComicEvent {
  String comicId;
  GetComicByIdEvent({required this.comicId});
}

class GetChapterByComicIdEvent extends ComicEvent {
  String comicId;
  GetChapterByComicIdEvent({required this.comicId});
}

class GetContentOneChapterEvent extends ComicEvent {
  String comicId;
  int chapterId;
  GetContentOneChapterEvent({required this.chapterId, required this.comicId});
}

class GetTopComicsEvent extends ComicEvent {
  String? topType;
  int? page;
  String? status;
  GetTopComicsEvent({this.topType, this.page, this.status});
}
