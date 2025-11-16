import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/Utils/ApiService.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/data/models/BookModel/bookmodel.dart';
import 'package:dio/dio.dart';
import 'package:bookly_app/core/Utils/functions/savedata.dart';
import 'package:bookly_app/core/Utils/functions/ServiceLocator.dart';
import 'package:hive/hive.dart';





abstract class HomeRemoteData{
  Future<List<BookEntity>>FetchFeaturedBooks({int pagenumber=0});
  Future<List<BookEntity>>FetchNewstBooks({int pagenumber=0});
  Future<List<BookEntity>>FetchSimilarBooks({String category,String intitle});
  Future<List<BookEntity>>FetchSearchedBooks({String SearchQuery,int pagenumber=0});



}

class HomeRemoteData_Implmentation extends HomeRemoteData{

  @override
  Future<List<BookEntity>> FetchFeaturedBooks({int pagenumber=0})async {
    var data=await  getit.get<ApiService>().get(endpoint: "volumes?q=programming&Filtring=free-ebooks&Sorting=newstl  &startIndex=${pagenumber*10}&maxResults=10");
    return GetBooksList(data,Kfeaturedbooks);


  }

  Future<List<BookEntity>> FetchNewstBooks({int pagenumber=0}) async{
    var data=await  ApiService(Dio()).get(endpoint: "volumes?q=programming&Filtring=free-ebooks&Sorting=newst&startIndex=${pagenumber*10}&maxResults=10");
    return GetBooksList(data,Knewstbooks);



  } @override



  List<BookEntity> GetBooksList(Map<String, dynamic> data, String boxName) {
    List<BookEntity> booksList = [];
    if (data["items"] != null) {
      for (var bookMap in data["items"]) {
        booksList.add(BookModel.fromJson(bookMap));
      }
      if (booksList.isNotEmpty) {
        SaveBooks(booksList, boxName);
      }
    }
    return booksList;
  }

  @override
  Future<List<BookEntity>> FetchSimilarBooks({String? category, String? intitle}) async{
    var data=await  ApiService(Dio()).get(endpoint: "volumes?q=subject:{$category}+intitle:{$intitle}&Filtring=free-ebooks&Sorting=newst&maxResults=10");

    List<BookEntity> booksList = [];
    if (data["items"] != null) {
      for (var bookMap in data["items"]) {
        booksList.add(BookModel.fromJson(bookMap));
      }

    }
    return booksList;
  }

  @override
  Future<List<BookEntity>> FetchSearchedBooks({String? SearchQuery, int pagenumber = 0}) async{
    var data=await ApiService(Dio()).get(endpoint: "volumes?q=$SearchQuery&Sorting=newst&Filtring=free-ebooks&startIndex=${pagenumber*10}&maxResults=10");
   // var data=await  ApiService(Dio()).get(endpoint: "volumes?q=programming&Filtring=free-ebooks&Sorting=newst&startIndex=${pagenumber*10}&maxResults=10");


    List<BookEntity> booksList = [];
    if (data["items"] != null) {
      for (var bookMap in data["items"]) {
        booksList.add(BookModel.fromJson(bookMap));
      }

    }
    return booksList;
  }






}

//
// import 'package:bookly_app/constants.dart';
// import 'package:bookly_app/core/Utils/ApiService.dart';
// import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
// import 'package:bookly_app/features/Home/data/models/BookModel/bookmodel.dart';
// import 'package:dio/dio.dart';
// import 'package:bookly_app/core/Utils/functions/savedata.dart';
// import 'package:bookly_app/core/Utils/functions/ServiceLocator.dart';
// import 'package:hive/hive.dart';
//
//
//
//
//
// abstract class HomeRemoteData{
//   Future<List<BookEntity>>FetchFeaturedBooks({int pagenumber=0,String category="general"});
//   Future<List<BookEntity>>FetchNewstBooks({int pagenumber=0,String category="general"});
//
// }
//
// class HomeRemoteData_Implmentation extends HomeRemoteData{
//
//   @override
//   Future<List<BookEntity>> FetchFeaturedBooks({int pagenumber=0,String category="general"})async {
//     var data=await  getit.get<ApiService>().get(endpoint: "volumes?q={$category}&startIndex=${pagenumber*10}&maxResults=10");
//     return GetBooksList(data,Kfeaturedbooks);
//
//
//   }
//
//   @override
//   Future<List<BookEntity>> FetchNewstBooks({int pagenumber=0,String category="general"}) async{
//     var data=await  ApiService(Dio()).get(endpoint: "volumes?q={$category}&startIndex=${pagenumber*10}&maxResults=10");
//     return GetBooksList(data,Knewstbooks);
//
//
//
//   }
//
//
//   List<BookEntity> GetBooksList(Map<String, dynamic> data, String boxName) {
//     List<BookEntity> booksList = [];
//     if (data["items"] != null) {
//       for (var bookMap in data["items"]) {
//         booksList.add(BookModel.fromJson(bookMap));
//       }
//       if (booksList.isNotEmpty) {
//         SaveBooks(booksList, boxName);
//       }
//     }
//     return booksList;
//   }
//
//
//
//
// }


