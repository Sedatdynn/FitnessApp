part of '../view/diet_view.dart';

class _TopInfoWidget extends StatelessWidget {
  const _TopInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.keyTextMainColor,
        borderRadius: BorderRadius.circular(24.w),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
      ),
    );
  }
}

class _InitialPointField extends StatelessWidget {
  const _InitialPointField();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.instance.fetchCurrentUserDoc(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            if (snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Initial point:", style: context.textTheme.titleSmall),
                  Text("${snapshot.data?["userRightPoint"].toString() ?? 0} ",
                      style: context.textTheme.titleSmall),
                ],
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

class _SavedPointField extends StatelessWidget {
  const _SavedPointField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCubit, DietState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Saved daily point is:",
              style: context.textTheme.titleSmall,
            ),
            Text(
              "${state.lastSavedPoint}",
              style: context.textTheme.titleSmall,
            ),
          ],
        );
      },
    );
  }
}

class _CurrentPointField extends StatelessWidget {
  const _CurrentPointField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCubit, DietState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Current point is:",
              style: context.textTheme.titleSmall,
            ),
            Text(
              "${state.currentTotalPoint}",
              style: context.textTheme.titleSmall,
            ),
          ],
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
        SizedBox(
          height: 30.h,
          width: 140.w,
          child: CommonButton(
            color: AppColors.green,
            text: "Save Point",
            onPressed: () async => context.read<DietCubit>().savePoint(),
          ),
        ),
        CustomSize.minWidth(),
        SizedBox(
          height: 30.h,
          width: 140.w,
          child: CommonButton(
            color: AppColors.error,
            text: "Reset Point",
            onPressed: () async => context.read<DietCubit>().resetPoint(),
          ),
        )
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
                    borderRadius: BorderRadius.circular(14.0),
                    color: AppColors.mainPrimary,
                  ),
                  child: Text(
                    state.foods[i].name.toString(),
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                _FoodOptionsBody(index: i)
              ],
            );
          },
        );
      },
    );
  }
}

class _FoodOptionsBody extends StatelessWidget {
  final int index;
  const _FoodOptionsBody({required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietCubit, DietState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: state.foods[index].icerik!.length,
          itemBuilder: (BuildContext ctx, int j) {
            return Card(
              color: AppColors.backgroundColor,
              child: Row(children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    state.foods[index].icerik![j].isim.toString(),
                    style: context.textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "${state.foods[index].icerik![j].puan!.toDouble()} point",
                  style: context.textTheme.titleSmall,
                ),
                Checkbox(
                    activeColor: AppColors.mainPrimary,
                    value: state.foods[index].icerik![j].kontrol,
                    onChanged: (value) =>
                        context.read<DietCubit>().checkBoxActivity(index, j, value!)),
              ]),
            );
          },
        );
      },
    );
  }
}
