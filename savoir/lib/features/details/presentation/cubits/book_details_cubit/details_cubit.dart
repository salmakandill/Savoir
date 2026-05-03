import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/details/data/data_source/remote_data_source.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/book_details_cubit_status.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  DetailsCubit() : super(DetailsInitialState());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getBookDetails({required int id}) async {
    emit(DetailsLoadingState());

    await remoteDataSource.getBookById(bookId: id).then(
      (bookData) {
        emit(DetailsSuccessState(book: bookData));
      },
      onError: (error) {
        emit(DetailsFailureState(errorMessage: error.toString()));
      },
    );
  }
}