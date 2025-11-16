import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/core/Errors/Failure.dart';
import 'package:dartz/dartz.dart';


abstract class HomeRepo {
  Future<Either<Failure,List<BookEntity>>>FetchFeaturedBooks({int pagenumber=0});
  Future<Either<Failure,List<BookEntity>>>FetchNewstBooks({int pagenumber=0});
  Future<Either<Failure,List<BookEntity>>>FetchSimilarBooks({String category,String intitle});
  Future<Either<Failure,List<BookEntity>>>FetchSearchedBooks({String searchQuery,int startindex=0});



}



