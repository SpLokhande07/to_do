import 'package:todo_app/controller/home_pod.dart';
import 'package:todo_app/import_helper.dart';
import 'package:todo_app/screens/home_screen/app_bar_widget.dart';
import 'package:todo_app/screens/home_screen/home_screen_widget.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        backgroundColor: kBackgroundColor,
        leadingWidth: 20.w,
        leading: const Padding(
          padding: EdgeInsets.only(top: 4.0, left: 8, bottom: 4),
          child: AppBarDrawer(),
        ),
        actions: [
          AppBarCircleIcon(
            data: Icons.notifications,
            bgColor: kPrimaryColor,
            color: kFont2Color,
          ),
          SizedBox(
            width: 1.w,
          ),
          AppBarCircleIcon(
            data: Icons.add,
            bgColor: kPrimaryColor,
            color: kFont2Color,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: kBackgroundColor,
            height: 100.h,
            width: 100.w,
            child: ListView(
              shrinkWrap: true,
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 75.w,
                  child: CustomText(
                    text: "Good Morning",
                    fontColor: kButtonColor,
                    fontSize: 35.sp,
                    maxLine: 2,
                    isRaleway: true,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                DateStatusWidget(),
                SizedBox(
                  height: 5.h,
                ),
                // const Expanded(child: HomeScreenTabWidget())
                SizedBox(
                    height: 75.h, width: 100.w, child: HomeScreenTabWidget())
              ],
            )),
      ),
    );
  }
}
