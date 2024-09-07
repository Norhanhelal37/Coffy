import 'package:coffy/cubits/items_cubit/item_cubit.dart';
import 'package:coffy/cubits/items_cubit/item_state.dart';
import 'package:coffy/models/item_model.dart';
import 'package:coffy/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomeItem extends StatelessWidget {
  const CustomeItem({
    super.key,
    required this.myitem,
  });

  final ItemModel myitem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffA79277),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Hero(
            tag: myitem.title,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemDetails(
                              myitem: myitem,
                            )));
              },
              child: Container(
                height: 150,
                width: 150,
                margin: const EdgeInsets.only(top: 20),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Image.network(
                  myitem.imageurl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.start,
            myitem.title,
            style:const TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Container(
              width: 160,
              height: 50,
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 240, 228, 202).withOpacity(.3),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"$" "${myitem.price * 5}",
                      style:const TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 252, 203, 139),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: BlocBuilder<ItemCubit, ItemState>(
                          builder: (context, state) {
                            return IconButton(
                                onPressed: () {
                                 String message =  ItemCubit.get(context).addtocart(myitem);
                                  
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(message)));
                                  
                                 
                                },
                                icon: (
                                        !(ItemCubit.get(context)
                                            .cartItems
                                            .contains(myitem)))
                                    ? const Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.check,
                                        size: 30,
                                        color: Colors.green,
                                      ));
                          },
                        )),
                  ]))
        ],
      ),
    );
  }
}
