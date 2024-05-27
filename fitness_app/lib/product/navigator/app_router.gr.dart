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
        child: AgeView(
          params: args.params,
          key: args.key,
        ),
      );
    },
    BmiCalculatorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BmiCalculatorView(),
      );
    },
    DailyMobilityRoute.name: (routeData) {
      final args = routeData.argsAs<DailyMobilityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DailyMobilityView(
          params: args.params,
          key: args.key,
        ),
      );
    },
    DetailExercisesRoute.name: (routeData) {
      final args = routeData.argsAs<DetailExercisesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailExercisesView(
          items: args.items,
          key: args.key,
        ),
      );
    },
    DetailVideoRoute.name: (routeData) {
      final args = routeData.argsAs<DetailVideoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailVideoView(
          items: args.items,
          key: args.key,
        ),
      );
    },
    DietRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DietView(),
      );
    },
    ExercisesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExercisesView(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordView(),
      );
    },
    GenderRoute.name: (routeData) {
      final args = routeData.argsAs<GenderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GenderView(
          params: args.params,
          key: args.key,
        ),
      );
    },
    HeightRoute.name: (routeData) {
      final args = routeData.argsAs<HeightRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HeightView(
          params: args.params,
          key: args.key,
        ),
      );
    },
    InitialRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialView(),
      );
    },
    LaunchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LaunchView(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginView(
          key: args.key,
          canPop: args.canPop,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    UpdateInfosRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateInfosView(),
      );
    },
    WeightRoute.name: (routeData) {
      final args = routeData.argsAs<WeightRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WeightView(
          params: args.params,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [AgeView]
class AgeRoute extends PageRouteInfo<AgeRouteArgs> {
  AgeRoute({
    required AgeParams params,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AgeRoute.name,
          args: AgeRouteArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AgeRoute';

  static const PageInfo<AgeRouteArgs> page = PageInfo<AgeRouteArgs>(name);
}

class AgeRouteArgs {
  const AgeRouteArgs({
    required this.params,
    this.key,
  });

  final AgeParams params;

  final Key? key;

  @override
  String toString() {
    return 'AgeRouteArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [BmiCalculatorView]
class BmiCalculatorRoute extends PageRouteInfo<void> {
  const BmiCalculatorRoute({List<PageRouteInfo>? children})
      : super(
          BmiCalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'BmiCalculatorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DailyMobilityView]
class DailyMobilityRoute extends PageRouteInfo<DailyMobilityRouteArgs> {
  DailyMobilityRoute({
    required MobilityParams params,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DailyMobilityRoute.name,
          args: DailyMobilityRouteArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DailyMobilityRoute';

  static const PageInfo<DailyMobilityRouteArgs> page =
      PageInfo<DailyMobilityRouteArgs>(name);
}

class DailyMobilityRouteArgs {
  const DailyMobilityRouteArgs({
    required this.params,
    this.key,
  });

  final MobilityParams params;

  final Key? key;

  @override
  String toString() {
    return 'DailyMobilityRouteArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [DetailExercisesView]
class DetailExercisesRoute extends PageRouteInfo<DetailExercisesRouteArgs> {
  DetailExercisesRoute({
    required Exercise items,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailExercisesRoute.name,
          args: DetailExercisesRouteArgs(
            items: items,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailExercisesRoute';

  static const PageInfo<DetailExercisesRouteArgs> page =
      PageInfo<DetailExercisesRouteArgs>(name);
}

class DetailExercisesRouteArgs {
  const DetailExercisesRouteArgs({
    required this.items,
    this.key,
  });

  final Exercise items;

  final Key? key;

  @override
  String toString() {
    return 'DetailExercisesRouteArgs{items: $items, key: $key}';
  }
}

/// generated route for
/// [DetailVideoView]
class DetailVideoRoute extends PageRouteInfo<DetailVideoRouteArgs> {
  DetailVideoRoute({
    required VideoPageData items,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailVideoRoute.name,
          args: DetailVideoRouteArgs(
            items: items,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailVideoRoute';

  static const PageInfo<DetailVideoRouteArgs> page =
      PageInfo<DetailVideoRouteArgs>(name);
}

class DetailVideoRouteArgs {
  const DetailVideoRouteArgs({
    required this.items,
    this.key,
  });

  final VideoPageData items;

  final Key? key;

  @override
  String toString() {
    return 'DetailVideoRouteArgs{items: $items, key: $key}';
  }
}

/// generated route for
/// [DietView]
class DietRoute extends PageRouteInfo<void> {
  const DietRoute({List<PageRouteInfo>? children})
      : super(
          DietRoute.name,
          initialChildren: children,
        );

  static const String name = 'DietRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExercisesView]
class ExercisesRoute extends PageRouteInfo<void> {
  const ExercisesRoute({List<PageRouteInfo>? children})
      : super(
          ExercisesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExercisesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordView]
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
/// [GenderView]
class GenderRoute extends PageRouteInfo<GenderRouteArgs> {
  GenderRoute({
    required GenderParams params,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GenderRoute.name,
          args: GenderRouteArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GenderRoute';

  static const PageInfo<GenderRouteArgs> page = PageInfo<GenderRouteArgs>(name);
}

class GenderRouteArgs {
  const GenderRouteArgs({
    required this.params,
    this.key,
  });

  final GenderParams params;

  final Key? key;

  @override
  String toString() {
    return 'GenderRouteArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [HeightView]
class HeightRoute extends PageRouteInfo<HeightRouteArgs> {
  HeightRoute({
    required HeightParams params,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HeightRoute.name,
          args: HeightRouteArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HeightRoute';

  static const PageInfo<HeightRouteArgs> page = PageInfo<HeightRouteArgs>(name);
}

class HeightRouteArgs {
  const HeightRouteArgs({
    required this.params,
    this.key,
  });

  final HeightParams params;

  final Key? key;

  @override
  String toString() {
    return 'HeightRouteArgs{params: $params, key: $key}';
  }
}

/// generated route for
/// [InitialView]
class InitialRoute extends PageRouteInfo<void> {
  const InitialRoute({List<PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LaunchView]
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
/// [LoginView]
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
/// [MainView]
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
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterView]
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
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateInfosView]
class UpdateInfosRoute extends PageRouteInfo<void> {
  const UpdateInfosRoute({List<PageRouteInfo>? children})
      : super(
          UpdateInfosRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateInfosRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeightView]
class WeightRoute extends PageRouteInfo<WeightRouteArgs> {
  WeightRoute({
    required WeightParams params,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WeightRoute.name,
          args: WeightRouteArgs(
            params: params,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WeightRoute';

  static const PageInfo<WeightRouteArgs> page = PageInfo<WeightRouteArgs>(name);
}

class WeightRouteArgs {
  const WeightRouteArgs({
    required this.params,
    this.key,
  });

  final WeightParams params;

  final Key? key;

  @override
  String toString() {
    return 'WeightRouteArgs{params: $params, key: $key}';
  }
}
