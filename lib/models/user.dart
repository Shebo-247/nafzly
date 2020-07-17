class User {
  String userID,
      userFirstName,
      userLastName,
      userAddress,
      userProfile,
      userJobTitle,
      userBio,
      userHourRate;

  User({
    this.userID,
    this.userFirstName,
    this.userLastName,
    this.userAddress,
    this.userProfile,
    this.userJobTitle,
    this.userBio,
    this.userHourRate,
  });

  toJson() {
    return {
      "userID": this.userID,
      "userFirstName": this.userFirstName,
      "userLastName": this.userLastName,
      "userAddress": this.userAddress,
      "userProfile": this.userProfile,
      "userJobTitle": this.userJobTitle,
      "userBio": this.userBio,
      "userHourRate": this.userHourRate
    };
  }
}
