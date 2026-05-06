// features/home/data/data_source/remote_data_source_of_home.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:savoir/error_handler.dart';
import 'package:savoir/features/home/data/models/books_model.dart';

class RemoteDataSourceOfHome {
  static final Dio dio = Dio();
  static final String apiKey = '4bef8484869948d38f3e987a2c52f98c';
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
}
