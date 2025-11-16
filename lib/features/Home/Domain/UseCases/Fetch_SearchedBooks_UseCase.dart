import 'package:bookly_app/core/Errors/Failure.dart';
import 'package:bookly_app/features/Home/Domain/Repo/HomeRepo.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:dartz/dartz.dart';

class Fetch_SeachedBooks_UseCase extends UseCase<List<BookEntity>,String,int>{
  final HomeRepo homeRepo;

  Fetch_SeachedBooks_UseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> Call(String SearchQuery, int startindex) async {
    return await homeRepo.FetchSearchedBooks(searchQuery: SearchQuery,startindex: startindex);

  }









}
abstract class UseCase<type,params,param2>{
  Future<Either<Failure,type>>Call(params SearchQuery,param2 startindex);
}

class Param{

}
