import 'package:coffy/cubits/items_cubit/item_cubit.dart';
import 'package:coffy/cubits/items_cubit/item_state.dart';
import 'package:coffy/models/item_model.dart';
import 'package:coffy/widgets/buy_configration_in_item.dart';
// import 'package:coffy/widgets/my_recipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.myitem});
  final ItemModel myitem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA79277),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Stack(children: [
                Container(
                  height: 400,
                  width: MediaQuery.sizeOf(context).width,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image.network(
                    myitem.imageurl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 12,
                    left: 5,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white.withOpacity(.4),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    )),
                Positioned(
                    top: 12,
                    right: 5,
                    child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white.withOpacity(.4),
                        child: BlocBuilder<ItemCubit, ItemState>(
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                ItemCubit.get(context).addtofav(myitem);
                                
                                
                              },
                              icon: !(ItemCubit.get(context).favorites.contains(myitem)) ? const Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                      size: 26,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 26,
                                    ),
                            );
                          },
                        )))
              ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  myitem.title,
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.start,
                  myitem.describtion,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 145, 79, 5), fontSize: 22),
                ),
                const Text(
                  "ingredients",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                for (int i = 0; i < myitem.ingridiants.length; i++)
                  Text(
                    textAlign: TextAlign.center,
                    myitem.ingridiants[i],
                    style: const TextStyle(
                        color: Color.fromARGB(255, 145, 79, 5), fontSize: 22),
                  )
              ],
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  r"$" "${myitem.price * 5}",
                  style: const TextStyle(color: Colors.black, fontSize: 40),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(Size(250, 70)),
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 219, 132, 17))),
                  onPressed: () {
                    paymentConfigration(context, myitem);
                  },
                  child: const Text(
                    "Buy now",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Pacifico",
                        fontSize: 30),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
