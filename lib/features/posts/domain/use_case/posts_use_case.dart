import 'package:lessons43/features/posts/data/models/posts_models.dart';
import 'package:lessons43/features/posts/domain/repositories/posts_repositori.dart';

class PostsUseCase{
  final PostsRepository postsRepository;

  PostsUseCase({required this.postsRepository});

  Future<List<PostModel>> getAllPosts() async{
    return await postsRepository.getAllPosts();
  }

  Future<PostModel> getPostDetail ({required int id})async{
    return await postsRepository.getPostDetail(id: id);
  }
}