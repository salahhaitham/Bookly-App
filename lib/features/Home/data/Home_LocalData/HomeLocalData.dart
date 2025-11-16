import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:hive/hive.dart';


abstract class HomeLocalData{
  List<BookEntity>FetchfeaturedBooks({int pagenumber=0});
  List<BookEntity>FetchNewstBooks({int pagenumber=0});
  List<BookEntity>FetchSearchedBooks({int pagenumber=0});

}


class HomeLocalData_Implemntation extends HomeLocalData{
  @override
  List<BookEntity> FetchNewstBooks({int pagenumber=0}) {
    var box=Hive.box<BookEntity>(Knewstbooks);
    int startIndex=pagenumber*10;
    int endIndex=(pagenumber+1)*10;
    int length=box.length;
    if(startIndex>=length||endIndex>length){
      return [];
    }


    return box.values.toList().sublist(startIndex,endIndex) ;

  }



  @override
  List<BookEntity> FetchfeaturedBooks({int pagenumber=0}) {
    var box=Hive.box<BookEntity>(Kfeaturedbooks);
    int startIndex=pagenumber*10;
    int endIndex=(pagenumber+1)*10;
    int length=box.length;
    if(startIndex>=length||endIndex>length){
      return [];
    }


    return box.values.toList().sublist(startIndex,endIndex) ;

  }

  @override
  List<BookEntity> FetchSearchedBooks({int pagenumber = 0}) {
    var box=Hive.box<BookEntity>(Ksearchedbooks);
    int startIndex=pagenumber*10;
    int endIndex=(pagenumber+1)*10;
    int length=box.length;
    if(startIndex>=length||endIndex>length){
      return [];
    }


    return box.values.toList().sublist(startIndex,endIndex) ;
  }


}

// abstract class HomeLocalData{
//   List<BookEntity>FetchfeaturedBooks();
//   List<BookEntity>FetchNewstBooks();
// }
//
//
// class HomeLocalData_Implemntation extends HomeLocalData{
//   @override
//   List<BookEntity> FetchNewstBooks() {
//   var box=Hive.box<BookEntity>(Knewstbooks);
//   return box.values.toList();
//   }
//
//   @override
//   List<BookEntity> FetchfeaturedBooks() {
//    var box=Hive.box<BookEntity>(Kfeaturedbooks);
//    return box.values.toList();
//   }
//
// }