// import 'package:bulk_app/core/theming/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class Utils {
//   late BuildContext context;

//   Utils(this.context);

//   // this is where you would do your fullscreen loading
//   Future<void> startLoading() async {
//     return await showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return const Center(
//           child: SpinKitWaveSpinner(
//             color: ColorsManager.containerTitleColor,
//             size: 80.0,
//           ),
//         );
//       },
//     );
//   }

//   Future<void> stopLoading() async {
//     Navigator.of(context).pop();
//   }

//   Future<void> showError(Object? error) async {
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   SnackBar(
//     //     action: SnackBarAction(
//     //       label: 'Dismiss',
//     //       onPressed: () {
//     //         ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     //       },
//     //     ),
//     //     backgroundColor: Colors.red,
//     //     content: Text(handleError(error)),
//     //   ),
//     // );
//   }
// }
  import 'package:bulk_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> stopLoading(BuildContext context) async {
    Navigator.of(context).pop();
  }
  Future<void> startLoading(BuildContext context) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return loadingSpinKit()  ;
      },
    );
  }
 Widget loadingSpinKit(){
     return const Center(
          child: SpinKitWaveSpinner(
            color: ColorsManager.containerTitleColor,
            size: 80.0,
          ),
        );
  }
  // this is where you would do your fullscreen loading