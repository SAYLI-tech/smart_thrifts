import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrift_books/inner_screens/product_details.dart';
import 'package:thrift_books/models/product.dart';

class FeedProducts extends StatefulWidget {


  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    final productsAttributes= Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ProductDetails.routeName),
        child: Container(
          width: 250,
          height: 290,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).backgroundColor),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                          minHeight: 100,
                          maxHeight: MediaQuery.of(context).size.height * 0.3),
                      child: Image.network(
                        //'https://img.apmcdn.org/ccb42f129cf5ff018d724098c52aca1a825e20bc/uncropped/03ced2-20150819-books.jpg',
                        productsAttributes.imageUrl,
                        // fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Badge(
                    toAnimate: true,
                    shape: BadgeShape.square,
                    badgeColor: Colors.pink,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(8)),
                    badgeContent:
                        Text('NEW', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      productsAttributes.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '\$ ${productsAttributes.price}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${productsAttributes.quantity}',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w900),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(18.0),
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
