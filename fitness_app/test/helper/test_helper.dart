import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

String jsonHelper(String fileName) => File('test/helper/$fileName.json').readAsStringSync();

class MockDio extends Mock implements Dio {}
