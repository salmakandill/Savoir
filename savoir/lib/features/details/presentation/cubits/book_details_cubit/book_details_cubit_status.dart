import 'package:savoir/features/details/data/models/book_details_model.dart';

abstract class DetailsStates {}

class DetailsInitialState extends DetailsStates {}

class DetailsLoadingState extends DetailsStates {}

class DetailsSuccessState extends DetailsStates {
  final BookDetailsModel book;
  DetailsSuccessState({required this.book});
}

class DetailsFailureState extends DetailsStates {
  final String errorMessage;
  DetailsFailureState({required this.errorMessage});

}
