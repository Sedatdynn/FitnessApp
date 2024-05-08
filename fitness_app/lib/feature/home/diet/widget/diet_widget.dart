part of '../view/diet_view.dart';

class _TopInfoWidget extends StatelessWidget {
  const _TopInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const AppPadding.minAll(),
      decoration: BoxDecoration(
        color: AppColors.keyTextMainColor,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        children: [
          const _InitialPointField(),
          CustomSize.minHeight(),
          const _SavedPointField(),
          CustomSize.minHeight(),
          const _CurrentPointField(),
          CustomSize.minHeight(),
          const _SaveResetButtons(),
          CustomSize.minHeight(),
        ],
      ),
    );
  }
}

class _InitialPointField extends StatelessWidget {
  const _InitialPointField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(LocaleKeys.Diet_InitialScore, style: context.textTheme.titleSmall).tr(),
          const Spacer(),
          BlocSelector<GlobalCubit, GlobalState, int?>(
            selector: (state) => state.user?.userRightPoint,
            builder: (context, userRightPoint) {
              return Text('${userRightPoint ?? 0}', style: context.textTheme.titleSmall);
            },
          ),
        ],
      ),
    );
  }
}

class _SavedPointField extends StatelessWidget {
  const _SavedPointField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DietCubit, DietState, double?>(
      selector: (state) => state.lastSavedPoint,
      builder: (context, lastSavedPoint) {
        return SizedBox(
          width: context.dynamicWidth(0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                LocaleKeys.Diet_savedDailyScore,
                style: context.textTheme.titleSmall,
              ).tr(),
              const Spacer(),
              Text(
                '$lastSavedPoint',
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CurrentPointField extends StatelessWidget {
  const _CurrentPointField();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DietCubit, DietState, double?>(
      selector: (state) => state.currentTotalPoint,
      builder: (context, currentTotalPoint) {
        return SizedBox(
          width: context.dynamicWidth(0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                LocaleKeys.Diet_currentScore,
                style: context.textTheme.titleSmall,
              ).tr(),
              const Spacer(),
              Text(
                '$currentTotalPoint',
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SaveResetButtons extends StatelessWidget {
  const _SaveResetButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CommonButton(
            color: AppColors.green,
            text: LocaleKeys.Diet_saveScore,
            onPressed: () async => context.read<DietCubit>().savePoint(),
          ),
        ),
        CustomSize.minWidth(),
        Expanded(
          child: CommonButton(
            color: AppColors.error,
            text: LocaleKeys.Diet_resetScore,
            onPressed: () async => context.read<DietCubit>().resetPoint(),
          ),
        ),
      ],
    );
  }
}

class _MainListViewBody extends StatelessWidget {
  const _MainListViewBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCubit, DietState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: state.foods.length,
          itemBuilder: (BuildContext ctxt, int i) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.mainPrimary,
                  ),
                  child: Text(
                    state.foods[i].name.toString(),
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                _FoodOptionsBody(index: i),
              ],
            );
          },
        );
      },
    );
  }
}

class _FoodOptionsBody extends StatelessWidget {
  const _FoodOptionsBody({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DietCubit, DietState, List<Kategori>>(
      selector: (state) => state.foods,
      builder: (context, foods) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: foods[index].icerik!.length,
          itemBuilder: (BuildContext ctx, int j) {
            return Card(
              color: context.theme.cardColor,
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      foods[index].icerik![j].isim.toString(),
                      style: context.textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '${foods[index].icerik![j].puan} ${LocaleKeys.Diet_score.tr()}',
                    style: context.textTheme.titleSmall,
                  ),
                  Checkbox(
                    activeColor: AppColors.mainPrimary,
                    value: foods[index].icerik![j].kontrol,
                    onChanged: (value) =>
                        context.read<DietCubit>().checkBoxActivity(index, j, value: value!),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
