import 'package:bookly_app/core/Errors/Failure.dart';
import 'package:bookly_app/features/Home/Domain/Repo/HomeRepo.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/data/Home_LocalData/HomeLocalData.dart';
import 'package:bookly_app/features/Home/data/Home_RemoteData/HomeRemoteData.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class HomeRepoImplementaion extends HomeRepo {
  final HomeRemoteData homeRemoteData;
  final HomeLocalData homeLocalData;

  HomeRepoImplementaion(
      {required this.homeRemoteData, required this.homeLocalData});

  @override
  Future<Either<Failure, List<BookEntity>>> FetchFeaturedBooks(
      {int pagenumber = 0, String category = "general"}) async {
    try {
      List<BookEntity>books;
      books = homeLocalData.FetchfeaturedBooks(pagenumber: pagenumber);
      if (books.isNotEmpty) {
        return Right(books);
      }

      books = await homeRemoteData.FetchFeaturedBooks(pagenumber: pagenumber,);
      return Right(books);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDio(dioError));
    } on HiveError catch (cacheError) {
      return Left(CacheFailure("Cache Error: ${cacheError.message}"));
    } catch (e) {
      return Left(UnknownFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> FetchNewstBooks(
      {int pagenumber = 0}) async {
    try {
      List<BookEntity>books;
      books = homeLocalData.FetchNewstBooks(pagenumber: pagenumber);
      if (books.isNotEmpty) {
        return Right(books);
      }

      books = await homeRemoteData.FetchNewstBooks(pagenumber: pagenumber);
      return Right(books);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDio(dioError));
    } on HiveError catch (cacheError) {
      return Left(CacheFailure("Cache Error: ${cacheError.message}"));
    } catch (e) {
      return Left(UnknownFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> FetchSimilarBooks(
      {String? category, String? intitle}) async {
    try {
      final books = await homeRemoteData.FetchSimilarBooks(
          category: category!, intitle: intitle!);
      return Right(books);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDio(dioError));
    } on HiveError catch (cacheError) {
      return Left(CacheFailure("Cache Error: ${cacheError.message}"));
    } catch (e) {
      return Left(UnknownFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> FetchSearchedBooks({String? searchQuery, int startindex = 0}) async{
    try {
      List<BookEntity>books;
      // books = homeLocalData.FetchSearchedBooks(pagenumber: startindex);
      // if (books.isNotEmpty) {
      //   return Right(books);
      // }

      books = await homeRemoteData.FetchSearchedBooks(SearchQuery: searchQuery!,pagenumber: startindex);
      return Right(books);
    } on DioException catch (dioError) {
      return Left(ServerFailure.fromDio(dioError));
    } on HiveError catch (cacheError) {
      return Left(CacheFailure("Cache Error: ${cacheError.message}"));
    } catch (e) {
      return Left(UnknownFailure("Unexpected Error: $e"));
    }
  }


}
