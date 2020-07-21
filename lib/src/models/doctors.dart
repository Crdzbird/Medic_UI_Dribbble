class Doctors {
  String speciality;
  String image;

  Doctors({this.speciality, this.image});

  factory Doctors.fromJson(Map<String, dynamic> json) => new Doctors(
        speciality: json["speciality"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "speciality": speciality,
        "image": image,
      };
}
