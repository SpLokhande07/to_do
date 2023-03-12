import 'package:todo_app/controller/auth_pod.dart';
import 'package:todo_app/controller/custom_state_notifiers.dart';
import 'package:todo_app/import_helper.dart';
import 'package:todo_app/splash_screen.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var authPods = ref.read(authPod);
    var customStateModel = ref.read(customStateNotifierPod);
    var customStateNotifier = ref.read(customStateNotifierPod.notifier);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        constraints: BoxConstraints(
          minWidth: 100.w,
          minHeight: 100.h,
        ),
        // height: 100.h,
        // width: 100.w,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/logo.png",
                  width: 25.w, height: 25.w, fit: BoxFit.fitWidth),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 45.w,
                child: CustomText(
                    text: "Create your own To-Do List",
                    fontSize: 25.sp,
                    maxLine: 3),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                      text: "Sign in to create your own To-do List",
                      fontSize: 10.sp),
                  SizedBox(
                    height: 1.h,
                  ),
                  GoogleAuthButton(
                    isLoading: customStateModel.authLoader,
                    style: AuthButtonStyle(
                        borderColor: Colors.black,
                        borderWidth: 1,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        elevation: 0,
                        buttonColor: kPrimaryColor),
                    onPressed: () async {
                      customStateNotifier.updateAuthLoader();
                      authPods.userCredential =
                          await ref.read(authPod).googleSignIn();

                      customStateNotifier.updateAuthLoader();
                      if (mounted) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => SplashScreen()),
                            (route) => false);
                      }
                    }, // default: false
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
