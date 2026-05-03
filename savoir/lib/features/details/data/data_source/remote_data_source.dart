import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:savoir/features/details/data/models/also_liked_books_model.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  final String apiKey = 'YOUR_API_KEY';

  Future<BookDetailsModel> getBookById({required int bookId}) async {
    try {
      final Response response = await dio.get(
        ' https://api.bigbookapi.com/$bookId',
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
    } on DioException catch (e) {
      log("Dio Error: ${e.response?.data}");
      throw Exception("Error: ${e.response?.data}");
    } catch (e) {
      log("General Error: $e");
      throw Exception("Error: $e");
    }
  }

  Future<List<AlsoLikedBooksModel>> getSimilarBooks({required int id}) async {
    try {
      List<AlsoLikedBooksModel> similarBooks = [];
      final response = await dio.get('https://api.bigbookapi.com/$id/similar');

      for (var element in response.data["similar_books"]) {
        AlsoLikedBooksModel book = AlsoLikedBooksModel.fromJson(element);
        similarBooks.add(book);
      }
      return similarBooks;
    } on DioException catch (e) {
      log("Error: ${e.response?.data}");
      throw Exception("Error: ${e.response?.data}");
    } on Exception catch (e) {
      log("Error: $e");
      throw Exception("Error: $e");
    }
  }

}
