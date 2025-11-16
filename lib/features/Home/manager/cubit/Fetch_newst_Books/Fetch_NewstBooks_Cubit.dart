import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/Domain/UseCases/Fetch_NewstBooks_UseCase.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_newst_Books/FetchNewstStates.dart';

class NewstBooksCubit extends Cubit<FetchNewstBooksStates>{
  NewstBooksCubit(this.fetchNewstBooks_Use_Case):super(NewstBooksStateInitial());

  final FetchNewstBooks_Use_Case fetchNewstBooks_Use_Case;




  Future<void> fetchNewstBooks({int pagenumber = 0}) async {
    if (pagenumber == 0) {
      emit(NewstBooksStateLoading());
    } else {
      emit(NewstBooksStatePaginationLoading());
    }

    final result = await fetchNewstBooks_Use_Case.Call(pagenumber);
    result.fold(
          (failure) {
        if (pagenumber == 0) {
          emit(NewstBooksStateFailure(failure.message));
        } else {
          emit(NewstBooksStatePaginationFailure(failure.message));
        }
      },
          (books) {
        emit(NewstBooksStateSuccess(books));
      },
    );
  }

}