import 'package:flutter/material.dart';
import 'package:thrift_books/inner_screens/upload_product_form.dart';

import 'bottom_bar.dart';
import 'landing_page.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      children: [LandingPage(), UploadProductForm()],
    );
  }
}