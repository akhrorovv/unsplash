// To parse this JSON data, do
//
//     final detailsPhoto = detailsPhotoFromJson(jsonString);

import 'dart:convert';

DetailsPhoto detailsPhotoFromJson(String str) => DetailsPhoto.fromJson(json.decode(str));

String detailsPhotoToJson(DetailsPhoto data) => json.encode(data.toJson());

class DetailsPhoto {
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
  // dynamic description;
  String altDescription;
  // List<dynamic> breadcrumbs;
  Urls urls;
  // DetailsPhotoLinks links;
  int likes;
  // bool likedByUser;
  // List<dynamic> currentUserCollections;
  // Sponsorship sponsorship;
  // DetailsPhotoTopicSubmissions topicSubmissions;
  // String assetType;
  // User user;
  Exif? exif;
  // Location location;
  // Meta meta;
  // bool publicDomain;
  // List<DetailsPhotoTag> tags;
  int views;
  int downloads;
  // List<dynamic> topics;
  // RelatedCollections relatedCollections;

  DetailsPhoto({
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
    required this.altDescription,
    // required this.breadcrumbs,
    required this.urls,
    // required this.links,
    required this.likes,
    // required this.likedByUser,
    // required this.currentUserCollections,
    // required this.sponsorship,
    // required this.topicSubmissions,
    // required this.assetType,
    // required this.user,
    required this.exif,
    // required this.location,
    // required this.meta,
    // required this.publicDomain,
    // required this.tags,
    required this.views,
    required this.downloads,
    // required this.topics,
    // required this.relatedCollections,
  });

  factory DetailsPhoto.fromJson(Map<String, dynamic> json) => DetailsPhoto(
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
    altDescription: json["alt_description"] ?? "Unknown",
    // breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
    urls: Urls.fromJson(json["urls"]),
    // links: DetailsPhotoLinks.fromJson(json["links"]),
    likes: json["likes"] ?? "Unknown",
    // likedByUser: json["liked_by_user"],
    // currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    // sponsorship: Sponsorship.fromJson(json["sponsorship"]),
    // topicSubmissions: DetailsPhotoTopicSubmissions.fromJson(json["topic_submissions"]),
    // assetType: json["asset_type"],
    // user: User.fromJson(json["user"]),
    exif: Exif.fromJson(json["exif"]),
    // location: Location.fromJson(json["location"]),
    // meta: Meta.fromJson(json["meta"]),
    // publicDomain: json["public_domain"],
    // tags: List<DetailsPhotoTag>.from(json["tags"].map((x) => DetailsPhotoTag.fromJson(x))),
    views: json["views"],
    downloads: json["downloads"],
    // topics: List<dynamic>.from(json["topics"].map((x) => x)),
    // relatedCollections: RelatedCollections.fromJson(json["related_collections"]),
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
    "alt_description": altDescription,
    // "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
    "urls": urls.toJson(),
    // "links": links.toJson(),
    "likes": likes,
    // "liked_by_user": likedByUser,
    // "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    // "sponsorship": sponsorship.toJson(),
    // "topic_submissions": topicSubmissions.toJson(),
    // "asset_type": assetType,
    // "user": user.toJson(),
    "exif": exif!.toJson(),
    // "location": location.toJson(),
    // "meta": meta.toJson(),
    // "public_domain": publicDomain,
    // "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "views": views,
    "downloads": downloads,
    // "topics": List<dynamic>.from(topics.map((x) => x)),
    // "related_collections": relatedCollections.toJson(),
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

class Exif {
  String make;
  String model;
  String name;
  String exposureTime;
  String aperture;
  String focalLength;
  int iso;

  Exif({
    required this.make,
    required this.model,
    required this.name,
    required this.exposureTime,
    required this.aperture,
    required this.focalLength,
    required this.iso,
  });

  factory Exif.fromJson(Map<String, dynamic> json) => Exif(
    make: json["make"] ?? "Unknown",
    model: json["model"] ?? "Unknown",
    name: json["name"] ?? "Unknown",
    exposureTime: json["exposure_time"] ?? "Unknown",
    aperture: json["aperture"] ?? "Unknown",
    focalLength: json["focal_length"] ?? "Unknown",
    iso: json["iso"] ?? "Unknown",
  );

  Map<String, dynamic> toJson() => {
    "make": make,
    "model": model,
    "name": name,
    "exposure_time": exposureTime,
    "aperture": aperture,
    "focal_length": focalLength,
    "iso": iso,
  };
}

class DetailsPhotoLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  DetailsPhotoLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory DetailsPhotoLinks.fromJson(Map<String, dynamic> json) => DetailsPhotoLinks(
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

class Location {
  dynamic name;
  dynamic city;
  dynamic country;
  Position position;

  Location({
    required this.name,
    required this.city,
    required this.country,
    required this.position,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    city: json["city"],
    country: json["country"],
    position: Position.fromJson(json["position"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "city": city,
    "country": country,
    "position": position.toJson(),
  };
}

class Position {
  int latitude;
  int longitude;

  Position({
    required this.latitude,
    required this.longitude,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Meta {
  bool index;

  Meta({
    required this.index,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    index: json["index"],
  );

  Map<String, dynamic> toJson() => {
    "index": index,
  };
}

class RelatedCollections {
  int total;
  String type;
  List<Result> results;

  RelatedCollections({
    required this.total,
    required this.type,
    required this.results,
  });

  factory RelatedCollections.fromJson(Map<String, dynamic> json) => RelatedCollections(
    total: json["total"],
    type: json["type"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "type": type,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String id;
  String title;
  dynamic description;
  DateTime publishedAt;
  DateTime lastCollectedAt;
  DateTime updatedAt;
  bool featured;
  int totalPhotos;
  bool private;
  String shareKey;
  List<ResultTag> tags;
  ResultLinks links;
  User user;
  ResultCoverPhoto coverPhoto;
  List<PreviewPhoto> previewPhotos;

  Result({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.lastCollectedAt,
    required this.updatedAt,
    required this.featured,
    required this.totalPhotos,
    required this.private,
    required this.shareKey,
    required this.tags,
    required this.links,
    required this.user,
    required this.coverPhoto,
    required this.previewPhotos,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    publishedAt: DateTime.parse(json["published_at"]),
    lastCollectedAt: DateTime.parse(json["last_collected_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    featured: json["featured"],
    totalPhotos: json["total_photos"],
    private: json["private"],
    shareKey: json["share_key"],
    tags: List<ResultTag>.from(json["tags"].map((x) => ResultTag.fromJson(x))),
    links: ResultLinks.fromJson(json["links"]),
    user: User.fromJson(json["user"]),
    coverPhoto: ResultCoverPhoto.fromJson(json["cover_photo"]),
    previewPhotos: List<PreviewPhoto>.from(json["preview_photos"].map((x) => PreviewPhoto.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "published_at": publishedAt.toIso8601String(),
    "last_collected_at": lastCollectedAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "featured": featured,
    "total_photos": totalPhotos,
    "private": private,
    "share_key": shareKey,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "links": links.toJson(),
    "user": user.toJson(),
    "cover_photo": coverPhoto.toJson(),
    "preview_photos": List<dynamic>.from(previewPhotos.map((x) => x.toJson())),
  };
}

class ResultCoverPhoto {
  String id;
  String slug;
  AlternativeSlugs alternativeSlugs;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  List<dynamic> breadcrumbs;
  Urls urls;
  DetailsPhotoLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  PurpleTopicSubmissions topicSubmissions;
  String assetType;
  User user;

  ResultCoverPhoto({
    required this.id,
    required this.slug,
    required this.alternativeSlugs,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.assetType,
    required this.user,
  });

  factory ResultCoverPhoto.fromJson(Map<String, dynamic> json) => ResultCoverPhoto(
    id: json["id"],
    slug: json["slug"],
    alternativeSlugs: AlternativeSlugs.fromJson(json["alternative_slugs"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"],
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
    urls: Urls.fromJson(json["urls"]),
    links: DetailsPhotoLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: PurpleTopicSubmissions.fromJson(json["topic_submissions"]),
    assetType: json["asset_type"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "alternative_slugs": alternativeSlugs.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt,
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
    "urls": urls.toJson(),
    "links": links.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions.toJson(),
    "asset_type": assetType,
    "user": user.toJson(),
  };
}

class PurpleTopicSubmissions {
  BusinessWork? businessWork;

  PurpleTopicSubmissions({
    this.businessWork,
  });

  factory PurpleTopicSubmissions.fromJson(Map<String, dynamic> json) => PurpleTopicSubmissions(
    businessWork: json["business-work"] == null ? null : BusinessWork.fromJson(json["business-work"]),
  );

  Map<String, dynamic> toJson() => {
    "business-work": businessWork?.toJson(),
  };
}

class BusinessWork {
  Status status;
  DateTime approvedOn;

  BusinessWork({
    required this.status,
    required this.approvedOn,
  });

  factory BusinessWork.fromJson(Map<String, dynamic> json) => BusinessWork(
    status: statusValues.map[json["status"]]!,
    approvedOn: DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": statusValues.reverse[status],
    "approved_on": approvedOn.toIso8601String(),
  };
}

enum Status {
  APPROVED
}

final statusValues = EnumValues({
  "approved": Status.APPROVED
});

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
  // DateTime updatedAt;
  // String username;
  String name;
  // String firstName;
  // String? lastName;
  // String? twitterUsername;
  // String? portfolioUrl;
  // String? bio;
  // String? location;
  // UserLinks links;
  ProfileImage profileImage;
  // String? instagramUsername;
  // int totalCollections;
  // int totalLikes;
  // int totalPhotos;
  // int totalPromotedPhotos;
  // int totalIllustrations;
  // int totalPromotedIllustrations;
  // bool acceptedTos;
  // bool forHire;
  // Social social;

  User({
    required this.id,
    // required this.updatedAt,
    // required this.username,
    required this.name,
    // required this.firstName,
    // required this.lastName,
    // required this.twitterUsername,
    // required this.portfolioUrl,
    // required this.bio,
    // required this.location,
    // required this.links,
    required this.profileImage,
    // required this.instagramUsername,
    // required this.totalCollections,
    // required this.totalLikes,
    // required this.totalPhotos,
    // required this.totalPromotedPhotos,
    // required this.totalIllustrations,
    // required this.totalPromotedIllustrations,
    // required this.acceptedTos,
    // required this.forHire,
    // required this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    // updatedAt: DateTime.parse(json["updated_at"]),
    // username: json["username"],
    name: json["name"],
    // firstName: json["first_name"],
    // lastName: json["last_name"],
    // twitterUsername: json["twitter_username"],
    // portfolioUrl: json["portfolio_url"],
    // bio: json["bio"],
    // location: json["location"],
    // links: UserLinks.fromJson(json["links"]),
    profileImage: ProfileImage.fromJson(json["profile_image"]),
    // instagramUsername: json["instagram_username"],
    // totalCollections: json["total_collections"],
    // totalLikes: json["total_likes"],
    // totalPhotos: json["total_photos"],
    // totalPromotedPhotos: json["total_promoted_photos"],
    // totalIllustrations: json["total_illustrations"],
    // totalPromotedIllustrations: json["total_promoted_illustrations"],
    // acceptedTos: json["accepted_tos"],
    // forHire: json["for_hire"],
    // social: Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "updated_at": updatedAt.toIso8601String(),
    // "username": username,
    "name": name,
    // "first_name": firstName,
    // "last_name": lastName,
    // "twitter_username": twitterUsername,
    // "portfolio_url": portfolioUrl,
    // "bio": bio,
    // "location": location,
    // "links": links.toJson(),
    "profile_image": profileImage.toJson(),
    // "instagram_username": instagramUsername,
    // "total_collections": totalCollections,
    // "total_likes": totalLikes,
    // "total_photos": totalPhotos,
    // "total_promoted_photos": totalPromotedPhotos,
    // "total_illustrations": totalIllustrations,
    // "total_promoted_illustrations": totalPromotedIllustrations,
    // "accepted_tos": acceptedTos,
    // "for_hire": forHire,
    // "social": social.toJson(),
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
  String? instagramUsername;
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

class ResultLinks {
  String self;
  String html;
  String photos;
  String related;

  ResultLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.related,
  });

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    related: json["related"],
  );

  Map<String, dynamic> toJson() => {
    "self": self,
    "html": html,
    "photos": photos,
    "related": related,
  };
}

class PreviewPhoto {
  String id;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  String blurHash;
  String assetType;
  Urls urls;

  PreviewPhoto({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.blurHash,
    required this.assetType,
    required this.urls,
  });

  factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
    id: json["id"],
    slug: json["slug"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    blurHash: json["blur_hash"],
    assetType: json["asset_type"],
    urls: Urls.fromJson(json["urls"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "blur_hash": blurHash,
    "asset_type": assetType,
    "urls": urls.toJson(),
  };
}

class ResultTag {
  Type type;
  String title;
  PurpleSource? source;

  ResultTag({
    required this.type,
    required this.title,
    this.source,
  });

  factory ResultTag.fromJson(Map<String, dynamic> json) => ResultTag(
    type: typeValues.map[json["type"]]!,
    title: json["title"],
    source: json["source"] == null ? null : PurpleSource.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "title": title,
    "source": source?.toJson(),
  };
}

class PurpleSource {
  Ancestry ancestry;
  String title;
  String subtitle;
  String description;
  String metaTitle;
  String metaDescription;
  PurpleCoverPhoto coverPhoto;
  dynamic affiliateSearchQuery;

  PurpleSource({
    required this.ancestry,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.coverPhoto,
    required this.affiliateSearchQuery,
  });

  factory PurpleSource.fromJson(Map<String, dynamic> json) => PurpleSource(
    ancestry: Ancestry.fromJson(json["ancestry"]),
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    coverPhoto: PurpleCoverPhoto.fromJson(json["cover_photo"]),
    affiliateSearchQuery: json["affiliate_search_query"],
  );

  Map<String, dynamic> toJson() => {
    "ancestry": ancestry.toJson(),
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "cover_photo": coverPhoto.toJson(),
    "affiliate_search_query": affiliateSearchQuery,
  };
}

class Ancestry {
  Category type;
  Category category;
  Category? subcategory;

  Ancestry({
    required this.type,
    required this.category,
    this.subcategory,
  });

  factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
    type: Category.fromJson(json["type"]),
    category: Category.fromJson(json["category"]),
    subcategory: json["subcategory"] == null ? null : Category.fromJson(json["subcategory"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type.toJson(),
    "category": category.toJson(),
    "subcategory": subcategory?.toJson(),
  };
}

class Category {
  String slug;
  String prettySlug;

  Category({
    required this.slug,
    required this.prettySlug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    slug: json["slug"],
    prettySlug: json["pretty_slug"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "pretty_slug": prettySlug,
  };
}

class PurpleCoverPhoto {
  String id;
  String slug;
  AlternativeSlugs alternativeSlugs;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  List<Breadcrumb> breadcrumbs;
  Urls urls;
  DetailsPhotoLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  FluffyTopicSubmissions topicSubmissions;
  String assetType;
  bool? premium;
  bool? plus;
  User user;

  PurpleCoverPhoto({
    required this.id,
    required this.slug,
    required this.alternativeSlugs,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.assetType,
    this.premium,
    this.plus,
    required this.user,
  });

  factory PurpleCoverPhoto.fromJson(Map<String, dynamic> json) => PurpleCoverPhoto(
    id: json["id"],
    slug: json["slug"],
    alternativeSlugs: AlternativeSlugs.fromJson(json["alternative_slugs"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    breadcrumbs: List<Breadcrumb>.from(json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
    urls: Urls.fromJson(json["urls"]),
    links: DetailsPhotoLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: FluffyTopicSubmissions.fromJson(json["topic_submissions"]),
    assetType: json["asset_type"],
    premium: json["premium"],
    plus: json["plus"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "alternative_slugs": alternativeSlugs.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x.toJson())),
    "urls": urls.toJson(),
    "links": links.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions.toJson(),
    "asset_type": assetType,
    "premium": premium,
    "plus": plus,
    "user": user.toJson(),
  };
}

class Breadcrumb {
  String slug;
  String title;
  int index;
  Type type;

  Breadcrumb({
    required this.slug,
    required this.title,
    required this.index,
    required this.type,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
    slug: json["slug"],
    title: json["title"],
    index: json["index"],
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "title": title,
    "index": index,
    "type": typeValues.reverse[type],
  };
}

enum Type {
  LANDING_PAGE,
  SEARCH
}

final typeValues = EnumValues({
  "landing_page": Type.LANDING_PAGE,
  "search": Type.SEARCH
});

class FluffyTopicSubmissions {
  BusinessWork? wallpapers;
  BusinessWork? currentEvents;
  BusinessWork? people;
  BusinessWork? architectureInterior;

  FluffyTopicSubmissions({
    this.wallpapers,
    this.currentEvents,
    this.people,
    this.architectureInterior,
  });

  factory FluffyTopicSubmissions.fromJson(Map<String, dynamic> json) => FluffyTopicSubmissions(
    wallpapers: json["wallpapers"] == null ? null : BusinessWork.fromJson(json["wallpapers"]),
    currentEvents: json["current-events"] == null ? null : BusinessWork.fromJson(json["current-events"]),
    people: json["people"] == null ? null : BusinessWork.fromJson(json["people"]),
    architectureInterior: json["architecture-interior"] == null ? null : BusinessWork.fromJson(json["architecture-interior"]),
  );

  Map<String, dynamic> toJson() => {
    "wallpapers": wallpapers?.toJson(),
    "current-events": currentEvents?.toJson(),
    "people": people?.toJson(),
    "architecture-interior": architectureInterior?.toJson(),
  };
}

class Sponsorship {
  List<String> impressionUrls;
  String tagline;
  String taglineUrl;
  User sponsor;

  Sponsorship({
    required this.impressionUrls,
    required this.tagline,
    required this.taglineUrl,
    required this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
    impressionUrls: List<String>.from(json["impression_urls"].map((x) => x)),
    tagline: json["tagline"],
    taglineUrl: json["tagline_url"],
    sponsor: User.fromJson(json["sponsor"]),
  );

  Map<String, dynamic> toJson() => {
    "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
    "tagline": tagline,
    "tagline_url": taglineUrl,
    "sponsor": sponsor.toJson(),
  };
}

class DetailsPhotoTag {
  Type type;
  String title;
  FluffySource? source;

  DetailsPhotoTag({
    required this.type,
    required this.title,
    this.source,
  });

  factory DetailsPhotoTag.fromJson(Map<String, dynamic> json) => DetailsPhotoTag(
    type: typeValues.map[json["type"]]!,
    title: json["title"],
    source: json["source"] == null ? null : FluffySource.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "title": title,
    "source": source?.toJson(),
  };
}

class FluffySource {
  Ancestry ancestry;
  String title;
  String subtitle;
  String description;
  String metaTitle;
  String metaDescription;
  FluffyCoverPhoto coverPhoto;
  dynamic affiliateSearchQuery;

  FluffySource({
    required this.ancestry,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.metaTitle,
    required this.metaDescription,
    required this.coverPhoto,
    required this.affiliateSearchQuery,
  });

  factory FluffySource.fromJson(Map<String, dynamic> json) => FluffySource(
    ancestry: Ancestry.fromJson(json["ancestry"]),
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    coverPhoto: FluffyCoverPhoto.fromJson(json["cover_photo"]),
    affiliateSearchQuery: json["affiliate_search_query"],
  );

  Map<String, dynamic> toJson() => {
    "ancestry": ancestry.toJson(),
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "cover_photo": coverPhoto.toJson(),
    "affiliate_search_query": affiliateSearchQuery,
  };
}

class FluffyCoverPhoto {
  String id;
  String slug;
  AlternativeSlugs alternativeSlugs;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String? description;
  String altDescription;
  List<Breadcrumb> breadcrumbs;
  Urls urls;
  DetailsPhotoLinks links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  TentacledTopicSubmissions topicSubmissions;
  String assetType;
  bool premium;
  bool plus;
  User user;

  FluffyCoverPhoto({
    required this.id,
    required this.slug,
    required this.alternativeSlugs,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.assetType,
    required this.premium,
    required this.plus,
    required this.user,
  });

  factory FluffyCoverPhoto.fromJson(Map<String, dynamic> json) => FluffyCoverPhoto(
    id: json["id"],
    slug: json["slug"],
    alternativeSlugs: AlternativeSlugs.fromJson(json["alternative_slugs"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    blurHash: json["blur_hash"],
    description: json["description"],
    altDescription: json["alt_description"],
    breadcrumbs: List<Breadcrumb>.from(json["breadcrumbs"].map((x) => Breadcrumb.fromJson(x))),
    urls: Urls.fromJson(json["urls"]),
    links: DetailsPhotoLinks.fromJson(json["links"]),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    topicSubmissions: TentacledTopicSubmissions.fromJson(json["topic_submissions"]),
    assetType: json["asset_type"],
    premium: json["premium"],
    plus: json["plus"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "alternative_slugs": alternativeSlugs.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt?.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "blur_hash": blurHash,
    "description": description,
    "alt_description": altDescription,
    "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x.toJson())),
    "urls": urls.toJson(),
    "links": links.toJson(),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "topic_submissions": topicSubmissions.toJson(),
    "asset_type": assetType,
    "premium": premium,
    "plus": plus,
    "user": user.toJson(),
  };
}

class TentacledTopicSubmissions {
  BusinessWork? texturesPatterns;
  BusinessWork? wallpapers;
  BusinessWork? architectureInterior;

  TentacledTopicSubmissions({
    this.texturesPatterns,
    this.wallpapers,
    this.architectureInterior,
  });

  factory TentacledTopicSubmissions.fromJson(Map<String, dynamic> json) => TentacledTopicSubmissions(
    texturesPatterns: json["textures-patterns"] == null ? null : BusinessWork.fromJson(json["textures-patterns"]),
    wallpapers: json["wallpapers"] == null ? null : BusinessWork.fromJson(json["wallpapers"]),
    architectureInterior: json["architecture-interior"] == null ? null : BusinessWork.fromJson(json["architecture-interior"]),
  );

  Map<String, dynamic> toJson() => {
    "textures-patterns": texturesPatterns?.toJson(),
    "wallpapers": wallpapers?.toJson(),
    "architecture-interior": architectureInterior?.toJson(),
  };
}

class DetailsPhotoTopicSubmissions {
  DetailsPhotoTopicSubmissions();

  factory DetailsPhotoTopicSubmissions.fromJson(Map<String, dynamic> json) => DetailsPhotoTopicSubmissions(
  );

  Map<String, dynamic> toJson() => {
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
