import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/Domain/UseCases/Fetch_SimilarBooks_UseCaSE.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:meta/meta.dart';

part 'fetch_similar_state.dart';

class FetchSimilarCubit extends Cubit<FetchSimilarState> {
  FetchSimilarCubit(this.FetchSimilarBooks) : super(FetchSimilarInitial());
  final FetchSimilarBooks_Use_Case FetchSimilarBooks;

  Future <void>FetchSimilarBooksCubit({required String category,required String intitle})async{
    emit(FetchSimilarLoading());
    final result=await FetchSimilarBooks.Call(category,intitle);
    result.fold((failure) {
      emit(SimilarBooksStateFailure(failure.message));
    }, (books) {
      emit(SimilarBooksStateSuccess(books));
    },);



  }
}
