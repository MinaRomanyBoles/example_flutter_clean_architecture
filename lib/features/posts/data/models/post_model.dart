import '../../domain/entity/post.dart';
class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'body': body};
  }

}

extension PostMapper on Post {
  PostModel toModel() => PostModel(
    id: id,
    userId: userId,
    title: title,
    body: body,
  );
}

// Using Factory in class PostModel
/*
  factory PostModel.fromPost(Post post) {
    return PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
  }
*/
///final models = posts.map(PostModel.fromPost).toList();
/// -----------------------------------------------------------------------------------------///
// Using Extension in [post_model.dart] or [mappers/post_mapper.dart]
/*
extension PostMapper on Post {
  PostModel toModel() => PostModel(
    id: id,
    userId: userId,
    title: title,
    body: body,
  );
}
 */

///final models = posts.map((post) => post.toModel()).toList();