
import 'package:bookly_app/core/Utils/AppRouter.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:bookly_app/features/Home/manager/cubit/Fetch_Featured_books/Fetch_FeaturedBooks_Cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import 'CustomListviewItem.dart';

class FeatureListView extends StatefulWidget {
  FeatureListView({super.key,required this.books});
  List<BookEntity>books;

  @override
  State<FeatureListView> createState() => _FeatureListViewState();
}

class _FeatureListViewState extends State<FeatureListView> {
  late final ScrollController _scrollController;
  int nextpage=1;
  bool isloading=false;


  @override
  void initState() {
    super.initState();
    _scrollController=ScrollController();
    _scrollController.addListener(_controllListner);
  }
  void _controllListner()async{
    var currentPosition=_scrollController.position.pixels;
    var maxPosition=_scrollController.position.maxScrollExtent;
    if(currentPosition>=0.7*maxPosition&&!isloading){
      if(!isloading) {
        isloading=true;
        await BlocProvider.of<FeaturedBooksCubit>(context).FetchFeaturedBooks(
            pagenumber: nextpage++);
        isloading=false;
      }
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        controller: _scrollController,
        itemCount:widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: (){
                GoRouter.of(context).push(AppRouter.kbookdetails,extra: widget.books[index]);
              },
              child: CustomListViewItem(imagePath:widget.books[index].image?.isNotEmpty == true
                  ? widget.books[index].image!
                  : "assets/images/Property 1=Variant26.png",));
        },
      ),
    );
  }
}
