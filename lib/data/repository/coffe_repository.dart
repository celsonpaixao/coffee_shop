import 'package:coffee_shop/data/interface/icoffe_repository.dart';
import 'package:coffee_shop/model/cofee_model.dart';
import 'package:coffee_shop/resources/app_prints.dart';
import 'package:dio/dio.dart';

class CoffeRepository implements ICoffeRepository {
  final Dio dio;

  CoffeRepository({required this.dio});

  @override
  Future<List<CoffeModel>> getallproducts() async {
    final List<CoffeModel> coffes = [];

    try {
      final response = await dio.get("/api");

      if (response.statusCode == 200 && response.data is List) {
        for (var item in response.data) {
          coffes.add(CoffeModel.fromMap(item));
          printJson(response.data);
        }
      } else {
        print("Resposta não é uma lista ou status code não é 200");
      }
    } catch (e) {
      print("Alguma coisa deu errado: ${e.toString()}");
    }

    return coffes;
  }

  @override
Future<CoffeModel> getaSingleProduct(int id) async {
    late CoffeModel coffe;
    final response = await dio.get("/api/$id");

    try {
      if (response.statusCode == 200) {
        // Se a resposta for uma lista, você deve buscar o item dentro dela.
        if (response.data is List && response.data.isNotEmpty) {
          coffe = CoffeModel.fromMap(
              response.data[0]); // Pega o primeiro item da lista
        } else if (response.data is Map) {
          coffe =
              CoffeModel.fromMap(response.data); // Caso seja um único objeto
        } else {
          throw Exception("Resposta inesperada");
        }

        printJson(response.data);
      } else {
        print("Resposta não é uma lista ou status code não é 200");
      }
    } catch (e) {
      print("Alguma coisa deu errado: ${e.toString()}");
    }

    return coffe;
  }

}
