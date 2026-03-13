import 'package:dartz/dartz.dart';
import 'package:test_app_posts/features/posts/domain/entity/post.dart';
import '../../../../core/error/failures.dart';
import '../repositories/posts_repository.dart';

class UpdatePostUseCase{
  final PostsRepository repository;

  UpdatePostUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}