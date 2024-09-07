import 'package:coffy/cubits/items_cubit/item_cubit.dart';
import 'package:coffy/cubits/items_cubit/item_state.dart';
import 'package:coffy/models/item_model.dart';
import 'package:coffy/widgets/my_custome_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyItems extends StatefulWidget {
  const MyItems({
    super.key,
  });

  @override
  State<MyItems> createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {
  late List<ItemModel> myItems;
  @override
  void initState() {
    if (ItemCubit.get(context).items.isEmpty) {
      ItemCubit.get(context).fetchmyitems();
      myItems = ItemCubit.get(context).items;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
        if (state is SucessState || state is FavoritState || state is AddCartState || state is RemoveFromCart) {
          return Expanded(
            child: GridView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    childAspectRatio: .55,
                    crossAxisSpacing: 20),
                itemCount: ItemCubit.get(context).items.length,
                itemBuilder: (context, index) {
                  return CustomeItem(
                    myitem: ItemCubit.get(context).items[index],
                  );
                }),
          );
        } else if (state is LoaddingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 5,
            ),
          );
        } else {
          return const Center(
            child: Text(
              "Something wrong ",
              style: TextStyle(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}
