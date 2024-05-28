import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_1/data/cart_items.dart';
import 'package:flutter_bloc_1/data/grocery_data.dart';
import 'package:flutter_bloc_1/data/wishlis_items.dart';
import 'package:meta/meta.dart';

import '../models/home_product_data_models.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigatedEvent>(homeWishlistButtonNavigatedEvent);
    on<HomeCartButtonNavigatedEvent>(homeCartButtonNavigatedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl']),
            )
            .toList()));
  }

  FutureOr<void> homeWishlistButtonNavigatedEvent(
      HomeWishlistButtonNavigatedEvent event, Emitter<HomeState> emit) {
    print('Wishlish Navigation Clicked');
    emit(HomeNavigatedToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigatedEvent(
      HomeCartButtonNavigatedEvent event, Emitter<HomeState> emit) {
    print('Cart Navigation Clicked');
    emit(HomeNavigatedToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Product Clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product Clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }
}
