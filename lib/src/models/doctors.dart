class Doctors {
  int id;
  String name;
  double rating;
  int comments;
  double distance;
  String speciality;
  String image;
  List<String> get hoursAvailable => [
        '07:00 AM',
        '08:00 AM',
        '09:00 AM',
        '10:00 AM',
        '01:00 PM',
        '02:00 PM',
        '03:00 PM',
        '04:00 PM'
      ];

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
