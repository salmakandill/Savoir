import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/details/data/models/book_details_model.dart';
import 'package:savoir/features/details/presentation/screens/reading_screen.dart';
import 'package:savoir/features/home/data/models/books_model.dart';
import 'package:savoir/features/reading_fatures/data/models/book_history_model.dart';
import 'package:savoir/features/reading_fatures/data/services/data_source/history_keeper.dart';
import 'package:savoir/features/reading_fatures/presentation/cubits/history_cubit.dart';

class ReadNowButtomwidget extends StatelessWidget {
  const ReadNowButtomwidget({super.key, required this.books});
  final BookDetailsModel books;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final historyBook = BookHistoryModel(
          title: books.title??'unknown',
          author: books.authorname??'unknown',
          imageUrl: books.image??'',
          id: books.id,
        );
        await HistoryKeeper.addBook(historyBook);
        
        context.read<HistoryCubit>().addedRecently(historyBook);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReadingScreen()),
        );
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
