import 'package:fistness_app_firebase/feature/auth/age/age_shelf.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class ExerciseViewShimmer extends StatelessWidget {
  const ExerciseViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: AppColors.mainPrimary,
      child: SizedBox(
        height: context.dynamicHeight(1),
        child: CustomScrollView(
          slivers: [
            SliverList.list(
              children: List.generate(20, (_) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 60,
                    height: 50,
                  ),
                  title: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 60,
                    height: 50,
                  ),
                  trailing: const SizedBox(
                    height: 10,
                    width: 10,
                    child: Icon(
                      Icons.chevron_right_outlined,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
