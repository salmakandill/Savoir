import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/home/data/data_source/remote_data_source_of_home.dart';
import 'package:savoir/features/home/data/models/books_model.dart';
import 'package:savoir/features/home/presentation/cubit/category_states.dart';
import 'package:savoir/features/home/presentation/cubit/home_states_recommended.dart';

class CategoryBooksCubit extends Cubit<HomeGenresStates> {
  final RemoteDataSourceOfHome homeRemoteDataSource = RemoteDataSourceOfHome();

  CategoryBooksCubit() : super(HomeGenresInitialState());

  Future<void> getCategoryList({required String category}) async {
    log(" Fetching books for category: $category");
    emit(CategoryBooksLoadingState());
    try {
      final books = await RemoteDataSourceOfHome.getCategoryList(
        category: category,
      );
      emit(CategoryBooksSuccessState(books));
    } catch (error) {
      emit(CategoryBooksFailureState(error.toString()));
    }
  }
}
