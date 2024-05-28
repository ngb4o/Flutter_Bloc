part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {

}

class HomeProductCartButtonClickedEvent extends HomeEvent {

}

class HomeWishlistButtonNavigatedEvent extends HomeEvent {

}

class HomeCartButtonNavigatedEvent extends HomeEvent {

}