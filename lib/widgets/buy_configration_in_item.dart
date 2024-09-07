import "package:coffy/models/item_model.dart";
import "package:flutter/material.dart";



Future<dynamic> paymentConfigration(BuildContext context,ItemModel item) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor:const Color.fromARGB(255, 230, 141, 109),
            actions: [
              ElevatedButton(
                  style: const ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 221, 164, 143)),
                      minimumSize: WidgetStatePropertyAll(Size(95, 60))),
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Sucess")));
                  },
                  child: const Text("confirm",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600))),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 221, 164, 143)),
                      minimumSize: WidgetStatePropertyAll(Size(95, 60))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "cancle",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ))
            ],
            content: Container(
                padding: const EdgeInsets.only(top: 19),
                height: 250,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Delivery charge ",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          r"$5",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "total ",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          r"$"
                          "${item.price * 5 + 5}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 25),
                        ),
                      ],
                    )
                  ],
                )));
      });
}
