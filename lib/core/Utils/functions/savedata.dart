import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:hive/hive.dart';

void SaveBooks(List<BookEntity> booksList,String boxname) {
  var box=Hive.box<BookEntity>(boxname);
  box.addAll(booksList);

}