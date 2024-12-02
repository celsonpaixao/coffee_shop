import 'package:coffee_shop/data/repository/coffe_repository.dart';
import 'package:coffee_shop/model/cofee_model.dart';
import 'package:coffee_shop/utils/events/enavigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeViewModel extends ChangeNotifier {
  final repository = Modular.get<CoffeRepository>();
  final navigation = Modular.get<ENavigation>();

  List<CoffeModel> _coffes = [];
  List<CoffeModel> get coffes => _coffes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> initialize() async {
    if (_coffes.isNotEmpty) return;

    _setLoading(true);
    _errorMessage = null;
    try {
      var listCoffeModel = await repository.getallproducts();
      _coffes.addAll(listCoffeModel);
    } catch (e) {
      _errorMessage =
          "Erro ao carregar os dados: $e"; // Armazenando a mensagem de erro
      print("Erro ao inicializar dados: $e");
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  navigateToDetalhePage(int id) {
    navigation.navigateToCoffeDEtalhePage(id);
  }
}
