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

  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        stars: json['stars'],
        people: json['people'],
        img: json['img'],
        location: json['location'],
      );
}
