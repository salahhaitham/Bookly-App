import 'package:bookly_app/core/Utils/functions/ServiceLocator.dart';
import 'package:bookly_app/features/Home/Domain/UseCases/Fetch_SimilarBooks_UseCaSE.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/data/repos/HomeRepoImplementation.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Similar_Books/fetch_similar_cubit.dart';
import 'package:bookly_app/features/Home/presntation/widgets/BookDetailsViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatefulWidget {
  final BookEntity book;

  BookDetails({required this.book});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  late BookEntity currentBook;

  @override
  void initState() {
    super.initState();
    currentBook = widget.book;
    _fetchSimilar(currentBook);

  }

  void _fetchSimilar(BookEntity book) {
    context.read<FetchSimilarCubit>().FetchSimilarBooksCubit(
      category: book.category ?? "general",
      intitle: book.title ?? "",
    );
  }

  void _updateBook(BookEntity newBook) {
    setState(() {
      currentBook = newBook;
      _fetchSimilar(newBook);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(currentBook, onBookSelected: _updateBook),
    );
  }
}