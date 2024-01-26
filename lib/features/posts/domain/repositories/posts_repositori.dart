import 'package:lessons43/features/posts/data/models/posts_models.dart';

abstract class PostsRepository {
  /// RU: получение всех постов
  ///
  /// EN: Getting all posts

  Future<List<PostModel>> getAllPosts();

  /// RU: получение детальной информации по айди постов
  ///
  /// EN: Getting post detail by id
  Future<PostModel> getPostDetail({required int id});
}
