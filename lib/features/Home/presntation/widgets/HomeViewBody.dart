import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/FeaturedBooksStates.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/Fetch_FeaturedBooks_Cubit.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_newst_Books/FetchNewstStates.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_newst_Books/Fetch_NewstBooks_Cubit.dart';
import 'package:bookly_app/features/Home/presntation/widgets/NewstBooksListView.dart';
import 'package:bookly_app/features/Home/presntation/widgets/BookRatingWidgt.dart';
import 'package:bookly_app/features/Home/presntation/widgets/FeturedBooks_ListView_BlocConsumer.dart';
import 'package:bookly_app/features/Home/presntation/widgets/HomeViewBody.dart';
import 'package:bookly_app/features/Home/presntation/widgets/NewstBooks_ListView_BlocConsumer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'FeatureListView.dart';
import 'CustomAppBar.dart';
import 'CustomListviewItem.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}


class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();
  int _nextPage = 1;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final currentPosition = _scrollController.position.pixels;
    final maxPosition = _scrollController.position.maxScrollExtent;


    if (maxPosition > 0 &&
        !_isLoadingMore &&
        currentPosition >= maxPosition * 0.7) {
      _loadMoreBooks();
    }
  }

  void _loadMoreBooks() {
    setState(() => _isLoadingMore = true);
    print("Loading more books, page: $_nextPage");
    BlocProvider.of<NewstBooksCubit>(
      context,
    ).fetchNewstBooks(pagenumber: _nextPage++);
    setState(() => _isLoadingMore = false);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomAppBar(),
              ),
              FeturedBooks_ListView_BlocConsumer(),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Newst Books",
                  style: Styles.textstyle20.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        NewstBooks_BlocConsumer(),

        if (_isLoadingMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }



}
































