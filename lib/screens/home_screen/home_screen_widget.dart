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
  int index;
  String title;
  bool status;
  List<String> photoUrl;
  String time;
  TaskWidget(
      {Key? key,
      required this.title,
      required this.index,
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
        color: taskColors[(index % 3).ceil()],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.5.h,
                width: 45.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 5.h,
                      width: 5.h,
                      decoration: BoxDecoration(
                          color: kFont2Color.withOpacity(0.7),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: photoUrl.length > 5 ? 5 : photoUrl.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) {
                          return Align(
                            widthFactor: 0.5,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              maxRadius: 2.h,
                              minRadius: 2.h,
                              backgroundImage: NetworkImage(photoUrl[i]),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: time,
                    fontColor: kPrimaryColor,
                    fontSize: 12.sp,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(Icons.done, color: kPrimaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
