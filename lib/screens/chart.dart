import 'package:coffy/cubits/items_cubit/item_cubit.dart';
import 'package:coffy/cubits/items_cubit/item_state.dart';

import 'package:coffy/widgets/my_cart_items.dart';

import 'package:coffy/widgets/my_recipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffEAD8C0),
      body: SafeArea(
        child: BlocBuilder<ItemCubit, ItemState>(
          builder: (context, state) {
          
            if (ItemCubit.get(context).cartItems.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Center(
                      child: Text("Cart",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                   Center(
                      child: Text(
                        "Your Cart Is empty!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Center(
                      child: Text("Cart",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyCartItems(),
                    MyRecipt(
                      
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
