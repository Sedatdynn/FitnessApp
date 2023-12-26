part of '../view/launch_view.dart';

class _TitleTextWidget extends StatelessWidget {
  const _TitleTextWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        MyText.fitText,
        style: context.textTheme.displaySmall?.copyWith(color: AppColors.mainPrimary),
      ),
    );
  }
}

class _EmailButton extends StatelessWidget {
  const _EmailButton();

  @override
  Widget build(BuildContext context) {
    return AuthButton(
      buttonText: RegisterText.signEmailText,
      icon: const Icon(
        Icons.email_outlined,
        color: AppColors.whiteText,
        size: 32,
      ),
      onPressed: () {
        RouteManager.instance.pushNamed(path: RouteConstants.login);
      },
    );
  }
}

class _GoogleButton extends StatelessWidget {
  const _GoogleButton();

  @override
  Widget build(BuildContext context) {
    return AuthButton(
      color: AppColors.shadeGreyColor,
      textColor: AppColors.darkText,
      buttonText: RegisterText.googleText,
      icon: SizedBox(height: 32, child: ImagePath.google.toPng()),
      onPressed: () async {
        bool? isSuccess = await AuthService.instance.signInWithGoogle();
        if (isSuccess) {
          RouteManager.instance.pushAndPopUntil(const MainRoute());
        }
      },
    );
  }
}

class _AccountsInfoTextWidget extends StatelessWidget {
  const _AccountsInfoTextWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          QuestionsText.accountText,
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(width: 5.w),
        InkWell(
          onTap: () {
            RouteManager.instance.pushNamed(path: RouteConstants.register);
          },
          child: Text(
            RegisterText.createText,
            style: context.textTheme.bodyLarge?.copyWith(color: AppColors.mainPrimary),
          ),
        ),
      ],
    );
  }
}
