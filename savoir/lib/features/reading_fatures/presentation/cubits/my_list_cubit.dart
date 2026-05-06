import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:savoir/features/reading_fatures/data/models/my_list_model.dart';
import 'package:savoir/features/reading_fatures/data/services/data_source/mylist_keeper.dart';
import 'package:savoir/features/reading_fatures/presentation/cubits/my_list_states.dart';

class MyListCubit extends Cubit<MyListState> {
  MyListCubit() : super(MyListInitialState());

  final box = MylistKeeper.myListBox;

  Future<void> addBooks({
    required MyListModel book,
    required String category,
  }) async {
    try {
      emit(MyListLoadingState());

      final newBook = MyListModel(
        id: book.id,
        title: book.title,
        author: book.author,
        image: book.image,
        category: category,
      );

      await box.put(book.id, newBook);

      emit(MyListSuccessState());
    } catch (element) {
      emit(MyListFailureState(element.toString()));
    }
  }
}