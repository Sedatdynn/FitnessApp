import 'dart:convert';

import 'package:fistness_app_firebase/product/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helper/test_helper.dart';

void main() {
  const testModel = UserModel.example();

  final tJson = jsonHelper('user');
  final tMap = jsonDecode(tJson) as Map<String, dynamic>;

  test('fromJson', () {
    //act
    final result = const UserModel().fromJson(tMap);

    //assert
    expect(result, testModel);
  });

  test('toJson', () {
    //act
    final result = testModel.toJson();

    //assert
    expect(result, tMap);
  });

  test('copyWith', () {
    //act
    final result = testModel.copyWith(email: 'new_email@example.com');

    //assert
    expect(result.email, equals('new_email@example.com'));
  });

  test('equatable', () {
    const user1 = UserModel(
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
    const user2 = UserModel(
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
    const user3 = UserModel(
      username: 'sedatD',
      email: 'sedat@example.com',
      password: '1234z56',
      name: 'sedat dayan',
      gender: 'male',
      age: 21,
      mobility: 'active',
      height: 110,
      weight: 88,
      userRightPoint: 36,
    );

    //assert

    /// first user equals to user2
    expect(user1, equals(user2));

    /// first user is not equals to user3
    expect(user1, isNot(equals(user3)));
  });
}
