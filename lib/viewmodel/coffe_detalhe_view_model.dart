import 'package:coffee_shop/data/repository/coffe_repository.dart';
import 'package:coffee_shop/model/cofee_model.dart';
import 'package:coffee_shop/utils/events/enavigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoffeDetalheViewModel extends ChangeNotifier {
  final repository = Modular.get<CoffeRepository>();
  final navigation = Modular.get<ENavigation>();

  CoffeModel? _coffe; // Tornando como nullable
  CoffeModel? get coffe =>
      _coffe; // Pode ser null quando o produto não for encontrado

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> findCoffe(int id) async {
    _setLoading(true);
    _errorMessage = null;
    try {
      var resultCoffe = await repository.getaSingleProduct(id);
      if (resultCoffe != null) {
        _coffe = resultCoffe;
        print("Produto encontrado: ${_coffe?.name!}");
      } else {
        _errorMessage = "Produto não encontrado!";
        print("Produto não encontrado para o id: $id");
      }
    } catch (e) {
      _errorMessage = "Erro ao carregar os dados: $e";
      print("Erro ao inicializar dados: $e");
    } finally {
      _setLoading(false);
    }
  }

  backToHome() {
    navigation.goToBack();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
