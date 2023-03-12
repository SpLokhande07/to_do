import 'package:todo_app/import_helper.dart';

showToastMsg({required String msg}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: kSecondaryColor,
    toastLength: Toast.LENGTH_LONG,
    textColor: kPrimaryColor,
    fontSize: 12.sp,
  );
}
