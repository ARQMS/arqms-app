import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

///Represents the user model
@JsonSerializable(explicitToJson: true)
class User {
  ///The associated email address
  @JsonKey(name: 'email', required: true, includeIfNull: false)
  final String email;

  const User({
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          email == other.email;

  @override
  int get hashCode =>
      email.hashCode;

  @override
  String toString() =>
      'User{'
      'email: $email'
      '}';

}
