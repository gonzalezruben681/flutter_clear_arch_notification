class NotificationModel {
  final int id;
  final String name;
  final String image;
  final String species;

  const NotificationModel({
    required this.id,
    required this.name,
    required this.image,
    required this.species,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        species: json["species"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "species": species,
      };
}
