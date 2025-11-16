import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/Domain/UseCases/Fetch_SearchedBooks_UseCase.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:meta/meta.dart';

part 'fetch_searched_books_state.dart';



class FetchSearchedBooksCubit extends Cubit<FetchSearchedBooksState> {
  FetchSearchedBooksCubit(this.FetchSearchedBooksUseCase) : super(FetchSearchedBooksInitial());
  String? currentQuery;
  int currentPage = 0;
  List<BookEntity> allBooks = [];
  final Fetch_SeachedBooks_UseCase FetchSearchedBooksUseCase;

  Future<void>FetchSeachedBooks({String? SearchQuery,int pagenumber=0})async{
    if (pagenumber == 0) {
      currentQuery = SearchQuery;
      currentPage = 0;
      emit(SearchedBooksLoading());
    } else {
      emit(SearchedBooksStatePaginationLoading());
    }

    var books=await FetchSearchedBooksUseCase.Call(SearchQuery!,pagenumber);
    books.fold((failure){
      if(pagenumber==0) {
        emit(SearchedBooksFailure(failure.message));
      }else{
        emit(SearchedBooksPaginationFailure(failure.message));
      }
    }, (books){
      if(pagenumber!=0){
        emit(SearchedBooksPginationSuccess(books));
        currentPage = pagenumber;
      }
      emit(SearchedBooksSuccess(books));

    });

  }

}
