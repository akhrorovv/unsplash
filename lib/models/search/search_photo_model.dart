// To parse this JSON data, do
//
//     final searchPhoto = searchPhotoFromJson(jsonString);

import 'dart:convert';

SearchPhotoRes searchPhotoFromJson(String str) => SearchPhotoRes.fromJson(json.decode(str));

String searchPhotoToJson(SearchPhotoRes data) => json.encode(data.toJson());

class SearchPhotoRes {
  int total;
  int totalPages;
  List<SearchPhoto> results;

  SearchPhotoRes({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchPhotoRes.fromJson(Map<String, dynamic> json) => SearchPhotoRes(
    total: json["total"],
    totalPages: json["total_pages"],
    results: List<SearchPhoto>.from(json["results"].map((x) => SearchPhoto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class SearchPhoto {
  String id;
  // String slug;
  // AlternativeSlugs alternativeSlugs;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic promotedAt;
  int width;
  int height;
  // String color;
  // String blurHash;
  // String? description;
  // String altDescription;
  // List<dynamic> breadcrumbs;
  Urls urls;
  // ResultLinks links;
  // int likes;
  // bool likedByUser;
  // List<dynamic> currentUserCollections;
  // dynamic sponsorship;
  // TopicSubmissions topicSubmissions;
  // AssetType assetType;
  // User user;

  SearchPhoto({
    required this.id,
    // required this.slug,
    // required this.alternativeSlugs,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.promotedAt,
    required this.width,
    required this.height,
    // required this.color,
    // required this.blurHash,
    // required this.description,
    // required this.altDescription,
    // required this.breadcrumbs,
    required this.urls,
    // required this.links,
    // required this.likes,
    // required this.likedByUser,
    // required this.currentUserCollections,
    // required this.sponsorship,
    // required this.topicSubmissions,
    // required this.assetType,
    // required this.user,
  });

  factory SearchPhoto.fromJson(Map<String, dynamic> json) => SearchPhoto(
    id: json["id"],
    // slug: json["slug"],
    // alternativeSlugs: AlternativeSlugs.fromJson(json["alternative_slugs"]),
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    // promotedAt: json["promoted_at"],
    width: json["width"],
    height: json["height"],
    // color: json["color"],
    // blurHash: json["blur_hash"],
    // description: json["description"],
    // altDescription: json["alt_description"],
    // breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
    urls: Urls.fromJson(json["urls"]),
    // links: ResultLinks.fromJson(json["links"]),
    // likes: json["likes"],
    // likedByUser: json["liked_by_user"],
    // currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    // sponsorship: json["sponsorship"],
    // topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
    // assetType: assetTypeValues.map[json["asset_type"]]!,
    // user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "slug": slug,
    // "alternative_slugs": alternativeSlugs.toJson(),
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
    // "promoted_at": promotedAt,
    "width": width,
    "height": height,
    // "color": color,
    // "blur_hash": blurHash,
    // "description": description,
    // "alt_description": altDescription,
    // "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
    "urls": urls.toJson(),
    // "links": links.toJson(),
    // "likes": likes,
    // "liked_by_user": likedByUser,
    // "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    // "sponsorship": sponsorship,
    // "topic_submissions": topicSubmissions.toJson(),
    // "asset_type": assetTypeValues.reverse[assetType],
    // "user": user.toJson(),
  };
}

class AlternativeSlugs {
  String en;
  String es;
  String ja;
  String fr;
  String it;
  String ko;
  String de;
  String pt;

  AlternativeSlugs({
    required this.en,
    required this.es,
    required this.ja,
    required this.fr,
    required this.it,
    required this.ko,
    required this.de,
    required this.pt,
  });

  factory AlternativeSlugs.fromJson(Map<String, dynamic> json) => AlternativeSlugs(
    en: json["en"],
    es: json["es"],
    ja: json["ja"],
    fr: json["fr"],
    it: json["it"],
    ko: json["ko"],
    de: json["de"],
    pt: json["pt"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
    "es": es,
    "ja": ja,
    "fr": fr,
    "it": it,
    "ko": ko,
    "de": de,
    "pt": pt,
  };
}

enum AssetType {
  PHOTO
}

final assetTypeValues = EnumValues({
  "photo": AssetType.PHOTO
});

class ResultLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  ResultLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

class TopicSubmissions {
  FashionBeauty? fashionBeauty;
  Experimental? wallpapers;
  Experimental? people;
  Experimental? film;
  Experimental? experimental;
  Experimental? health;
  Experimental? spirituality;

  TopicSubmissions({
    this.fashionBeauty,
    this.wallpapers,
    this.people,
    this.film,
    this.experimental,
    this.health,
    this.spirituality,
  });

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
    fashionBeauty: json["fashion-beauty"] == null ? null : FashionBeauty.fromJson(json["fashion-beauty"]),
    wallpapers: json["wallpapers"] == null ? null : Experimental.fromJson(json["wallpapers"]),
    people: json["people"] == null ? null : Experimental.fromJson(json["people"]),
    film: json["film"] == null ? null : Experimental.fromJson(json["film"]),
    experimental: json["experimental"] == null ? null : Experimental.fromJson(json["experimental"]),
    health: json["health"] == null ? null : Experimental.fromJson(json["health"]),
    spirituality: json["spirituality"] == null ? null : Experimental.fromJson(json["spirituality"]),
  );

  Map<String, dynamic> toJson() => {
    "fashion-beauty": fashionBeauty?.toJson(),
    "wallpapers": wallpapers?.toJson(),
    "people": people?.toJson(),
    "film": film?.toJson(),
    "experimental": experimental?.toJson(),
    "health": health?.toJson(),
    "spirituality": spirituality?.toJson(),
  };
}

class Experimental {
  Status status;

  Experimental({
    required this.status,
  });

  factory Experimental.fromJson(Map<String, dynamic> json) => Experimental(
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
  };
}

enum Status {
  REJECTED
}

final statusValues = EnumValues({
  "rejected": Status.REJECTED
});

class FashionBeauty {
  String status;
  DateTime? approvedOn;

  FashionBeauty({
    required this.status,
    this.approvedOn,
  });

  factory FashionBeauty.fromJson(Map<String, dynamic> json) => FashionBeauty(
    status: json["status"],
    approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "approved_on": approvedOn?.toIso8601String(),
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
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
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
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String bio;
  String location;
  UserLinks links;
  ProfileImage profileImage;
  String instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  int totalPromotedPhotos;
  int totalIllustrations;
  int totalPromotedIllustrations;
  bool acceptedTos;
  bool forHire;
  Social social;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalPromotedPhotos,
    required this.totalIllustrations,
    required this.totalPromotedIllustrations,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    twitterUsername: json["twitter_username"],
    portfolioUrl: json["portfolio_url"],
    bio: json["bio"],
    location: json["location"],
    links: UserLinks.fromJson(json["links"]),
    profileImage: ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    totalPromotedPhotos: json["total_promoted_photos"],
    totalIllustrations: json["total_illustrations"],
    totalPromotedIllustrations: json["total_promoted_illustrations"],
    acceptedTos: json["accepted_tos"],
    forHire: json["for_hire"],
    social: Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "twitter_username": twitterUsername,
    "portfolio_url": portfolioUrl,
    "bio": bio,
    "location": location,
    "links": links.toJson(),
    "profile_image": profileImage.toJson(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "total_promoted_photos": totalPromotedPhotos,
    "total_illustrations": totalIllustrations,
    "total_promoted_illustrations": totalPromotedIllustrations,
    "accepted_tos": acceptedTos,
    "for_hire": forHire,
    "social": social.toJson(),
  };
}

class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    likes: json["likes"],
    portfolio: json["portfolio"],
    following: json["following"],
    followers: json["followers"],
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
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}

class Social {
  String instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  Social({
    required this.instagramUsername,
    required this.portfolioUrl,
    required this.twitterUsername,
    required this.paypalEmail,
  });

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    instagramUsername: json["instagram_username"],
    portfolioUrl: json["portfolio_url"],
    twitterUsername: json["twitter_username"],
    paypalEmail: json["paypal_email"],
  );

  Map<String, dynamic> toJson() => {
    "instagram_username": instagramUsername,
    "portfolio_url": portfolioUrl,
    "twitter_username": twitterUsername,
    "paypal_email": paypalEmail,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
