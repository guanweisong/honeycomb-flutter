import 'package:intl/intl.dart';

class Post {
  late String id;
  late int postViews;
  List<Tag>? galleryStyle;
  List<Tag>? movieStyle;
  List<Tag>? movieActor;
  List<Tag>? movieDirector;
  String? movieNameEn;
  String? movieTime;
  PostCover? postCover;
  late int postType;
  late int commentStatus;
  late int postStatus;
  late PostAuthor postAuthor;
  late PostCategory postCategory;
  String? postContent;
  String? postTitle;
  String? quoteAuthor;
  String? quoteContent;
  String? galleryLocation;
  late String updatedAt;
  late String createdAt;

  Post({
    required this.id,
    required this.postViews,
    this.galleryStyle,
    this.movieStyle,
    this.movieActor,
    this.movieDirector,
    this.movieNameEn,
    this.movieTime,
    required this.postCover,
    required this.postType,
    required this.commentStatus,
    required this.postStatus,
    required this.postAuthor,
    required this.postCategory,
    this.postContent,
    this.postTitle,
    this.quoteAuthor,
    this.quoteContent,
    this.galleryLocation,
    required this.updatedAt,
    required this.createdAt,
  });

  getTitle() {
    if (postType == 1) {
      return "$postTitle $movieNameEn (${DateFormat('yyyy-MM-dd').format(DateTime.parse(movieTime!))})";
    } else {
      return postTitle ?? "";
    }
  }

  Post.fromJson(Map<String, dynamic> json) {
    id = json["_id"].toString();
    postViews = json["post_views"].toInt();
    if (json["gallery_style"] != null) {
      galleryStyle = List<Tag>.from(
          json["gallery_style"]?.map((item) => Tag.fromJson(item)).toList());
    }
    if (json["movie_style"] != null) {
      movieStyle = List<Tag>.from(
          json["movie_style"]?.map((item) => Tag.fromJson(item)).toList());
    }
    if (json["movie_actor"] != null) {
      movieActor = List<Tag>.from(
          json["movie_actor"]?.map((item) => Tag.fromJson(item)).toList());
    }
    if (json["movie_director"] != null) {
      movieDirector = List<Tag>.from(
          json["movie_director"]?.map((item) => Tag.fromJson(item)).toList());
    }
    movieNameEn = json["movie_name_en"]?.toString();
    movieTime = json["movie_time"]?.toString();
    if (json["post_cover"] != null) {
      postCover = PostCover.fromJson(json["post_cover"]);
    }
    postType = json["post_type"].toInt();
    commentStatus = json["comment_status"].toInt();
    postStatus = json["post_status"].toInt();
    postAuthor = PostAuthor.fromJson(json["post_author"]);
    postCategory = PostCategory.fromJson(json["post_category"]);
    postContent = json["post_content"]?.toString();
    postTitle = json["post_title"]?.toString();
    quoteAuthor = json["quote_author"]?.toString();
    quoteContent = json["quote_content"]?.toString();
    galleryLocation = json["gallery_location"]?.toString();
    updatedAt = json["updated_at"].toString();
    createdAt = json["created_at"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["post_views"] = postViews;
    if (galleryStyle != null) {
      data["gallery_style"] = galleryStyle!.map((e) => e.toJson()).toList();
    }
    if (movieStyle != null) {
      data["movie_style"] = movieStyle!.map((e) => e.toJson()).toList();
    }
    if (movieActor != null) {
      data["movie_actor"] = movieActor!.map((e) => e.toJson()).toList();
    }
    if (movieDirector != null) {
      data["movie_director"] = movieDirector!.map((e) => e.toJson()).toList();
    }
    if (movieNameEn != null) {
      data["movie_name_en"] = movieNameEn;
    }
    if (movieTime != null) {
      data["movie_time"] = movieTime;
    }
    data["post_cover"] = postCover?.toJson();
    data["post_type"] = postType;
    data["comment_status"] = commentStatus;
    data["post_status"] = postStatus;
    data["post_author"] = postAuthor.toJson();
    data["post_category"] = postCategory.toJson();
    if (postContent != null) {
      data["post_content"] = postContent;
    }
    if (postTitle != null) {
      data["post_title"] = postTitle;
    }
    if (quoteAuthor != null) {
      data["quote_author"] = quoteAuthor;
    }
    if (quoteContent != null) {
      data["quote_content"] = quoteContent;
    }
    if (galleryLocation != null) {
      data["gallery_location"] = galleryLocation;
    }
    data["updated_at"] = updatedAt;
    data["created_at"] = createdAt;
    return data;
  }
}

class PostCategory {
  late String id;
  late String categoryTitle;

  PostCategory({required this.id, required this.categoryTitle});

  PostCategory.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["category_title"] is String) {
      categoryTitle = json["category_title"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["category_title"] = categoryTitle;
    return data;
  }
}

class PostAuthor {
  late String id;
  late String userName;

  PostAuthor({required this.id, required this.userName});

  PostAuthor.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["user_name"] is String) userName = json["user_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["user_name"] = userName;
    return data;
  }
}

class PostCover {
  late String id;
  late String mediaUrl;

  PostCover({required this.id, required this.mediaUrl});

  PostCover.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["media_url"] is String) mediaUrl = json["media_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["media_url"] = mediaUrl;
    return data;
  }
}

class Tag {
  late String id;
  late String tagName;

  Tag({required this.id, required this.tagName});

  Tag.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["tag_name"] is String) tagName = json["tag_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["tag_name"] = tagName;
    return data;
  }
}
