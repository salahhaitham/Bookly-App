import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

Future<void> DeleteAllBooks() async {
  await Hive.deleteBoxFromDisk(Kfeaturedbooks);
  await Hive.deleteBoxFromDisk(Knewstbooks);
}