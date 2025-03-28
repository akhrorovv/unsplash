import 'dart:convert';

List<Collection> collectionFromJson(String str) =>
    List<Collection>.from(json.decode(str).map((x) => Collection.fromJson(x)));

String collectionToJson(List<Collection> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Collection {
  String? id;
  String? title;
  String? totalPhotos;
  User? user;
  CollectionCoverPhoto? coverPhoto;

  Collection({
    this.id,
    this.title,
    this.totalPhotos,
    this.user,
    this.coverPhoto,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json["id"]?.toString(),
        title: json["title"]?.toString(),
        totalPhotos: json["total_photos"]?.toString(),
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
        coverPhoto: json["cover_photo"] != null
            ? CollectionCoverPhoto.fromJson(json["cover_photo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "total_photos": totalPhotos,
        "user": user?.toJson(),
        "cover_photo": coverPhoto?.toJson(),
      };
}

class CollectionCoverPhoto {
  String id;
  Urls? urls;
  User? user;

  CollectionCoverPhoto({
    required this.id,
    this.urls,
    this.user,
  });

  factory CollectionCoverPhoto.fromJson(Map<String, dynamic> json) =>
      CollectionCoverPhoto(
        id: json["id"]?.toString() ?? '',
        urls: json["urls"] != null ? Urls.fromJson(json["urls"]) : null,
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urls": urls?.toJson(),
        "user": user?.toJson(),
      };
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"]?.toString() ?? '',
        full: json["full"]?.toString() ?? '',
        regular: json["regular"]?.toString() ?? '',
        small: json["small"]?.toString() ?? '',
        thumb: json["thumb"]?.toString() ?? '',
        smallS3: json["small_s3"]?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}

class User {
  String? id;
  DateTime? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  String? totalCollections;
  String? totalLikes;
  String? totalPhotos;
  String? totalPromotedPhotos;
  String? totalIllustrations;
  String? totalPromotedIllustrations;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.totalPromotedPhotos,
    this.totalIllustrations,
    this.totalPromotedIllustrations,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"]?.toString(),
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"]) ?? DateTime.now()
            : null,
        username: json["username"]?.toString(),
        name: json["name"]?.toString(),
        firstName: json["first_name"]?.toString(),
        lastName: json["last_name"]?.toString(),
        portfolioUrl: json["portfolio_url"]?.toString(),
        bio: json["bio"]?.toString(),
        location: json["location"]?.toString(),
        links: json["links"] != null ? UserLinks.fromJson(json["links"]) : null,
        profileImage: json["profile_image"] != null
            ? ProfileImage.fromJson(json["profile_image"])
            : null,
        instagramUsername: json["instagram_username"]?.toString(),
        totalCollections: json["total_collections"]?.toString(),
        totalLikes: json["total_likes"]?.toString(),
        totalPhotos: json["total_photos"]?.toString(),
        totalPromotedPhotos: json["total_promoted_photos"]?.toString(),
        totalIllustrations: json["total_illustrations"]?.toString(),
        totalPromotedIllustrations:
            json["total_promoted_illustrations"]?.toString(),
        acceptedTos: json["accepted_tos"] ?? false,
        forHire: json["for_hire"] ?? false,
        social: json["social"] != null ? Social.fromJson(json["social"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toJson(),
        "profile_image": profileImage?.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "total_promoted_photos": totalPromotedPhotos,
        "total_illustrations": totalIllustrations,
        "total_promoted_illustrations": totalPromotedIllustrations,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toJson(),
      };
}

class UserLinks {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"]?.toString(),
        html: json["html"]?.toString(),
        photos: json["photos"]?.toString(),
        likes: json["likes"]?.toString(),
        portfolio: json["portfolio"]?.toString(),
        following: json["following"]?.toString(),
        followers: json["followers"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"]?.toString(),
        medium: json["medium"]?.toString(),
        large: json["large"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"]?.toString(),
        portfolioUrl: json["portfolio_url"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
      };
}
