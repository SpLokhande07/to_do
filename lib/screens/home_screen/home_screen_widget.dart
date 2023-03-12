import 'package:todo_app/controller/home_pod.dart';
import 'package:todo_app/import_helper.dart';

class DateStatusWidget extends StatefulWidget {
  const DateStatusWidget({Key? key}) : super(key: key);

  @override
  State<DateStatusWidget> createState() => _DateStatusWidgetState();
}

class _DateStatusWidgetState extends State<DateStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "Today's Monday",
              fontSize: 12.sp,
              isRaleway: true,
            ),
            CustomText(
              text: "Dec 12, 2022",
              fontSize: 10.sp,
              fontColor: kFontColor.withOpacity(0.5),
              isRaleway: true,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "75% Done",
              fontSize: 12.sp,
            ),
            CustomText(
              text: "Completed Tasks",
              fontSize: 10.sp,
              fontColor: kFontColor.withOpacity(0.5),
              isRaleway: true,
            ),
          ],
        ),
      ],
    );
  }
}

class TaskWidget extends StatelessWidget {
  String tag;

  String title;
  bool status;
  List<String> photoUrl;
  String time;
  TaskWidget(
      {Key? key,
      required this.title,
      required this.status,
      required this.photoUrl,
      required this.tag,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: 100.w,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: taskColors[0],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.h,
                width: 45.w,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: photoUrl.length > 5 ? 5 : photoUrl.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      if (i < 5) {
                        return Align(
                          widthFactor: 0.35,
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(photoUrl[i]),
                          ),
                        );
                      } else {
                        const CircleAvatar(
                          child: Center(
                            child: Icon(Icons.add),
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
