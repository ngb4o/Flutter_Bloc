import 'package:flutter/material.dart';
import 'package:flutter_bloc_1/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_1/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_1/features/home/models/home_product_data_models.dart';
import 'package:flutter_bloc_1/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  const WishlistTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(productDataModel.description),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '\$${productDataModel.price.toString()}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        wishlistBloc.add(WishlistRemoveFromCartEvent(productDataModel: productDataModel));
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        // wishlistBloc.add(CartRemoveFromCartEvent(productDataModel: productDataModel));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
