import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_icons/flutter_icons.dart';
import 'package:thrift_books/consts/colors.dart';
import 'package:thrift_books/consts/my_icons.dart';
import 'package:thrift_books/widget/cart_empty.dart';

import '../widget/cart_empty.dart';
import '../widget/cart_full.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(Object context) {
    List products = [];
    return products.isNotEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: checkOutSection(context),
            appBar: AppBar(
              title: Text('Cart Items Count'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(MyAppIcons.trash),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext ctx, int index) {
                  return CartFull();
                },
              ),
            ));
  }

  Widget checkOutSection(BuildContext ctx) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                //  flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      ColorsConsts.gradiendLStart,
                      ColorsConsts.gradiendLEnd,
                    ], stops: [
                      0.0,
                      0.7
                    ]),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      // ignore: deprecated_member_use
                      child: Padding(
                        padding: const EdgeInsets.all(4.0), //8.0
                        child: Text(
                          'Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              // ignore: deprecated_member_use
                              color: Theme.of(ctx).textSelectionColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Total',
                style: TextStyle(
                    // ignore: deprecated_member_use
                    color: Theme.of(ctx).textSelectionColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'US \$179.0',
                // textAlign: TextAlign.center ,
                style: TextStyle(
                    // ignore: deprecated_member_use
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
