import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:unsplash/models/details_photo_model.dart';
import 'package:unsplash/models/search/search_photo_model.dart';

import '../models/collection_model.dart';
import '../models/collections_photo_model.dart';
import '../models/photo_model.dart';
import '../models/search/search_collection_model.dart';
import 'http_helper.dart';

class Network {
  static bool isTester = true;
  static String SERVER_DEV = "api.unsplash.com";
  static String SERVER_PROD = "api.unsplash.com";

  static final client = InterceptedClient.build(
    interceptors: [HttpInterceptor()],
    retryPolicy: HttpRetryPolicy(),
  );

  static String getServer() {
    if (isTester) return SERVER_DEV;
    return SERVER_PROD;
  }

  /* Http Requests */
  static Future<String?> GET(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(getServer(), api, params);
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(getServer(), api, params);
      var response = await client.post(uri, body: jsonEncode(params));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(getServer(), api, params);
      var response = await client.put(uri, body: jsonEncode(params));
      if (response.statusCode == 200 || response.statusCode == 204) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(getServer(), api, params);
      var response = await client.delete(uri);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      // if the network connection fails
      rethrow;
    }
  }

  static _throwException(Response response) {
    String reason = response.reasonPhrase!;
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(reason);
      case 401:
        throw InvalidInputException(reason);
      case 403:
        throw UnauthorisedException(reason);
      case 404:
        throw FetchDataException(reason);
      case 500:
      default:
        throw FetchDataException(reason);
    }
  }

  /* Http Apis*/
  static String API_PHOTO = "/photos/:id";
  static String API_PHOTOS = "/photos";
  static String API_COLLECTIONS = "/collections";
  static String API_COLLECTIONS_PHOTOS = "/collections/:id/photos";
  static String API_SEARCH_PHOTOS = "/search/photos";
  static String API_SEARCH_COLLECTIONS = "/search/collections";

  /* Http Params */
  static Map<String, String> paramsPhotos(int currentPage) {
    Map<String, String> params = {};
    params.addAll({
      'page': currentPage.toString(),
      'per_page': '10',
      'order_by': 'latest',
      'client_id': HttpInterceptor.CLIENT_ID
    });
    return params;
  }

  static Map<String, String> paramsSearching(String query, int currentPage) {
    Map<String, String> params = {};
    params.addAll({
      'query': query,
      'page': currentPage.toString(),
      'per_page': '10',
      'client_id': HttpInterceptor.CLIENT_ID
    });
    return params;
  }

  static Map<String, String> paramsCollections(int currentPage) {
    Map<String, String> params = {};
    params.addAll({
      'page': currentPage.toString(),
      'per_page': '10',
      'client_id': HttpInterceptor.CLIENT_ID
    });
    return params;
  }

  static Map<String, String> paramsCollectionsPhotos(int currentPage) {
    Map<String, String> params = {};
    params.addAll({
      'page': currentPage.toString(),
      'per_page': '10',
      'client_id': HttpInterceptor.CLIENT_ID
    });
    return params;
  }

  static Map<String, String> paramsPhoto() {
    Map<String, String> params = {};
    params.addAll({'client_id': HttpInterceptor.CLIENT_ID});
    return params;
  }

  /* Http Parsing */

  static DetailsPhoto? parseDetailsPhoto(String? response) {
    if (response == null || response.isEmpty) {
      return null; // Safely return null if the response is empty or null
    }
    dynamic json = jsonDecode(response);
    return DetailsPhoto.fromJson(json);
  }

  static List<Photo> parsePhotosList(String response) {
    dynamic json = jsonDecode(response);
    return List<Photo>.from(json.map((x) => Photo.fromJson(x)));
  }

  static List<Collection> parseCollections(String response) {
    dynamic json = jsonDecode(response);
    return List<Collection>.from(json.map((x) => Collection.fromJson(x)));
  }

  static List<SearchCollection> parseSearchCollections(String response) {
    dynamic json = jsonDecode(response);
    return List<SearchCollection>.from(json.map((x) => SearchCollection.fromJson(x)));
  }

  static List<CollectionsPhoto> parseCollectionsPhotos(String response) {
    dynamic json = jsonDecode(response);
    return List<CollectionsPhoto>.from(
        json.map((x) => CollectionsPhoto.fromJson(x)));
  }
}
