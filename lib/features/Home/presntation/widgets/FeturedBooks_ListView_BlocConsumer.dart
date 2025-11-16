import 'package:bookly_app/core/Utils/functions/ShowSnackBar.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/FeaturedBooksStates.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/Fetch_FeaturedBooks_Cubit.dart';
import 'package:bookly_app/features/Home/presntation/widgets/FeatureListView.dart';
import 'package:bookly_app/features/Home/presntation/widgets/FeaturedBooks_ListView_LoadingIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeturedBooks_ListView_BlocConsumer extends StatefulWidget {
  const FeturedBooks_ListView_BlocConsumer({super.key});

  @override
  State<FeturedBooks_ListView_BlocConsumer> createState() =>
      _FeturedBooks_ListView_BlocBuilderState();
}

class _FeturedBooks_ListView_BlocBuilderState
    extends State<FeturedBooks_ListView_BlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksStateSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksStatePaginationFailure) {
          ShowSnackBar(context, state);
         // ShowSnackBar(context, state);
        }
      },
      builder: (context, state) {
        if(state is FeaturedBooksStateLoading){
          return FeaturedBooks_ListView_Loading_Indicator();
        }
       else if (state is FeaturedBooksStateSuccess ||
            state is FeaturedBooksStatePaginationLoading ||
            state is FeaturedBooksStatePaginationFailure) {
          return FeatureListView(books: books);
        } else if (state is FeaturedBooksStateFailure) {
          return Text(state.errmessage);
        } else
          return SizedBox();
      },
    );
  }


  }

