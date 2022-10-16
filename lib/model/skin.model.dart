class SkinInfo {
  String? name;
  String? type;
  int? rate;
  String? rarity;
  int? cost;
  int? color;
  String? description;
  String? image;

  SkinInfo(
      {this.name,
      this.type,
      this.rate,
      this.rarity,
      this.cost,
      this.color,
      this.description,
      this.image});

  SkinInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    rate = json['rate'];
    rarity = json['rarity'];
    cost = json['cost'];
    color = json['color'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['rate'] = rate;
    data['rarity'] = rarity;
    data['cost'] = cost;
    data['color'] = color;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
