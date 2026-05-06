import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:savoir/features/home/data/models/books_model.dart';

class RemoteDataSourceOfHome {
  static final Dio dio = Dio();
  static final String apiKey = 'e78d951b9548409d850c584f45bac680';
  static Future<List<BooksModel>> getBooks() async {
    try {
      final response = await dio.get(
        'https://api.bigbookapi.com/search-books',
        queryParameters: {'query': 'engineering', 'api-key': apiKey, 'number': 100},
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
      throw Exception('Failed to load books: $e');
    }
  }
}
