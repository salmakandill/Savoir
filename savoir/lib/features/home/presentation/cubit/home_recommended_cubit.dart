// features/home/presentation/cubit/home_recommended_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/home/data/data_source/remote_data_source_of_home.dart';
import 'package:savoir/features/home/presentation/cubit/home_states_recommended.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  void getBooks() async {
    emit(HomeLoadingState());
    try {
      final booksList = await RemoteDataSourceOfHome.getBooks();
      emit(HomeSuccessState(booksList));
    } catch (error) {
      emit(HomeFailureState(error.toString()));
    }
  }
}
