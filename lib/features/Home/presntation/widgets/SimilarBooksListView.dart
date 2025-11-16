import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/presntation/widgets/CustomListviewItem.dart';
import 'package:flutter/cupertino.dart';

class SimilarBooksListView extends StatelessWidget{
final List<BookEntity>bookslist;
final void Function(BookEntity)onBookSelected;

const SimilarBooksListView({required this.bookslist, required this.onBookSelected});

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        itemCount: bookslist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                onBookSelected(bookslist[index]);
              },
              child: CustomListViewItem(imagePath: bookslist[index].image??"gnfgnf"));
        },
      ),
    );
  }
}
