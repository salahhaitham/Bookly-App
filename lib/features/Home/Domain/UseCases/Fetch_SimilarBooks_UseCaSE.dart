import 'package:bookly_app/core/Errors/Failure.dart';
import 'package:bookly_app/features/Home/Domain/Repo/HomeRepo.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooks_Use_Case extends UseCase<List<BookEntity>,String>{
  final HomeRepo homeRepo;

  FetchSimilarBooks_Use_Case(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> Call([String? category,String? intitle]) async{
    return await homeRepo.FetchSimilarBooks(category: category!,intitle: intitle!);
  }





}
abstract class UseCase<type,params>{
  Future<Either<Failure,type>>Call(params params);
}

class Param{

}
