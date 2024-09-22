import 'package:bulk_app/core/helpers/date_helper.dart';
import 'package:bulk_app/core/resources/app_strings.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/core/theming/styles.dart';
import 'package:bulk_app/features/manage_audiances/data/models/contacts.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/contact_screen_widgets/show_add_contact_form.dart';
import 'package:bulk_app/features/manage_audiances/ui/widgets/select_contacts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as flutter_contacts;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({super.key, required this.cubit});
  final ContactScreenCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.saerchTextFieldBackGroundColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 0, 5.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Allow the Col
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Message',
                style: TextStyles.font16GreenExtraBold,
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  showAddContactForm(context, cubit);
                },
                child: Text(
                  AppStrings.addContact.tr(),
                  style:
                      TextStyles.font16GreenExtraBold.copyWith(fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 6.h),
              GestureDetector(
                onTap: () async {
                  final result =
                      await Navigator.push<List<flutter_contacts.Contact>>(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DeviceMultiContactSelection(),
                        settings: RouteSettings(
                            arguments: cubit.currentAudienceContacts)),
                  );
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }

                  List<Contact>? contacts = result
                      ?.map((value) => Contact(
                            name: value.displayName,
                            phone: value.phones.isNotEmpty
                                ? value.phones[0].number
                                : '****00000',
                          ))
                      .toList();

                  cubit.addContactsList(contacts ?? []);
                  if (kDebugMode) {
                    print('DeviceMultiContactSelection: $result');
                  }

                },
                child: Text(
                  AppStrings.addFromCsv.tr(),
                  style:
                      TextStyles.font16GreenExtraBold.copyWith(fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
