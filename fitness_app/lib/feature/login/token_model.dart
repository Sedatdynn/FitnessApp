import 'package:fistness_app_firebase/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable(createToJson: false)
class TokenModel extends BaseModel {
  final String? token;

  TokenModel({this.token});

  @override
  fromJson(Map<String, dynamic> json) {
    _$TokenModelFromJson(json);
  }

  @override
  List<Object?> get props => [token];
}
