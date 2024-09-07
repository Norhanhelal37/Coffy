
import 'package:coffy/cubits/items_cubit/item_cubit.dart';
import 'package:coffy/cubits/items_cubit/item_state.dart';
import 'package:coffy/widgets/buy_recipt_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRecipt extends StatelessWidget {
  const MyRecipt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: const BoxDecoration(
        color: Color(0xffA79277),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChargeTitleAndAmount(
                title: "Delivery charge ",
                size: 30,
                color: Colors.white,
              ),

              ChargeTitleAndAmount(
                title: r"$5",
                size: 35,
                color: Colors.black,
              ),

              SizedBox(
                width: 5,
              )
            ],
          ),
          const SizedBox(
            width: 300,
            child: Divider(
              color: Color.fromARGB(255, 238, 209, 171),
              thickness: 1,
            ),
          ),
          BlocBuilder<ItemCubit, ItemState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const ChargeTitleAndAmount(
                    title: "total ", 
                    size: 30, 
                    color: Colors.white),

                    ChargeTitleAndAmount(
                      title: r"$" "${ItemCubit.get(context).total + 5}", 
                      size: 35,
                       color:  Colors.black),
                  const SizedBox(
                    width: 5,
                  )
                ],
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(182, 117, 94, 1)),
                  minimumSize: WidgetStatePropertyAll(Size(300, 70))),
              onPressed: () {
                confirmaction(context);
                ItemCubit.get(context).payment();
              },
              child: const Text(
                "Buy now",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ],
      ),
    ));
  }
}





class ChargeTitleAndAmount extends StatelessWidget {
  const ChargeTitleAndAmount({
    super.key, required this.title, required this.size, required this.color,
  });
  final String title;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
