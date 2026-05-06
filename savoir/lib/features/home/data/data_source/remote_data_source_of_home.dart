// features/home/data/data_source/remote_data_source_of_home.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:savoir/error_handler.dart';
import 'package:savoir/features/home/data/models/books_model.dart';
import 'package:savoir/features/home/data/models/category_model.dart';

class RemoteDataSourceOfHome {
  static final Dio dio = Dio();
  static final String apiKey = 'e78d951b9548409d850c584f45bac680';
  static Future<List<BooksModel>> getBooks() async {
    try {
      final response = await dio.get(
        'https://api.bigbookapi.com/search-books',
        queryParameters: {'query': 'fiction', 'api-key': apiKey, 'number': 100},
      );
      final List booksList = response.data['books'];
      List<BooksModel> books = [];
      for (var element in booksList) {
        final BooksModel book = BooksModel.getfromjson(
          Map<String, dynamic>.from(element[0]),
        );
        books.add(book);
      }
      log(books.length.toString());
      return books;
    } on Exception catch (e) {
      throw ErrorHandler.handle(e).failure.message;
    }
  }

  static Future<List<String>> getAllGenres() async {
    return _fallbackGenres();
  }

  static Future<List<BooksModel>> getCategoryList({
    required String category,
  }) async {
    try {
      List<BooksModel> categoryList = [];
      final response = await dio.get(
        'https://api.bigbookapi.com/search-books',
        queryParameters: {
          'api-key': apiKey,
          'categories': category,
          'number': 20,
        },
      );

      for (var element in response.data["books"]) {
        BooksModel book = BooksModel.getfromjson(element);
        categoryList.add(book);
      }
      return categoryList;
    } on DioException catch (e) {
      log("Error: ${e.response?.data}");
      throw ErrorHandler.handle(e).failure.message;
    } on Exception catch (e) {
      log("Error: $e");
      throw ErrorHandler.handle(e).failure.message;
    }
  }

  static List<String> _fallbackGenres() {
    return [
      'action',
      'adventure',
      'anthropology',
      'astronomy',
      'archaeology',
      'architecture',
      'art',
      'aviation',
      'biography',
      'biology',
      'business',
      'chemistry',
      'children',
      'classics',
      'contemporary',
      'cookbook',
      'folklore',
      'food',
      'gaming',
      'gardening',
      'geography',
      'geology',
      'graphic_novel',
      'health',
      'historical',
      'historical_fiction',
      'history',
      'horror',
      'how_to',
      'humor',
      'inspirational',
      'journalism',
      'occult',
      'paranormal',
      'parenting',
      'philosophy',
      'physics',
      'picture_book',
      'poetry',
      'politics',
      'programming',
      'psychology',
      'reference',
      'relationships',
      'religion',
      'romance',
      'science_and_technology',
      'science_fiction',
    ];
  }
}
