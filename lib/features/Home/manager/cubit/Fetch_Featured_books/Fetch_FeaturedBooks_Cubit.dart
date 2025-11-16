
import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/Domain/UseCases/FetchFeaturedBooks_Use_Case.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/FeaturedBooksStates.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>{
  FeaturedBooksCubit(this.fetchFeaturedBooks_Use_Case):super(FeaturedBooksStateInitial());

  final FetchFeaturedBooks_Use_Case fetchFeaturedBooks_Use_Case;



  Future<void>FetchFeaturedBooks({int pagenumber=0})async{
    if(pagenumber==0) {
      emit(FeaturedBooksStateLoading());
    }else {
      emit(FeaturedBooksStatePaginationLoading());
    }
    var books=await fetchFeaturedBooks_Use_Case.Call(pagenumber);
    books.fold((failure){
      if(pagenumber==0) {
        emit(FeaturedBooksStateFailure(failure.message));
      }else{
        emit(FeaturedBooksStatePaginationFailure(failure.message));
      }
    }, (books){
      emit(FeaturedBooksStateSuccess(books));

    });

  }


}