
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_newst_Books/FetchNewstStates.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_newst_Books/Fetch_NewstBooks_Cubit.dart';
import 'package:bookly_app/features/Home/presntation/widgets/NewstBooksListView.dart';
import 'package:bookly_app/features/Home/presntation/widgets/NewstBooks_ListView_LoadingIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewstBooks_BlocConsumer extends StatefulWidget {
  const NewstBooks_BlocConsumer({
    super.key,
  });

  @override
  State<NewstBooks_BlocConsumer> createState() => _NewstBooks_BlocConsumerState();
}

class _NewstBooks_BlocConsumerState extends State<NewstBooks_BlocConsumer> {
  List<BookEntity>newstbooks=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewstBooksCubit, FetchNewstBooksStates>(
      listener: (context, state) {

        if(state is NewstBooksStateSuccess){
          newstbooks.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is NewstBooksStateSuccess||state is NewstBooksStatePaginationLoading ) {
          return NewstBooksListView(newstbooks:newstbooks );
        } else if (state is NewstBooksStateFailure) {
          return SliverToBoxAdapter(child: Text(state.errmessage));
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: SizedBox(
                  height: 120,
                  child: CustomNewstBookLoadingIndicator(),
                ),
              ),
              childCount: 10,
            ),
          );
        }
      },
    );
  }
}