import 'package:bookly_app/core/Utils/AppRouter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants.dart';

class CustomAppBar extends StatelessWidget{
const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 24,bottom: 24),
      child: Row(
        children: [
          Image.asset(klogo,height: 22,),
          Spacer(),
          IconButton(onPressed: (){
            NavigateToSearchView(context);
            
          }, icon: Icon(Icons.search,size: 34,))


        ],
      ),
    );
  }

  void NavigateToSearchView(BuildContext context) {
    GoRouter.of(context).push(AppRouter.ksearchview);
  }

}  