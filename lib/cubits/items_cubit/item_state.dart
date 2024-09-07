

abstract class ItemState {}

class InitialState extends ItemState {}

class LoaddingState extends ItemState {}

class SucessState extends ItemState {
  get items => null;
}

class FailureState extends ItemState {
  final String? message;
  FailureState(this.message);
}

class FavoritState extends ItemState {}

class AddCartState extends ItemState {}

class RemoveFromCart extends ItemState {}
