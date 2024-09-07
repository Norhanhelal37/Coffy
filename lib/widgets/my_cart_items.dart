import 'package:coffy/cubits/items_cubit/item_cubit.dart';
import 'package:coffy/cubits/items_cubit/item_state.dart';
import 'package:coffy/models/item_model.dart';
// import 'package:coffy/widgets/number_of_cart_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartItems extends StatelessWidget {
  const MyCartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      builder: (context, state) {
      
        return Expanded(
          flex: 2,
          child: ListView.builder(
            physics:const AlwaysScrollableScrollPhysics(),
            itemCount: ItemCubit.get(context).cartItems.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Dismissible(
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    ItemModel item = ItemCubit.get(context).cartItems[index];
                    
                    String msg =ItemCubit.get(context).addtocart(item);
                    print(msg);
                  },
                  key: Key(ItemCubit.get(context).cartItems[index].title),
                  background: Container(
                    color: const Color.fromARGB(255, 201, 67, 58),
                    margin:
                        const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Container(
                    padding:const EdgeInsets.only(right: 10,left: 10),
                    margin: const EdgeInsets.all(10),
                    height: 90,
                    decoration: const BoxDecoration(
                        color: Color(0xffA79277),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Image.network(
                            ItemCubit.get(context).cartItems[index].imageurl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              ItemCubit.get(context).cartItems[index].title,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              r"$"
                              "${ItemCubit.get(context).cartItems[index].price * 5}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      
                      ],
                    ),
                  ));
            },
          ),
        );
      },
    );
  }
}
