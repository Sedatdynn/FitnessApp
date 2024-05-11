import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/auth/weight/weight_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widget/weight_widget.dart';

@RoutePage()
class WeightView extends StatelessWidget {
  const WeightView({required this.params, super.key});
  final WeightParams params;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeightCubit(),
      child: BlocListener<WeightCubit, WeightState>(
        listener: (context, state) async {
          // listen the error message which is inside the state and show toast message while getting the error
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            await warningToast(state.errorMessage!);
            await Future<void>.delayed(const Duration(seconds: 1))
                .then((value) => context.read<WeightCubit>().clearErrorMessage());
          }
        },
        listenWhen: (previous, current) => previous.errorMessage != current.errorMessage,
        child: _ScaffoldBodyWidget(params: params),
      ),
    );
  }
}

class _ScaffoldBodyWidget extends StatelessWidget {
  const _ScaffoldBodyWidget({
    required this.params,
  });

  final WeightParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const AppPadding.minAll(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoBody(),
              CustomSize.xxLargeHeight(),
              const RegisterInfoQuestionText(text: LocaleKeys.Question_weightText),
              CustomSize.xxLargeHeight(),
              const _WeightNumberPicker(),
              CustomSize.xxLargeHeight(),
              CustomSize.xxLargeHeight(),
              _CompleteButton(params: params),
            ],
          ),
        ),
      ),
    );
  }
}
