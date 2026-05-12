class Account {
  String name;
  String email;
  String bio;
  String profilePic;

  Account({
    required this.name,
    required this.email,
    required this.bio,
    this.profilePic = "https://via.placeholder.com/150",
  });
}
