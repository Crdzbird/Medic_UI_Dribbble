class Doctors {
  int id;
  String name;
  double rating;
  double distance;
  String speciality;
  String image;

  Doctors(
      {this.id,
      this.name,
      this.rating,
      this.distance,
      this.speciality,
      this.image});

  factory Doctors.fromJson(Map<String, dynamic> json) => new Doctors(
        speciality: json["speciality"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "speciality": speciality,
        "image": image,
      };
}
