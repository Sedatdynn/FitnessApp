import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable(createToJson: false)
class TokenModel extends Equatable {
  const TokenModel({this.token});

  @override
  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return _$TokenModelFromJson(json);
  }
  final String? token;

  @override
  List<Object?> get props => [token];
}
