import 'package:flutter/material.dart';
  import 'products.dart';
  import 'productsMain.dart';
  import '../../validators.dart';
  
  class ProductsDialogCreate extends StatefulWidget {
    const ProductsDialogCreate(
        {super.key, required this.index, required this.data});
    final Products data;
    final int index;

    @override
    State<ProductsDialogCreate> createState() => _ProductsDialogCreateState();
  }
  
  class _ProductsDialogCreateState extends State<ProductsDialogCreate> {
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("create Products"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ProductsScreen();
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
                key: widget.key,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
                    child: Wrap(children: [
                      TextFormField(
                keyboardType: TextInputType.name,
    
                validator: (value) {
                  if (Validators.isStringNotEmpty(value, true)) {
                    return null;
                  }
                  return "Please enter a value";
                },
                onSaved: (value) {
                  widget.data.name = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'name',
                  labelText: 'Name',
                ),
              ),
TextFormField(
              keyboardType: TextInputType.number,
  
              validator: (value) {
                if (Validators.isStringNotEmpty(value, true)) {
                  return null;
                }
                return "Please enter a number";
              },
              onSaved: (value) {
                widget.data?.price = int.parse(value!);
              },
              decoration: const InputDecoration(
                hintText: 'price',
                labelText: 'Price',
              ),
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