import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';

class GetRecommendComicsUsecase {
  RepositoryApi repositoryApi;
  GetRecommendComicsUsecase(this.repositoryApi);
  Future<DataState<List<ComicEntity>>> call() async {
    return await repositoryApi.getRecommendComics();
  }
}
