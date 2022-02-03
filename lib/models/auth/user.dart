import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

///Represents the user model
class User extends ParseUser implements ParseCloneable {
  String? name;

  User(String? username, String? password, String? email)
      : super(username, password, email);

  User.clone(Map<String, dynamic> map)
      : super(map[keyVarUsername], map[keyVarPassword], map[keyVarEmail]);

  static const String keyFirstname = "firstname";
  static const String keyLastname = "lastname";

  String? get firstname => get<String>(keyFirstname);
  set firstname(String? name) => set<String?>(keyFirstname, name);

  String? get lastname => get<String>(keyLastname);
  set lastname(String? name) => set<String?>(keyLastname, name);

  String get fullname => "${firstname ?? ""} ${lastname ?? ""}";

  @override
  clone(Map<String, dynamic> map) => User.clone(map)..fromJson(map);
}
