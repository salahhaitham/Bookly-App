part of 'fetch_similar_cubit.dart';

@immutable
sealed class FetchSimilarState {}

final class FetchSimilarInitial extends FetchSimilarState {}
class FetchSimilarLoading extends FetchSimilarState{}
class SimilarBooksStateSuccess extends FetchSimilarState{
final List<BookEntity>books;

SimilarBooksStateSuccess(this.books);
}
class SimilarBooksStateFailure extends FetchSimilarState{
final errmessage;

SimilarBooksStateFailure(this.errmessage);
}