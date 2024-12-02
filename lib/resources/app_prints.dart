import 'dart:convert';
import "dart:developer" as dev;

void printJson(dynamic jsonData) {
  if (jsonData == null) {
    print("Os dados JSON são nulos");
    dev.log("Os dados JSON são nulos");
    return;
  }

  try {
    final jsonString =
        jsonEncode(jsonData); // Converte qualquer estrutura para string JSON
    print(jsonString);
    dev.log(jsonString);
  } catch (e) {
    print("Erro ao converter dados para JSON: ${e.toString()}");
    dev.log("Erro ao converter dados para JSON: ${e.toString()}");
  }
}
