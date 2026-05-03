import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();
  final String _apiKey = 'YOUR_API_KEY';

  Future<BookDetailsModel> getBookById({required int bookId}) async {
    try {
      final Response response = await dio.get(
        'https://api.bigbookapi.com/$bookId',
        queryParameters: {'api-key': _apiKey},
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
}
