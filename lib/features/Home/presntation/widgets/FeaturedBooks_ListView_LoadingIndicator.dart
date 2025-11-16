import 'package:bookly_app/core/widgets/Custom_Fading_Widget.dart';
import 'package:bookly_app/features/Home/presntation/widgets/CustomBook_Image_LoadingIndicator.dart';
import 'package:flutter/cupertino.dart';

class FeaturedBooks_ListView_Loading_Indicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  CustomFadingWidget(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
      
      itemCount:15,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
      return CustomBookImageLoadingIndicator();
        }
        )
      ),
    );
}
}