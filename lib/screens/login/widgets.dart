import 'package:todo_app/import_helper.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/logo.png",
            width: 5.w, height: 5.w, fit: BoxFit.fitWidth),
        SizedBox(
          width: 1.w,
        ),
        CustomText(
            text: "Login page", fontColor: Colors.black, fontSize: 12.sp),
      ],
    );
  }
}
