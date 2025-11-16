import 'package:bookly_app/core/Utils/functions/Launch_Url.dart';
import 'package:bookly_app/core/widgets/TextButton.dart';
import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonAction extends StatelessWidget {
 const ButtonAction(this.book);
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: TextButton1(
              onpress: () {

              },
              textbutton: "0.0€",
              backgroundcolor: Colors.white,
              textcolor: Colors.black,
              buttonBorderRadious: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)
              ),
            ),
          ),
          Expanded(
            child: TextButton1(
              textbutton: "Free Preview",
              backgroundcolor: Color(0xffef8262),
              textcolor: Colors.white,
              buttonBorderRadious: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)
              ), onpress: () async{
                if(!(book.previewlink==null)) {
                  Customlaunchurl(context,book.previewlink!);
                }else{
                  return;
                }
            },
            ),
          ),
        ],
      ),
    );
  }


}
