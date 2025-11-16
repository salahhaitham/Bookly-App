import 'package:bookly_app/core/Utils/AppRouter.dart';
import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_newst_Books/Fetch_NewstBooks_Cubit.dart';
import 'package:bookly_app/features/Home/presntation/widgets/BookRatingWidgt.dart';
import 'package:bookly_app/features/Home/presntation/widgets/NewstBooks_ListView_Item.dart';
import 'package:bookly_app/features/Home/presntation/widgets/HomeViewBody.dart';
import 'package:flutter/cupertino.dart' show StatelessWidget, BuildContext, Widget, EdgeInsets, SizedBox, Padding, SliverChildBuilderDelegate, SliverList, MainAxisAlignment, BorderRadius, AssetImage, BoxFit, DecorationImage, BoxDecoration, Container, AspectRatio, CrossAxisAlignment, MediaQuery, TextOverflow, Text, FontWeight, TextStyle, Spacer, Row, Column, Flexible;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewstBooksListView extends StatelessWidget {
  final List<BookEntity> newstbooks;

  const NewstBooksListView({super.key, required this.newstbooks});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: SizedBox(
              height: 120,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kbookdetails,extra:newstbooks[index]);
                },
                child: NewstBooksListViewItem(
                  book: newstbooks[index],
                ),
              ),
            ),
          );
        },
        childCount: newstbooks.length,
      ),
    );
  }
}