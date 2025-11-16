import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/presntation/widgets/BookRatingWidgt.dart';
import 'package:flutter/material.dart';

class SearchListViewItemMock extends StatelessWidget {
  const SearchListViewItemMock({super.key, required this.book, });


 final BookEntity book;
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.2,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300],
                  image: book.image != null
                      ? DecorationImage(
                    image: NetworkImage(book.image!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: book.image == null
                    ? const Icon(Icons.book, size: 40, color: Colors.grey)
                    : null,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان
                SizedBox(

                  child: Text(
                    book.title,
                    style: Styles.textstyle20.copyWith(fontFamily: 'GT Sectra'),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  book.authorName!=null ? book.authorName! :"Un Known",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      book.price != null ? "0.0\$"    : "0.0\$",
                      style:
                      Styles.textstyle20.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    BookRatingWidget(
                      rating: book.rating?.toDouble() ??0.0 ,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
