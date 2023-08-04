class DataResponse {
  DataResponse({
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.people,
    required this.img,
    required this.location,
  });

  String? name;
  String? description;
  int? price;
  int? stars;
  int? people;
  String? img;
  String? location;

  DataResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    people = json['people'];
    img = json['img'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['stars'] = stars;
    data['people'] = people;
    data['img'] = img;
    data['location'] = location;
    return data;
  }
}
