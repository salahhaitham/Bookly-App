import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/presntation/widgets/BookRatingWidgt.dart';
import 'package:bookly_app/features/Home/presntation/widgets/ButtonActionDetails.dart';
import 'package:bookly_app/features/Home/presntation/widgets/CustomListviewItem.dart';
import 'package:flutter/cupertino.dart';

class  BookDetailSection extends StatelessWidget{
  final BookEntity book;

  BookDetailSection(this.book);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomListViewItem(imagePath: book.image??"",),
        ),
        SizedBox(height: 35),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.08),
          child: Text(
            textAlign: TextAlign.center,
            book.title,
            style: Styles.textstyle30.copyWith(fontFamily: 'GT Sectra'),
          ),
        ),
        SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.authorName??"Un Known",
            style: Styles.textstyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(height: 8),
        BookRatingWidget(mainAxisAlignment: MainAxisAlignment.center,rating: book.rating?.toDouble() ?? 0.0),
        SizedBox(height: 35,),
        ButtonAction(book),
      ],
    );
  }
}
