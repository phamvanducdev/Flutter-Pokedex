class Item {
  final String name;
  final String? imageUrl;
  final String category;
  final String effect;

  Item({
    required this.name,
    this.imageUrl,
    required this.category,
    required this.effect,
  });

  Item copyWith({
    String? name,
    String? imageUrl,
    String? category,
    String? effect,
  }) {
    return Item(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      effect: effect ?? this.effect,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'category': category,
      'effect': effect,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      effect: json['effect'],
    );
  }

  @override
  String toString() {
    return 'Item(name: $name, imageUrl: $imageUrl, category: $category, effect: $effect)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.effect == effect;
  }

  @override
  int get hashCode {
    return name.hashCode ^ imageUrl.hashCode ^ category.hashCode ^ effect.hashCode;
  }
}
