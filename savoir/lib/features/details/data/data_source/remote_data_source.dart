// features/details/data/data_source/remote_data_source.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:savoir/error_handler.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';
import 'package:savoir/features/home/data/models/books_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  final String apiKey = 'e78d951b9548409d850c584f45bac680';

  Future<BookDetailsModel> getBookById({required int bookId}) async {
    try {
      final Response response = await dio.get(
        'https://api.bigbookapi.com/$bookId',
        queryParameters: {'api-key': apiKey},
      );

      final data = response.data;

      List<String> authorsNames = [];
      if (data['authors'] != null) {
        for (var author in data['authors']) {
          authorsNames.add(author['name'].toString());
        }
      }
      final BookDetailsModel book = BookDetailsModel.fromJson(
        data,
        authorsNames,
      );
      log("Book Loaded: ${book.title}");
      return book;
    } on Exception catch (e) {
      log("Dio Error: ${e}");
      throw ErrorHandler.handle(e).failure.message;
    }
  }

  Future<List<BooksModel>> getSimilarBooks({required int id}) async {
    try {
      List<BooksModel> similarBooks = [];
      final response = await dio.get(
        'https://api.bigbookapi.com/$id/similar',
        queryParameters: {'api-key': apiKey},
      );

      for (var element in response.data["similar_books"]) {
        BooksModel book = BooksModel.getfromjson(element);
        similarBooks.add(book);
      }
      return similarBooks;
    } on DioException catch (e) {
      log("Error: ${e.response?.data}");
      throw ErrorHandler.handle(e).failure.message;
    } on Exception catch (e) {
      log("Error: $e");
      throw ErrorHandler.handle(e).failure.message;
    }
  }
}
