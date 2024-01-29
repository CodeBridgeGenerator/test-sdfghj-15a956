import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'products.dart';
    import 'productsService.dart';
    
    class ProductsCards extends StatefulWidget {
      const ProductsCards({super.key});
      @override
      State<ProductsCards> createState() => _ProductsCardState();
    }
    
    class _ProductsCardState extends State<ProductsCards> {
      String? error;
      late bool _isLoading;
      List<Products> products = [];
      ProductsService productsService = ProductsService();
    
      fetchProducts() {
        productsService.getAll().then(
          (response) {
            _isLoading = false;
            if (response.errorMessage == null) {
              setState(() {
                products = response.data!;
                _isLoading = false;
              });
            } else {
              setState(() {
                error = response.errorMessage;
                _isLoading = false;
              });
            }
          },
        );
      }
    
      @override
      void initState() {
        super.initState();
        _isLoading = true;
        fetchProducts();
      }
    
      @override
      Widget build(BuildContext context) {
        return SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return card(
                    products[index], context);
              }),
        );
      }
    
      Widget card(Products products, BuildContext context) {
        return Card(
          color: Colors.white,
          elevation: 8.0,
          margin: const EdgeInsets.all(4.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Text(products.name, style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),),
              // Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: Image.network(
              //     products.image,
              //     height: MediaQuery.of(context).size.width * (3 / 4) / 3,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              //Text(products.description, const style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),),
            ],
          ),
        );
      }
    }