// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AgeRoute.name: (routeData) {
      final args = routeData.argsAs<AgeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AgePage(
          key: args.key,
          username: args.username,
          mail: args.mail,
          password: args.password,
          uid: args.uid,
          name: args.name,
          gender: args.gender,
        ),
      );
    },
    DailyMobilityRoute.name: (routeData) {
      final args = routeData.argsAs<DailyMobilityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DailyMobilityPage(
          key: args.key,
          username: args.username,
          mail: args.mail,
          password: args.password,
          uid: args.uid,
          name: args.name,
          gender: args.gender,
          age: args.age,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    GenderRoute.name: (routeData) {
      final args = routeData.argsAs<GenderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GenderPage(
          key: args.key,
          username: args.username,
          mail: args.mail,
          name: args.name,
          password: args.password,
          uid: args.uid,
        ),
      );
    },
    HeightRoute.name: (routeData) {
      final args = routeData.argsAs<HeightRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HeightPage(
          key: args.key,
          username: args.username,
          mail: args.mail,
          password: args.password,
          uid: args.uid,
          name: args.name,
          gender: args.gender,
          age: args.age,
          mobility: args.mobility,
        ),
      );
    },
    LaunchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LaunchPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          canPop: args.canPop,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    RegisterNameRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterNameRouteArgs>(
          orElse: () => const RegisterNameRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterNamePage(
          key: args.key,
          username: args.username,
          mail: args.mail,
          password: args.password,
          uid: args.uid,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    WeightRoute.name: (routeData) {
      final args = routeData.argsAs<WeightRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WeightPage(
          key: args.key,
          username: args.username,
          mail: args.mail,
          password: args.password,
          uid: args.uid,
          name: args.name,
          gender: args.gender,
          age: args.age,
          height: args.height,
          mobility: args.mobility,
        ),
      );
    },
  };
}

/// generated route for
/// [AgePage]
class AgeRoute extends PageRouteInfo<AgeRouteArgs> {
  AgeRoute({
    Key? key,
    String? username,
    String? mail,
    String? password,
    required String uid,
    String? name,
    String? gender,
    List<PageRouteInfo>? children,
  }) : super(
          AgeRoute.name,
          args: AgeRouteArgs(
            key: key,
            username: username,
            mail: mail,
            password: password,
            uid: uid,
            name: name,
            gender: gender,
          ),
          initialChildren: children,
        );

  static const String name = 'AgeRoute';

  static const PageInfo<AgeRouteArgs> page = PageInfo<AgeRouteArgs>(name);
}

class AgeRouteArgs {
  const AgeRouteArgs({
    this.key,
    this.username,
    this.mail,
    this.password,
    required this.uid,
    this.name,
    this.gender,
  });

  final Key? key;

  final String? username;

  final String? mail;

  final String? password;

  final String uid;

  final String? name;

  final String? gender;

  @override
  String toString() {
    return 'AgeRouteArgs{key: $key, username: $username, mail: $mail, password: $password, uid: $uid, name: $name, gender: $gender}';
  }
}

/// generated route for
/// [DailyMobilityPage]
class DailyMobilityRoute extends PageRouteInfo<DailyMobilityRouteArgs> {
  DailyMobilityRoute({
    Key? key,
    String? username,
    String? mail,
    String? password,
    required String uid,
    String? name,
    String? gender,
    int? age,
    List<PageRouteInfo>? children,
  }) : super(
          DailyMobilityRoute.name,
          args: DailyMobilityRouteArgs(
            key: key,
            username: username,
            mail: mail,
            password: password,
            uid: uid,
            name: name,
            gender: gender,
            age: age,
          ),
          initialChildren: children,
        );

  static const String name = 'DailyMobilityRoute';

  static const PageInfo<DailyMobilityRouteArgs> page =
      PageInfo<DailyMobilityRouteArgs>(name);
}

class DailyMobilityRouteArgs {
  const DailyMobilityRouteArgs({
    this.key,
    this.username,
    this.mail,
    this.password,
    required this.uid,
    this.name,
    this.gender,
    this.age,
  });

  final Key? key;

  final String? username;

  final String? mail;

  final String? password;

  final String uid;

  final String? name;

  final String? gender;

  final int? age;

  @override
  String toString() {
    return 'DailyMobilityRouteArgs{key: $key, username: $username, mail: $mail, password: $password, uid: $uid, name: $name, gender: $gender, age: $age}';
  }
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GenderPage]
class GenderRoute extends PageRouteInfo<GenderRouteArgs> {
  GenderRoute({
    Key? key,
    String? username,
    String? mail,
    String? name,
    String? password,
    required String uid,
    List<PageRouteInfo>? children,
  }) : super(
          GenderRoute.name,
          args: GenderRouteArgs(
            key: key,
            username: username,
            mail: mail,
            name: name,
            password: password,
            uid: uid,
          ),
          initialChildren: children,
        );

  static const String name = 'GenderRoute';

  static const PageInfo<GenderRouteArgs> page = PageInfo<GenderRouteArgs>(name);
}

class GenderRouteArgs {
  const GenderRouteArgs({
    this.key,
    this.username,
    this.mail,
    this.name,
    this.password,
    required this.uid,
  });

  final Key? key;

  final String? username;

  final String? mail;

  final String? name;

  final String? password;

  final String uid;

  @override
  String toString() {
    return 'GenderRouteArgs{key: $key, username: $username, mail: $mail, name: $name, password: $password, uid: $uid}';
  }
}

/// generated route for
/// [HeightPage]
class HeightRoute extends PageRouteInfo<HeightRouteArgs> {
  HeightRoute({
    Key? key,
    String? username,
    String? mail,
    String? password,
    required String uid,
    String? name,
    String? gender,
    int? age,
    String? mobility,
    List<PageRouteInfo>? children,
  }) : super(
          HeightRoute.name,
          args: HeightRouteArgs(
            key: key,
            username: username,
            mail: mail,
            password: password,
            uid: uid,
            name: name,
            gender: gender,
            age: age,
            mobility: mobility,
          ),
          initialChildren: children,
        );

  static const String name = 'HeightRoute';

  static const PageInfo<HeightRouteArgs> page = PageInfo<HeightRouteArgs>(name);
}

class HeightRouteArgs {
  const HeightRouteArgs({
    this.key,
    this.username,
    this.mail,
    this.password,
    required this.uid,
    this.name,
    this.gender,
    this.age,
    this.mobility,
  });

  final Key? key;

  final String? username;

  final String? mail;

  final String? password;

  final String uid;

  final String? name;

  final String? gender;

  final int? age;

  final String? mobility;

  @override
  String toString() {
    return 'HeightRouteArgs{key: $key, username: $username, mail: $mail, password: $password, uid: $uid, name: $name, gender: $gender, age: $age, mobility: $mobility}';
  }
}

/// generated route for
/// [LaunchPage]
class LaunchRoute extends PageRouteInfo<void> {
  const LaunchRoute({List<PageRouteInfo>? children})
      : super(
          LaunchRoute.name,
          initialChildren: children,
        );

  static const String name = 'LaunchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    bool? canPop = true,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            canPop: canPop,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.canPop = true,
  });

  final Key? key;

  final bool? canPop;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, canPop: $canPop}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterNamePage]
class RegisterNameRoute extends PageRouteInfo<RegisterNameRouteArgs> {
  RegisterNameRoute({
    Key? key,
    String? username,
    String? mail,
    String? password,
    String? uid,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterNameRoute.name,
          args: RegisterNameRouteArgs(
            key: key,
            username: username,
            mail: mail,
            password: password,
            uid: uid,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterNameRoute';

  static const PageInfo<RegisterNameRouteArgs> page =
      PageInfo<RegisterNameRouteArgs>(name);
}

class RegisterNameRouteArgs {
  const RegisterNameRouteArgs({
    this.key,
    this.username,
    this.mail,
    this.password,
    this.uid,
  });

  final Key? key;

  final String? username;

  final String? mail;

  final String? password;

  final String? uid;

  @override
  String toString() {
    return 'RegisterNameRouteArgs{key: $key, username: $username, mail: $mail, password: $password, uid: $uid}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeightPage]
class WeightRoute extends PageRouteInfo<WeightRouteArgs> {
  WeightRoute({
    Key? key,
    String? username,
    String? mail,
    String? password,
    required String uid,
    String? name,
    String? gender,
    int? age,
    int? height,
    String? mobility,
    List<PageRouteInfo>? children,
  }) : super(
          WeightRoute.name,
          args: WeightRouteArgs(
            key: key,
            username: username,
            mail: mail,
            password: password,
            uid: uid,
            name: name,
            gender: gender,
            age: age,
            height: height,
            mobility: mobility,
          ),
          initialChildren: children,
        );

  static const String name = 'WeightRoute';

  static const PageInfo<WeightRouteArgs> page = PageInfo<WeightRouteArgs>(name);
}

class WeightRouteArgs {
  const WeightRouteArgs({
    this.key,
    this.username,
    this.mail,
    this.password,
    required this.uid,
    this.name,
    this.gender,
    this.age,
    this.height,
    this.mobility,
  });

  final Key? key;

  final String? username;

  final String? mail;

  final String? password;

  final String uid;

  final String? name;

  final String? gender;

  final int? age;

  final int? height;

  final String? mobility;

  @override
  String toString() {
    return 'WeightRouteArgs{key: $key, username: $username, mail: $mail, password: $password, uid: $uid, name: $name, gender: $gender, age: $age, height: $height, mobility: $mobility}';
  }
}
