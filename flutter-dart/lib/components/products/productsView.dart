import 'package:flutter/material.dart';
    import 'products.dart';
    import 'productsMain.dart';
  
  class ProductsDialogViewScreen extends StatelessWidget {
    const ProductsDialogViewScreen(
        {super.key, required this.index, required this.data});
    final Products data;
    final int index;
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("view Products}"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductsScreen();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.save),
                color: Colors.orange,
                iconSize: 20,
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
                key: key,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
                    child: Wrap(children: [
                      Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              data.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Price",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                data.price!.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {},
                        child: const Text("Update", style: TextStyle(color: Colors.white), ),
                      ))
                    ]))),
          ));
    }
  }