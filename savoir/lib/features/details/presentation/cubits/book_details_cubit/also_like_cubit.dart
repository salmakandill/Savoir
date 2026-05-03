import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savoir/features/details/data/data_source/remote_data_source.dart';
import 'package:savoir/features/details/presentation/cubits/book_details_cubit/also_like_cubit_status.dart';

class AlsoLikeCubit extends Cubit<SimilarBooksState> {
  AlsoLikeCubit() : super(SimilarInitialBooks());

  RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<void> getSimilarBooks({required int id}) async {
    emit(SimilarLoadingBooks());
    await remoteDataSource
        .getSimilarBooks(id: id)
        .then(
          (val) {
            emit(SimilarSuccessBooks(books: val));
          },
          onError: (error) {
            emit(SimilarFailureBooks(errMessage: error.toString()));
          },
        );
  }
}
