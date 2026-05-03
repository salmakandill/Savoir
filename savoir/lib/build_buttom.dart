import 'package:flutter/material.dart';
import 'package:savoir/features/details/presentation/screens/reading_screen.dart';
import 'package:savoir/features/reading_fatures/Data/services/book_api_service.dart';
import 'package:savoir/features/reading_fatures/Data/models/book_model.dart';

class Buttomwidget extends StatelessWidget {
  const Buttomwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final apiService = BookApiService();

        final book = BookModel(
          id: "123",
          title: "Test Book Title",
          author: "Test Author Name",
          listType: "reading",
        );

        bool success = await apiService.addBookToReadingList(
          book,
          "3",
          "YOUR_GOOGLE_AUTH_TOKEN_HERE",
        );

        if (context.mounted) {
          if (success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Book added successfully")),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReadingScreen()),
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Failed to add book")));
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff8D4F1D),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: const Text(
        "Read Now",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
