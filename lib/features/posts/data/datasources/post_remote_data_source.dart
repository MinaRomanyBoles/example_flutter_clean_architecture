import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';

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
  Future<Unit> addPost(PostModel postModel) async {
    try {
      await dio.post('$_baseUrl/posts', data: postModel.toJson(),);
      return unit;
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    try {
      await dio.delete('$_baseUrl/posts/$postId');
      return unit;
    } on DioException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    try {
      await dio.patch(
        '$_baseUrl/posts/${postModel.id}',
        data: postModel.toJson(),
      );
      return unit;
    } on DioException {
      throw ServerException();
    }
  }
}