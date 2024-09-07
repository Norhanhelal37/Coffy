import 'package:coffy/cubits/items_cubit/item_cubit.dart';
import 'package:coffy/cubits/items_cubit/item_state.dart';
import 'package:coffy/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAD8C0),
      appBar: AppBar(
        backgroundColor: const Color(0xffEAD8C0),
        title:const Text("Favorites",style: TextStyle(color: Colors.black,fontSize: 30,
          fontFamily: "Pacifico"),),
        centerTitle: true,
      ),
      body: (ItemCubit.get(context).favorites.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                 
                  BlocBuilder<ItemCubit, ItemState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: ItemCubit.get(context).favorites.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Dismissible(
                                direction: DismissDirection.startToEnd,
                                onDismissed: (direction) {
                                  ItemModel item =
                                      ItemCubit.get(context).favorites[index];

                                  ItemCubit.get(context).addtofav(item);
                                },
                                key: Key(ItemCubit.get(context)
                                    .favorites[index]
                                    .title),
                                background: Container(
                                  color: const Color.fromARGB(255, 201, 67, 58),
                                  margin: const EdgeInsets.only(
                                      top: 10, left: 10, bottom: 10),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  margin: const EdgeInsets.all(10),
                                  height: 90,
                                  decoration: const BoxDecoration(
                                      color: Color(0xffA79277),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Image.network(
                                          ItemCubit.get(context)
                                              .favorites[index]
                                              .imageurl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            ItemCubit.get(context)
                                                .favorites[index]
                                                .title,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            r"$"
                                            "${ItemCubit.get(context).favorites[index].price * 5}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
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
                  )
                ],
              ),
            )
          : const Center(
            child: Text(
              "Add items to your favorites",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
    );
  }
}
