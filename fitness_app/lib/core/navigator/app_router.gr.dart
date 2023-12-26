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
          key: args.key,
          params: args.params,
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
          key: args.key,
          params: args.params,
        ),
      );
    },
    DetailExercisesRoute.name: (routeData) {
      final args = routeData.argsAs<DetailExercisesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailExercisesView(
          key: args.key,
          items: args.items,
          images: args.images,
        ),
      );
    },
    DetailVideoRoute.name: (routeData) {
      final args = routeData.argsAs<DetailVideoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailVideoView(
          key: args.key,
          items: args.items,
        ),
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
          key: args.key,
          params: args.params,
        ),
      );
    },
    HeightRoute.name: (routeData) {
      final args = routeData.argsAs<HeightRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HeightView(
          key: args.key,
          params: args.params,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
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
          key: args.key,
          params: args.params,
        ),
      );
    },
  };
}

/// generated route for
/// [AgeView]
class AgeRoute extends PageRouteInfo<AgeRouteArgs> {
  AgeRoute({
    Key? key,
    required AgeParams params,
    List<PageRouteInfo>? children,
  }) : super(
          AgeRoute.name,
          args: AgeRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'AgeRoute';

  static const PageInfo<AgeRouteArgs> page = PageInfo<AgeRouteArgs>(name);
}

class AgeRouteArgs {
  const AgeRouteArgs({
    this.key,
    required this.params,
  });

  final Key? key;

  final AgeParams params;

  @override
  String toString() {
    return 'AgeRouteArgs{key: $key, params: $params}';
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
    Key? key,
    required MobilityParams params,
    List<PageRouteInfo>? children,
  }) : super(
          DailyMobilityRoute.name,
          args: DailyMobilityRouteArgs(
            key: key,
            params: params,
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
    required this.params,
  });

  final Key? key;

  final MobilityParams params;

  @override
  String toString() {
    return 'DailyMobilityRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [DetailExercisesView]
class DetailExercisesRoute extends PageRouteInfo<DetailExercisesRouteArgs> {
  DetailExercisesRoute({
    Key? key,
    required List<CategoryData> items,
    required Exercise images,
    List<PageRouteInfo>? children,
  }) : super(
          DetailExercisesRoute.name,
          args: DetailExercisesRouteArgs(
            key: key,
            items: items,
            images: images,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailExercisesRoute';

  static const PageInfo<DetailExercisesRouteArgs> page =
      PageInfo<DetailExercisesRouteArgs>(name);
}

class DetailExercisesRouteArgs {
  const DetailExercisesRouteArgs({
    this.key,
    required this.items,
    required this.images,
  });

  final Key? key;

  final List<CategoryData> items;

  final Exercise images;

  @override
  String toString() {
    return 'DetailExercisesRouteArgs{key: $key, items: $items, images: $images}';
  }
}

/// generated route for
/// [DetailVideoView]
class DetailVideoRoute extends PageRouteInfo<DetailVideoRouteArgs> {
  DetailVideoRoute({
    Key? key,
    required VideoPageData items,
    List<PageRouteInfo>? children,
  }) : super(
          DetailVideoRoute.name,
          args: DetailVideoRouteArgs(
            key: key,
            items: items,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailVideoRoute';

  static const PageInfo<DetailVideoRouteArgs> page =
      PageInfo<DetailVideoRouteArgs>(name);
}

class DetailVideoRouteArgs {
  const DetailVideoRouteArgs({
    this.key,
    required this.items,
  });

  final Key? key;

  final VideoPageData items;

  @override
  String toString() {
    return 'DetailVideoRouteArgs{key: $key, items: $items}';
  }
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
    Key? key,
    required GenderParams params,
    List<PageRouteInfo>? children,
  }) : super(
          GenderRoute.name,
          args: GenderRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'GenderRoute';

  static const PageInfo<GenderRouteArgs> page = PageInfo<GenderRouteArgs>(name);
}

class GenderRouteArgs {
  const GenderRouteArgs({
    this.key,
    required this.params,
  });

  final Key? key;

  final GenderParams params;

  @override
  String toString() {
    return 'GenderRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [HeightView]
class HeightRoute extends PageRouteInfo<HeightRouteArgs> {
  HeightRoute({
    Key? key,
    required HeightParams params,
    List<PageRouteInfo>? children,
  }) : super(
          HeightRoute.name,
          args: HeightRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'HeightRoute';

  static const PageInfo<HeightRouteArgs> page = PageInfo<HeightRouteArgs>(name);
}

class HeightRouteArgs {
  const HeightRouteArgs({
    this.key,
    required this.params,
  });

  final Key? key;

  final HeightParams params;

  @override
  String toString() {
    return 'HeightRouteArgs{key: $key, params: $params}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

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
    Key? key,
    required WeightParams params,
    List<PageRouteInfo>? children,
  }) : super(
          WeightRoute.name,
          args: WeightRouteArgs(
            key: key,
            params: params,
          ),
          initialChildren: children,
        );

  static const String name = 'WeightRoute';

  static const PageInfo<WeightRouteArgs> page = PageInfo<WeightRouteArgs>(name);
}

class WeightRouteArgs {
  const WeightRouteArgs({
    this.key,
    required this.params,
  });

  final Key? key;

  final WeightParams params;

  @override
  String toString() {
    return 'WeightRouteArgs{key: $key, params: $params}';
  }
}
