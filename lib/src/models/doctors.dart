class Doctors {
  int id;
  String name;
  double rating;
  int comments;
  double distance;
  String speciality;
  String image;

  Doctors(
      {this.id,
      this.name,
      this.rating,
      this.comments,
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
