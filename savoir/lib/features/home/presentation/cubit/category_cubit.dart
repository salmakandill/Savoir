import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/home/data/data_source/remote_data_source_of_home.dart';
import 'package:savoir/features/home/presentation/cubit/category_states.dart';

class HomeGenresCubit extends Cubit<HomeGenresStates> {
  HomeGenresCubit() : super(HomeGenresInitialState());

  void fetchAllGenres() async {
    emit(HomeGenresLoadingState());
    try {
      final genres = await RemoteDataSourceOfHome.getAllGenres();
      emit(HomeGenresSuccessState(genres));
    } catch (error) {
      emit(HomeGenresFailureState(error.toString()));
    }
  }
}
