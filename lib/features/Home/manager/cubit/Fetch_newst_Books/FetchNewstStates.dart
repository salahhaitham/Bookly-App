import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';

class FetchNewstBooksStates{}

class NewstBooksStateInitial extends FetchNewstBooksStates{}
class NewstBooksStateLoading extends FetchNewstBooksStates{}
class NewstBooksStatePaginationLoading extends FetchNewstBooksStates{}
class NewstBooksStateSuccess extends FetchNewstBooksStates{
  final List<BookEntity>books;

  NewstBooksStateSuccess(this.books);
}
class NewstBooksStatePaginationFailure extends FetchNewstBooksStates{
  final errmessage;

  NewstBooksStatePaginationFailure(this.errmessage);
}

class NewstBooksStateFailure extends FetchNewstBooksStates{
  final errmessage;

 NewstBooksStateFailure(this.errmessage);
}