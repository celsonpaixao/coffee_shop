import 'dart:convert';

class CoffeModel {
  int? id;
  String? name;
  String? description;
  double? price;
  String? region;
  int? weight;
  List<String>? flavorProfile;
  List<String>? grindOption;
  int? roast_level;
  String? imageUrl;

  CoffeModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.region,
    this.weight,
    this.flavorProfile,
    this.grindOption,
    this.roast_level,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'region': region,
      'weight': weight,
      'flavor_profile': flavorProfile,
      'grind_option': grindOption,
      'roast_level': roast_level,
      'image_url': imageUrl,
    };
  }

  factory CoffeModel.fromMap(Map<String, dynamic> map) {
    return CoffeModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      region: map['region'] != null ? map['region'] as String : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      flavorProfile: map['flavor_profile'] != null
          ? List<String>.from(map['flavor_profile'] as List)
          : null,
      grindOption: map['grind_option'] != null
          ? List<String>.from(map['grind_option'] as List)
          : null,
      roast_level:
          map['roast_level'] != null ? map['roast_level'] as int : null,
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoffeModel.fromJson(String source) =>
      CoffeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
