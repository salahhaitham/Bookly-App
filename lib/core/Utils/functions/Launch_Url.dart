import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void>Customlaunchurl(context,String url)async {

  if (url!=null) {
    final uri = Uri.parse(url);
    print("Preview URL: $uri");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data")));
    }
  }

}