import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';


typedef DioAction<T> = Future<Response<T>> Function();


abstract interface class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}

const _baseUrl = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;
  PostRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await dio.get('$_baseUrl/posts');
      final decodedJson = response.data as List;

      return decodedJson
          .map((jsonPostModel) => PostModel.fromJson(jsonPostModel as Map<String, dynamic>))
          .toList();
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel)
    => _performApiUnitRequest(() => dio.post('$_baseUrl/posts', data: postModel.toJson()));

  @override
  Future<Unit> deletePost(int postId)
    => _performApiUnitRequest(() => dio.delete('$_baseUrl/posts/$postId'));

  @override
  Future<Unit> updatePost(PostModel postModel)
    => _performApiUnitRequest(() => dio.patch('$_baseUrl/posts/${postModel.id}', data: postModel.toJson()));
}

Future<Unit> _performApiUnitRequest<T>(Future<T> Function() apiCall) async {
  try {
    await apiCall();
    return unit;
  } on DioException {
    throw ServerException();
  }
}