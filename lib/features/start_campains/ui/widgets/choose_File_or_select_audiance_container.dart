import 'dart:io';

import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/widgets/custom_button.dart';
import 'package:bulk_app/features/manage_audiances/data/models/audience.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/manage_audiances_widgets/audiance_item.dart';
import 'package:bulk_app/features/start_campains/logic/start_campagin_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_vcard_parser/simple_vcard_parser.dart';

import '../../../../core/theming/styles.dart';

class ChooseCsvFileOrSelectAudianceContainer extends StatefulWidget {
  const ChooseCsvFileOrSelectAudianceContainer({
    super.key,
  });

  @override
  State<ChooseCsvFileOrSelectAudianceContainer> createState() =>
      _ChooseCsvFileOrSelectAudianceContainerState();
}

class _ChooseCsvFileOrSelectAudianceContainerState
    extends State<ChooseCsvFileOrSelectAudianceContainer> {
  final List<Contact> _contacts = [];
  String? filePath;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartCampaginCubit, StartCampaginState>(
      buildWhen: (previous, current) {
        return current is SelectedAudience;
      },
      builder: (context, state) {
        final cubit = context.read<StartCampaginCubit>();
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorsManager.saerchTextFieldHintColor,
              ),
              borderRadius: BorderRadius.circular(17.r),
              color: ColorsManager.darkAppBarBackGround),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Numbers',
                  style: TextStyles.font24limeExtraBold,
                ),
              ),
              6.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomButton.withIcon(
                        text: 'Select Audiance',
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        fontSize: 14.sp,
                        onPressed: () {
                          buildBottomSheet(
                              context,
                              context.read<StartCampaginCubit>().audiences,
                              cubit);
                        },
                        backgroundColor: const Color(0xFF10B981),
                        iconPath: 'assets/icons/description.svg'),
                  ),
                  // 10.horizontalSpace,
                  // Expanded(
                  //   child: CustomButton.withIcon(
                  //       text: 'Choose File',
                  //       padding: EdgeInsets.symmetric(vertical: 10.h),
                  //       fontSize: 14.sp,
                  //       backgroundColor: ColorsManager.teal400,
                  //       onPressed: () {
                  //         print('QQQQ ');
                  //         pickAndImportVCF();
                  //       },
                  //       iconPath: 'assets/icons/contact_page.svg'),
                  // ),
                ],
              ),
              if (cubit.selectedAudience != null) 10.verticalSpace,
              if (cubit.selectedAudience != null)
                Text(
                  "Name: ${cubit.selectedAudience?.name ?? ''}",
                  textAlign: TextAlign.center,
                  style: TextStyles.font17whiteMedium,
                ),
              if (cubit.selectedAudience != null)
                Text(
                    'Total Numbers: ${cubit.selectedAudience?.contacts?.length ?? 0}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorsManager.saerchTextFieldHintColor,
                        fontSize: 15.sp)),
              if (cubit.selectedAudience != null) 5.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  Future<void> pickAndImportVCF() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['vcf'],
      );
      if (result != null) {
        String? filePath = result.files.single.path;
        if (filePath != null) {
          String vCardString = await File(filePath).readAsString();
          print("vCardString $vCardString");

          // print("vc $vc");
          List<VCard> vacards = [];
          List<String> vCards = vCardString.split(RegExp(r'(?=BEGIN:VCARD)'));
          for (String vCard in vCards) {
            VCard vc = VCard(vCardString);
            vacards.add(vc);
          }
          for (VCard vCard in vacards) {
            Contact contact = Contact(displayName: vCard.nickname ?? '');
            _contacts.add(contact);
            print(" vCard.nickname ${vCard.typedTelephone}");
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contacts imported successfully!')),
          );
        }
      }
    } catch (e) {
      print('Error importing contacts: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Contacts imported $e')),
        );
      }
    }
  }
  // void _pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  //   // Import contact from vCard
  //   final contact = Contact.fromVCard('BEGIN:VCARD\n'
  //       'VERSION:3.0\n'
  //       'N:;Joe;;;\n'
  //       'TEL;TYPE=HOME:123456\n'
  //       'END:VCARD');
  //   if (result == null) return;
  //   filePath = result.files.single.path!;
  //   final input = File(filePath!).openRead();
  //   final fields = await input
  //       .transform(utf8.decoder)
  //       .transform(const CsvToListConverter())
  //       .toList();
  //   setState(() {
  //     _data = fields;
  //   });
  // }

  Future<dynamic> buildBottomSheet(BuildContext context,
      List<Audience>? audiences, StartCampaginCubit cubit) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return BlocProvider.value(
            value: cubit,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorsManager.darkBackGround,
                borderRadius:
                    BorderRadiusDirectional.vertical(top: Radius.circular(18)),
              ),
              height: context.height * 0.5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.read<StartCampaginCubit>().selectAudience(
                            audiences?[index] ?? Audience(),
                          );
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: AudianceItem(
                        audiences: audiences?[index] ?? Audience(),
                        index: index,
                      ),
                    ),
                  );
                },
                itemCount: audiences?.length ?? 0,
              ),
            ),
          );
        });
  }
}
