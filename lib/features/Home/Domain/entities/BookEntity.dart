
import 'package:hive/hive.dart';
part 'BookEntity.g.dart';
@HiveType(typeId: 0)
class BookEntity {

  @HiveField(0)
  final String Bookid;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final String? authorName;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final String? category;
  @HiveField(7)
  final String? previewlink;

  BookEntity({
    required this.Bookid,
    required this.image,
    required this.title,
    required this.price,
    required this.authorName,
    required this.rating,
    required this.category,
    required this.previewlink,
  });
}
