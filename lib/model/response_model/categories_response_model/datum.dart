class Datum {
  int? id;
  String? name;
  String? description;
  dynamic? price;
  List<dynamic>? suggestions;

  Datum({
    this.id,
    this.name,
    this.description,
    this.price,
    this.suggestions,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as dynamic?,
        suggestions: json['suggestions'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'suggestions': suggestions,
      };
}
