import 'package:bookly_app/core/Errors/Failure.dart';
import 'package:bookly_app/features/Home/Domain/Repo/HomeRepo.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:dartz/dartz.dart';

class FetchNewstBooks_Use_Case extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;

  FetchNewstBooks_Use_Case(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> Call([int pagenumber=0]) async{
    return await homeRepo.FetchNewstBooks(pagenumber: pagenumber);
  }





}
abstract class UseCase<type,params>{
  Future<Either<Failure,type>>Call(params params);
}

class Param{

}



// class FetchNewstBooks_Use_Case extends UseCase<List<BookEntity>,int>{
//   final HomeRepo homeRepo;
//
//   FetchNewstBooks_Use_Case(this.homeRepo);
//
//   @override
//   Future<Either<Failure, List<BookEntity>>> Call([int pagenumber=0]) async{
//     return await homeRepo.FetchNewstBooks(pagenumber: pagenumber);
//   }
//
//
//
//
//
// }
// abstract class UseCase<type,params>{
//   Future<Either<Failure,type>>Call(params params);
// }
//
// class Param{
//
// }