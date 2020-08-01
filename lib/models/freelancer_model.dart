class Freelancer {
  String id, firstName, lastName, address, image, jobTitle, bio;

  Freelancer({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.image,
    this.jobTitle,
    this.bio,
  });

  toJson() {
    return {
      "id": this.id,
      "firstName": this.firstName,
      "lastName": this.lastName,
      "address": this.address,
      "image": this.image,
      "jobTitle": this.jobTitle,
      "bio": this.bio,
    };
  }

  factory Freelancer.fromJson(Map<dynamic, dynamic> json) {
    return Freelancer(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      image: json['image'],
      jobTitle: json['jobTitle'],
      bio: json['bio'],
    );
  }
}
