import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/home/data/data_source/remote_data_source_of_home.dart';
import 'package:savoir/features/reading_fatures/data/models/book_history_model.dart';
import 'package:savoir/features/reading_fatures/data/services/data_source/history_keeper.dart';
import 'package:savoir/features/reading_fatures/presentation/cubits/history_states.dart';

class HistoryCubit extends Cubit<HistoryStates> {
  HistoryCubit() : super(IntialHistoryState());
  final RemoteDataSourceOfHome dataSource = RemoteDataSourceOfHome();
  Future<void> addedRecently(BookHistoryModel book) async {
    try {
      await HistoryKeeper.addBook(book);
      getHistory();
    } catch (error) {
      emit(FaluierHistoryState(error.toString()));
    }
  }

  Future<void> getHistory() async {
    emit(LoadingHistoryState());
    try {
      final books = HistoryKeeper.getHistory();
      emit(SuccessHistoryState(books));
    } on Exception catch (error) {
      emit(FaluierHistoryState(error.toString()));
    }
  }
}
