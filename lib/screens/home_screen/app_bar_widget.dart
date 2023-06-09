import 'package:todo_app/import_helper.dart';
import 'package:todo_app/main.dart';

// class AppBarWidget extends StatelessWidget {
//   const AppBarWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       "assets/mountain.jpg",
//       height: 30.h,
//       width: 100.w,
//       fit: BoxFit.fitWidth,
//     );
//   }
// }

class AppBarDrawer extends StatefulHookConsumerWidget {
  const AppBarDrawer({Key? key}) : super(key: key);

  @override
  ConsumerState<AppBarDrawer> createState() => _AppBarDrawerState();
}

class _AppBarDrawerState extends ConsumerState<AppBarDrawer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 4.w,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(auth.currentUser!.photoURL!),
        ),
      ],
    );
  }
}

class AppBarInfo extends StatefulHookConsumerWidget {
  const AppBarInfo({Key? key}) : super(key: key);

  @override
  ConsumerState<AppBarInfo> createState() => _AppBarInfoState();
}

class _AppBarInfoState extends ConsumerState<AppBarInfo> {
  @override
  Widget build(BuildContext context) {
    return AppBarCircleIcon(
      data: Icons.arrow_drop_down,
    );
  }
}

class AppBarCircleIcon extends StatefulHookConsumerWidget {
  IconData data;
  Color? color;
  Color? bgColor;
  AppBarCircleIcon({Key? key, required this.data, this.color, this.bgColor})
      : super(key: key);

  @override
  ConsumerState<AppBarCircleIcon> createState() => _AppBarCircleIconState();
}

class _AppBarCircleIconState extends ConsumerState<AppBarCircleIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.h,
      height: 8.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: widget.bgColor ?? kPrimaryColor),
      child: Center(
        child: Icon(widget.data, color: widget.color ?? kFont2Color),
      ),
    );
  }
}

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  // TODO: implement maxExtent
  double get maxExtent => 264;

  @override
  // TODO: implement minExtent
  double get minExtent => 84;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    final progress = shrinkOffset / maxExtent;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
    );
  }
}
