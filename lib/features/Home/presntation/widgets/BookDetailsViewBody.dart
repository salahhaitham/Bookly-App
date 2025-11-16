import 'package:bookly_app/core/widgets/CustomFadingBox.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Similar_Books/fetch_similar_cubit.dart';
import 'package:bookly_app/features/Home/presntation/widgets/BookDetailSection.dart';
import 'package:bookly_app/features/Home/presntation/widgets/BookDetailsFading.dart';
import 'package:bookly_app/features/Home/presntation/widgets/Custom_BookDetails_AppBar.dart';
import 'package:bookly_app/features/Home/presntation/widgets/SimilarBooksListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity book;
  final void Function(BookEntity)onBookSelected;

  const BookDetailsViewBody(this.book, {super.key, required this.onBookSelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimilarCubit, FetchSimilarState>(
      builder: (context, state) {
        if (state is SimilarBooksStateSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Custom_BookDetails_AppBar(),
                      const SizedBox(height: 20),
                      BookDetailSection(book),
                      const SizedBox(height: 30),
                      const Text(
                        "You may also like",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      SimilarBooksListView(bookslist: state.books,onBookSelected: onBookSelected,),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is SimilarBooksStateFailure) {
          return Center(
            child: Text(
              state.errmessage,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else {
          return BookDetails_Fading();
        }
      },
    );
  }
}

