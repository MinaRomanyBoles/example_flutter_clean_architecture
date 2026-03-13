import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';

abstract interface class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

const _cachedPostsKey = "CACHED_POSTS";


class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) async{
    final postModelsToJson = postModels.map((postModel) => postModel.toJson()).toList();
    await sharedPreferences.setString(_cachedPostsKey, json.encode(postModelsToJson));
    return unit;
  }

  @override
  Future<List<PostModel>> getCachedPosts() async{
    final jsonString = sharedPreferences.getString(_cachedPostsKey);
    if (jsonString == null) {
      throw EmptyCacheException();
    }
    final decodedJsonData = json.decode(jsonString) as List;
    return decodedJsonData
        .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel as Map<String, dynamic>))
        .toList();
  }
}