import 'package:nettruyen/app/domain/repository/repository_api.dart';
import 'package:nettruyen/core/resources/data_state.dart';
import '../../models/comic_list.dart';

class GetBoyOrGirlComicsUsecase {
  RepositoryApi repositoryApi;
  GetBoyOrGirlComicsUsecase(this.repositoryApi);

  Future<DataState<ComicListEntity>> call({bool? isBoy, int? page}) async {
    return await repositoryApi.getBoyOrGirlComics(
        isBoy: isBoy ?? true, page: page);
  }
}
