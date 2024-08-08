import 'dart:io';

import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildImageWidget extends StatelessWidget {
  const BuildImageWidget(
      {super.key,
      required this.pickedFileFromDevice,
      required this.pickedFileFromApi});
  final Uint8List? pickedFileFromApi;

  final File? pickedFileFromDevice;

  @override
  Widget build(BuildContext context) {
    if ((pickedFileFromDevice != null) || (pickedFileFromApi != null)) {
      return SizedBox(
        height: context.height * 0.2,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
                padding: const EdgeInsets.all(8.0),
                child: pickedFileFromApi != null && pickedFileFromDevice == null
                    ? Image.memory(
                        pickedFileFromApi!,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        pickedFileFromDevice!,
                        fit: BoxFit.cover,
                      )),
            buildRemoveButton(context),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Positioned buildRemoveButton(BuildContext context) {
    final cubit = context.read<AddTemplateCubit>();
    return Positioned(
      top: -12.h,
      right: -12.w,
      child: IconButton(
        onPressed: () => cubit.emitRemoveImage(),
        icon: const Icon(
          Icons.cancel,
          color: Colors.red,
        ),
      ),
    );
  }
}
