import 'package:bulk_app/core/helpers/date_helper.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/widgets/empty_state.dart';
import 'package:bulk_app/core/widgets/overlay_loading_state.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/audiance_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helpers/app_preference.dart';

class AudiancesListView extends StatefulWidget {
  const AudiancesListView({super.key});

  @override
  State<AudiancesListView> createState() => _AudiancesListViewState();
}

class _AudiancesListViewState extends State<AudiancesListView> {
  final GlobalKey _one = GlobalKey();
  bool? isOpened = false;
  @override
  void initState() {
    super.initState();
    // AppPreferences(getIt()).removeManageAudienceOpened().then((value) {});
    AppPreferences(getIt())
        .isManageAudinceOpened()
        .then((value) => isOpened = value);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (isOpened != true) {
          ShowCaseWidget.of(context).startShowCase([_one]);
          AppPreferences(getIt()).setManageAudienceOpened().then((value) {});
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageAudiancesCubit, ManageAudiancesState>(
      builder: (context, state) {
        return state.maybeWhen(
          audienceLoadingState: () => loadingSpinKit(),
          audienceEmptyState: () => const EmptyState(),
          audienceErrorState: (error) =>
              Center(child: Text(error.error?.message ?? '')),
          audienceSuccessState: (audiences) {
            return ListView.separated(
              itemCount: audiences?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final audience = audiences![index];
                if (index == 0 && isOpened != true) {
                  return Showcase(
                      targetPadding: const EdgeInsets.all(5),
                      key: _one,
                      title: AppStrings.manageAudienceNoteTitle.tr(),
                      tooltipPadding: const EdgeInsets.all(15),
                      description:
                          AppStrings.manageAudienceNoteDescription.tr(),
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
