import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entity/post.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';
import '../models/post_model.dart';

typedef TaskAction<T> = Future<T> Function();

class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    return await _executeWithCacheCheck(
      action: () async {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return remotePosts;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    return _executeActionSafe(() => remoteDataSource.addPost(post.toModel()));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return _executeActionSafe(() => remoteDataSource.deletePost(postId));
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    return _executeActionSafe(() => remoteDataSource.updatePost(post.toModel()));
  }

// دالة موحدة لعمليات الـ GET مع التعامل الذكي مع الكاش
  Future<Either<Failure, List<Post>>> _executeWithCacheCheck({
    required TaskAction<List<Post>> action,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await action();
        return Right(result);
      } catch (_) {
        return await _returnLocalData();
      }
    } else {
      return await _returnLocalData();
    }
  }

  // دالة موحدة لعمليات الـ Add/Update/Delete
  Future<Either<Failure, Unit>> _executeActionSafe(TaskAction<Unit> action) async {
    if (await networkInfo.isConnected) {
      try {
        await action();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      } catch (_) {
        return Left(ServerFailure()); // التعامل مع أي خطأ غير متوقع
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, List<Post>>> _returnLocalData() async {
    try {
      final localPosts = await localDataSource.getCachedPosts();
      return Right(localPosts);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }
}
