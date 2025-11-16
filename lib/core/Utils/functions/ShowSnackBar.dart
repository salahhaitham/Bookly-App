import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/FeaturedBooksStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, FeaturedBooksStatePaginationFailure state) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(state.errmessage,style: TextStyle(),),

    ),
  );}