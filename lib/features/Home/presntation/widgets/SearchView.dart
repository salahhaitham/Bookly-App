import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/Utils/functions/DeleteAllBooks.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/Fetch_FeaturedBooks_Cubit.dart';
import 'package:bookly_app/features/Home/presntation/widgets/NewstBooks_ListView_Item.dart';
import 'package:bookly_app/features/Home/presntation/widgets/SearchListViewItem.dart';
import 'package:bookly_app/features/Home/presntation/widgets/SearchView.dart';
import 'package:bookly_app/features/Home/presntation/widgets/SearchViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchViewBody();
  }
}







