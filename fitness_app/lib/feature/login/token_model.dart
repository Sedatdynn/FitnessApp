import 'package:json_annotation/json_annotation.dart';

import '../../core/base/model/base_model.dart';

part 'token_model.g.dart';

@JsonSerializable(createToJson: false)
class TokenModel extends BaseModel<TokenModel> {
  final String? token;

  TokenModel({this.token});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$TokenModelFromJson(json);
  }

  @override
  List<Object?> get props => [token];
}
