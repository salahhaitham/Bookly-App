import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_BookDetails_AppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.close)),

        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))

      ],
    );
  }
}