import 'dart:developer';

import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/screens/manage_audiances_screen.dart';
import 'package:bulk_app/features/start_campains/logic/start_campagin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/theming/styles.dart';

class ManageContactsAndTemplatesButtonsRow extends StatelessWidget {
  final StartCampaginCubit cubit;
  const ManageContactsAndTemplatesButtonsRow({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
            child: ElevatedButton.icon(
              onPressed: () => _getResultFromNextScreen(context),
              icon: const VectorGraphic(
                  loader: AssetBytesLoader(
                    "assets/icons/campaign.svg",
                  ),
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              label: Text(
                "Manage Contacts",
                style: TextStyles.font17whiteMedium,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 7.w),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 20),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle Messages Templates button press
                context.pushNamed(Routes.templatesScreen);
              },
              icon: const VectorGraphic(
                  loader: AssetBytesLoader(
                    "assets/icons/comment_bank_floating.svg",
                  ),
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              label: Text(
                "Messages Templates",
                style: TextStyles.font17whiteMedium,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                backgroundColor: Colors.green,
                padding:
                    EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.w),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _getResultFromNextScreen(BuildContext context) async {
    final result = await Navigator.push<List<Audience>>(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<ManageAudiancesCubit>(
          create: (context) =>
              getIt<ManageAudiancesCubit>()..fetchAudienceList(),
          child: const ManageAudiancesScreen(),
        ),
      ),
    );
    if (context.mounted) {
      context.read<ManageAudiancesCubit>().audiences = result ?? [];
      log(' Result: $result'); //import ‘dart:developer’ to use logging.
    }
  }
}
