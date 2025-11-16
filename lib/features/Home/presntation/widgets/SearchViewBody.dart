import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/Utils/AppRouter.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_SearchedBooks/fetch_searched_books_cubit.dart';
import 'package:bookly_app/features/Home/presntation/widgets/SearchListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final ScrollController _scrollController = ScrollController();
  bool isloading = false;
  int currentpage = 1;
  String? SearchQuery;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      final cubit = context.read<FetchSearchedBooksCubit>();
      if (!isloading) {
        isloading = true;
        await cubit.FetchSeachedBooks(
          pagenumber: ++cubit.currentPage,
          SearchQuery: cubit.currentQuery,
        );

        isloading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimarycolor,
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // 🔍 Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "Search for books...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onSubmitted: (category) async {
                  if (category.isNotEmpty) {
                    setState(() {
                      books.clear();
                    });

                    final cubit = BlocProvider.of<FetchSearchedBooksCubit>(
                      context,
                    );
                    cubit.currentPage = 0; // reset page counter
                    cubit.currentQuery = category;

                    await cubit.FetchSeachedBooks(
                      SearchQuery: category,
                      pagenumber: 0,
                    );
                  }
                },
              ),
            ),
          ),

          BlocConsumer<FetchSearchedBooksCubit, FetchSearchedBooksState>(
            listener: (context, state) {
              if (state is SearchedBooksSuccess) {
                books.addAll(state.books);
              } else if (state is SearchedBooksPginationSuccess) {
                books.addAll(state.books);
              }
            },
            builder: (context, state) {
              if (state is SearchedBooksSuccess ||
                  state is SearchedBooksStatePaginationLoading) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kbookdetails, extra: books[index]);
                      },
                      child: SearchListViewItemMock(book: books[index]),
                    );
                  }, childCount: books.length),
                );
              } else if (state is SearchedBooksFailure) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Oops, there was an error"),
                    ),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("loading"),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
