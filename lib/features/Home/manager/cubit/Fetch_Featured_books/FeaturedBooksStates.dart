import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';

class FeaturedBooksState{}
class FeaturedBooksStateInitial extends FeaturedBooksState{}
class FeaturedBooksStateLoading extends FeaturedBooksState{}
class FeaturedBooksSearchSuccess extends FeaturedBooksState{
  final List<BookEntity>books;

  FeaturedBooksSearchSuccess(this.books);
}

class FeaturedBooksStatePaginationLoading extends FeaturedBooksState{}

class FeaturedBooksStateSuccess extends FeaturedBooksState{
  final List<BookEntity>books;

  FeaturedBooksStateSuccess(this.books);
}
class FeaturedBooksStateFailure extends FeaturedBooksState{
  final errmessage;

  FeaturedBooksStateFailure(this.errmessage);
}
class FeaturedBooksStatePaginationFailure extends FeaturedBooksState{
  final errmessage;

  FeaturedBooksStatePaginationFailure(this.errmessage);
}