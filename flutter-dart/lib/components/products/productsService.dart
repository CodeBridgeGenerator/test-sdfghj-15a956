import 'dart:convert';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import '../../main.dart';
import '../../global.dart';
import '../../services/api.dart';
import 'products.dart';

    class ProductsService {
        Future<APIResponse<List<Products>>> getAll() async {
            List<Products>? products;
            String? error;
            Map<String, dynamic>? response;
            try {
              response = await flutterFeathersJS.rest.find(
                serviceName: "productss",
                query: {},
              );
              logger.i(response!['data'].toString());
              products = List<Map<String, dynamic>>.from(response!['data'])
                  .map((map) => Products.fromMap(map))
                  .toList();
            } on FeatherJsError catch (e) {
              logger.e("FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
              error = "Unexpected FeatherJsError occurred, please retry!";
            } catch (e) {
              logger.e("Unexpected error ::: ${e.toString()}");
              error = "Unexpected error occurred, please retry!";
            }
            return APIResponse(errorMessage: error, data: products, response: response);
          }

          Future<APIResponse<Products>> get(String id) async {
            Products? products;
            String? error;
            Map<String, dynamic>? mapString;
        
            try {
              dynamic response = await flutterFeathersJS.rest.get(
                serviceName: "products",
                objectId: id,
              );
              products = Products.fromMap((jsonDecode(response.toString())));
              mapString = jsonDecode(response.toString());
            } on FeatherJsError catch (e) {
              logger.e(
                  "FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
              error =
                  "Unexpected FeatherJsError occurred, please retry! ${e.toString()}";
            } catch (e) {
              logger.i("Unexpected error ::: ${e.toString()}");
              error = "Unexpected error occurred, please retry! ${e.toString()}";
            }
            return APIResponse(
                errorMessage: error, data: products, response: mapString);
          }

          Future<APIResponse<List<Products>>> find(query) async {
            List<Products>? products;
            String? error;
            try {
              Map<String, dynamic> response = await flutterFeathersJS.rest.find(
                serviceName: "productss",
                query: query,
              );
              logger.i(response!['data'].toString());
              products = List<Map<String, dynamic>>.from(response!['data'])
                  .map((map) => Products.fromMap(map))
                  .toList();
            } on FeatherJsError catch (e) {
              logger.e("FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
              error = "Unexpected FeatherJsError occurred, please retry!";
            } catch (e) {
              logger.e("Unexpected error ::: ${e.toString()}");
              error = "Unexpected error occurred, please retry!";
            }
            return APIResponse(errorMessage: error, data: products);
          }


          Future<APIResponse> create(data) async {
            String? error;
            Map<String, dynamic>? response;
            try {
              response = await flutterFeathersJS.rest.create(
                serviceName: "productss",
                data :data);
              logger.i(response.toString());
            } on FeatherJsError catch (e) {
              logger.e("FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
              error = "Unexpected FeatherJsError occurred, please retry!";
            } catch (e) {
              logger.e("Unexpected error ::: ${e.toString()}");
              error = "Unexpected error occurred, please retry!";
            }
            return APIResponse(errorMessage: error, data: response);
          }

          Future<APIResponse> update(id,data) async {
            String? error;
            Map<String, dynamic>? response;
            try {
              response = await flutterFeathersJS.rest.update(
                serviceName: "productss",
                objectId : id,
                data : data);
              logger.i(response.toString());
            } on FeatherJsError catch (e) {
              logger.e("FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
              error = "Unexpected FeatherJsError occurred, please retry!";
            } catch (e) {
              logger.e("Unexpected error ::: ${e.toString()}");
              error = "Unexpected error occurred, please retry!";
            }
            return APIResponse(errorMessage: error, data: response);
          }

          Future<APIResponse> patch(id,data) async {
            String? error;
            Map<String, dynamic>? response;
            try {
              Map<String, dynamic> response = await flutterFeathersJS.rest.patch(
                serviceName: "productss",
              objectId : id,
              data : data);
              logger.i(response.toString());
            } on FeatherJsError catch (e) {
              logger.e("FeatherJsError error ::: Type => ${e.type} ::: Message => ${e.message}");
              error = "Unexpected FeatherJsError occurred, please retry!";
            } catch (e) {
              logger.e("Unexpected error ::: ${e.toString()}");
              error = "Unexpected error occurred, please retry!";
            }
            return APIResponse(errorMessage: error, data: response);
          }
    }