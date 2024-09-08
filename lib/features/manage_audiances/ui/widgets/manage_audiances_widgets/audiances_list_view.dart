import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/widgets/empty_state.dart';
import 'package:bulk_app/core/widgets/overlay_loading_state.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/audiance_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showcaseview/showcaseview.dart';

class AudiancesListView extends StatefulWidget {
  const AudiancesListView({super.key});

  @override
  State<AudiancesListView> createState() => _AudiancesListViewState();
}

class _AudiancesListViewState extends State<AudiancesListView> {
  final GlobalKey _one = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([_one]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageAudiancesCubit, ManageAudiancesState>(
      builder: (context, state) {
        return state.maybeWhen(
          audienceLoadingState: () => loadingSpinKit(),
          audienceEmptyState: () => const EmptyState(),
          audienceErrorState: (error) =>
              Center(child: Text(error.getAllErrorMessages())),
          audienceSuccessState: (audiences) {
            return ListView.separated(
              itemCount: audiences?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final audience = audiences![index];
                if (index == 0) {
                  return Showcase(
                      targetPadding: const EdgeInsets.all(5),
                      key: _one,
                      title: 'Note!',
                      tooltipPadding: const EdgeInsets.all(15),
                      description:
                          "if you want to delete or edit this audience\nyou can swipe to left or right",
                      tooltipBackgroundColor:
                          ColorsManager.saerchTextFieldHintColor,
                      textColor: Colors.white,
                      tooltipBorderRadius:
                          BorderRadius.all(Radius.circular(10.r)),
                      targetBorderRadius:
                          BorderRadius.all(Radius.circular(30.r)),
                      showArrow: true,
                      targetShapeBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      blurValue: 1,
                      child: AudianceItem(
                        audiences: audience,
                        index: index,
                      ));
                }

                return AudianceItem(
                  audiences: audience,
                  index: index,
                );
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
