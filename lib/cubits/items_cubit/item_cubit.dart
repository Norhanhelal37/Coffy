import 'package:coffy/cubits/items_cubit/item_state.dart';
import 'package:coffy/models/item_model.dart';
import 'package:coffy/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ItemCubit extends Cubit<ItemState> {
  final ApiService api;
  ItemCubit(this.api) : super(InitialState());

  static ItemCubit get(context) => BlocProvider.of(context);

  late List<ItemModel> items = [];

  late List<ItemModel> favorites = [];

  late List<ItemModel> cartItems = [];

  int total = 0;


  Future<void> fetchmyitems() async {
    emit(LoaddingState());

    try {
      items = await api.fetchAllItems();
      emit(SucessState());
    } catch (e) {
      emit(FailureState(e.toString()));
    }
  }

  void addtofav(ItemModel item) {
    if (favorites.contains(item)) {
      if (favorites.length == 1) {
        favorites = [];
        emit(FavoritState());
      }

      favorites.remove(item);
      emit(FavoritState());
    } else {
      favorites.add(item);
      emit(FavoritState());
    }
  }

  String addtocart(ItemModel item) {
    if (cartItems.contains(item)) {
      cartItems.remove(item);
      total -= item.price * 5;
      emit(RemoveFromCart());
      return "Removed from Cart";
    } else {
      total += item.price * 5;
      cartItems.add(item);
      emit(AddCartState());
      return "Added to cart";
    }
  }

  void payment() {
    cartItems = [];
    total = 0;
    emit(RemoveFromCart());
  }
}
