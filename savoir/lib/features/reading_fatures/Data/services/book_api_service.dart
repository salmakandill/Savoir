import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class BookApiService {
  final String baseUrl =
      'https://www.googleapis.com/books/v1/mylibrary/bookshelves';

  Future<bool> addBookToReadingList(
    BookModel book,
    String shelfId,
    String userAuthToken,
  ) async {
    try {
      final Uri url = Uri.parse(
        '$baseUrl/$shelfId/addVolume?volumeId=${book.id}',
      );

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',

          'Authorization': 'Bearer $userAuthToken',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print("Book added successfully to Google Books!");
        return true;
      } else {
        print('API error: ${response.statusCode}');
        print('Error details: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Network error: $e');
      return false;
    }
  }
}
