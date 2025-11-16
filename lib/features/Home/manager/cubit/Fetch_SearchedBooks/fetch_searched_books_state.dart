part of 'fetch_searched_books_cubit.dart';

@immutable
sealed class FetchSearchedBooksState {}
class FetchSearchedBooksInitial extends FetchSearchedBooksState{}
class SearchedBooksLoading extends FetchSearchedBooksState{}
class SearchedBooksSuccess extends FetchSearchedBooksState{
  final List<BookEntity>books;

  SearchedBooksSuccess(this.books);
}

class SearchedBooksStatePaginationLoading extends FetchSearchedBooksState{}

class SearchedBooksPginationSuccess extends FetchSearchedBooksState{
  final List<BookEntity>books;

  SearchedBooksPginationSuccess(this.books);
}
class SearchedBooksFailure extends FetchSearchedBooksState{
  final errmessage;

  SearchedBooksFailure(this.errmessage);
}
class SearchedBooksPaginationFailure extends FetchSearchedBooksState{
  final errmessage;

  SearchedBooksPaginationFailure(this.errmessage);
}