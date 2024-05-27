import 'package:core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel<UserModel> {
  UserModel({
    this.username,
    this.email,
    this.name,
    this.password,
    this.gender,
    this.age,
    this.mobility,
    this.height,
    this.weight,
    this.userRightPoint,
  });

  // Empty constructor with default values
  UserModel.example()
      : this(
          username: 'sedatD',
          email: 'sedat@example.com',
          password: '123456',
          name: 'sedat dayan',
          gender: 'male',
          age: 26,
          mobility: 'active',
          height: 190,
          weight: 88,
          userRightPoint: 36,
        );
  final String? username;
  final String? email;
  final String? password;
  final String? name;
  final String? gender;
  final int? age;
  final String? mobility;
  final int? height;
  final int? weight;
  final int? userRightPoint;
  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  Map<String, dynamic> toJsonWithoutPassword() {
    final json = _$UserModelToJson(this);
    json.remove('password');
    return json;
  }

  @override
  List<Object?> get props =>
      [username, email, name, password, gender, age, mobility, height, weight, userRightPoint];

  UserModel copyWith({
    String? username,
    String? email,
    String? name,
    String? password,
    String? gender,
    int? age,
    String? mobility,
    int? height,
    int? weight,
    int? userRightPoint,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      mobility: mobility ?? this.mobility,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      userRightPoint: userRightPoint ?? this.userRightPoint,
    );
  }
}
