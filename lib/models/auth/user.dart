import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

///Represents the user model
@JsonSerializable(explicitToJson: true)
class User {
  ///The associated email address
  @JsonKey(name: 'email', required: true, includeIfNull: false)
  final String email;
  ///The associated Name
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  ///The associated Firstname
  @JsonKey(name: 'firstname', includeIfNull: false)
  final String? firstname;

  const User({
    required this.email,
    this.name,
    this.firstname,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          name == other.name &&
          firstname == other.firstname;

  @override
  int get hashCode =>
      email.hashCode ^
      name.hashCode ^
      firstname.hashCode;

  @override
  String toString() =>
      'User{'
      'email: $email, '
      'name: $name, '
      'firstname: $firstname'
      '}';

}
