import 'package:todo_app/controller/home_pod.dart';
import 'package:todo_app/import_helper.dart';

class HomeScreenTabWidget extends StatefulHookConsumerWidget {
  const HomeScreenTabWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreenTabWidget> createState() =>
      _HomeScreenTabWidgetState();
}

class _HomeScreenTabWidgetState extends ConsumerState<HomeScreenTabWidget>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // ref.read(homePod).tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homPods = ref.watch(homePod.notifier);
    var homPodModel = ref.watch(homePod);
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        // shrinkWrap: true,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
              controller: tabController!,
              onTap: (value) {
                homPods.updateTabIndex(value);
                // setState(() {});
              },
              indicatorColor: kFont2Color,
              tabs: [
                Tab(
                  height: 7.5.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomChipsWidget(
                              text: "12",
                              isActive: ref.read(homePod).activeIndex == 0),
                          SizedBox(
                            width: 2.w,
                          ),
                          CustomText(
                            text: "Tasks",
                            fontColor: kButtonColor,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCircleWidget(text: "3"),
                      SizedBox(
                        width: 1.w,
                      ),
                      CustomText(
                        text: "Boards",
                      ),
                    ],
                  ),
                ),
              ]),
          Expanded(
            // height: 100.h,
            // width: 100.w,
            child: TabBarView(
                controller: tabController!,
                children: [TasksTab(), BoardsWidget()]),
          )
        ],
      ),
    );
  }
}

class TasksTab extends StatefulHookConsumerWidget {
  const TasksTab({Key? key}) : super(key: key);

  @override
  ConsumerState<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends ConsumerState<TasksTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, i) {
              return TaskWidget(
                title: "Coding",
                index: i,
                photoUrl: [
                  FirebaseAuth.instance.currentUser!.photoURL!,
                  FirebaseAuth.instance.currentUser!.photoURL!,
                  FirebaseAuth.instance.currentUser!.photoURL!,
                ],
                status: true,
                tag: "Myself",
                time: "1h 45m",
              );
            },
            separatorBuilder: (_, i) => SizedBox(height: 1.h),
          ),
        )
      ],
    );
  }
}

class BoardsWidget extends StatefulHookConsumerWidget {
  const BoardsWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BoardsWidget> createState() => _BoardsWidgetState();
}

class _BoardsWidgetState extends ConsumerState<BoardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Placeholder()
      ],
    );
  }
}

class CustomChipsWidget extends StatefulHookConsumerWidget {
  String text;
  bool isActive;
  CustomChipsWidget({Key? key, required this.text, required this.isActive})
      : super(key: key);

  @override
  ConsumerState<CustomChipsWidget> createState() => _CustomChipsWidgetState();
}

class _CustomChipsWidgetState extends ConsumerState<CustomChipsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      // color: kFont2Color,
      decoration: BoxDecoration(
          color: widget.isActive ? kFont2Color : kBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: CustomText(
        text: widget.text,
        fontSize: 12.sp,
        fontColor: widget.isActive ? kPrimaryColor : kFontColor,
      ),
    );
  }
}

class CustomCircleWidget extends StatelessWidget {
  String text;
  CustomCircleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      // color: kFont2Color,
      decoration: BoxDecoration(
          border: Border.all(color: kFont2Color), shape: BoxShape.circle),
      child: CustomText(
        text: text,
        fontSize: 12.sp,
      ),
    );
  }
}

class CustomHomeScreenTabs extends StatefulHookConsumerWidget {
  TabController tabController;
  CustomHomeScreenTabs({Key? key, required this.tabController})
      : super(key: key);

  @override
  ConsumerState<CustomHomeScreenTabs> createState() =>
      _CustomHomeScreenTabsState();
}

class _CustomHomeScreenTabsState extends ConsumerState<CustomHomeScreenTabs> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: widget.tabController,
        indicatorColor: kFont2Color,
        tabs: [
          Tab(
            height: 7.5.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomChipsWidget(
                        text: "12",
                        isActive: ref.read(homePod).activeIndex == 0),
                    SizedBox(
                      width: 2.w,
                    ),
                    CustomText(
                      text: "Tasks",
                      fontColor: kButtonColor,
                      fontSize: 20.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                )
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCircleWidget(text: "12"),
                SizedBox(
                  width: 1.w,
                ),
                CustomText(
                  text: "Boards",
                ),
              ],
            ),
          ),
        ]);
  }
}

class CustomTabs extends StatefulHookConsumerWidget {
  String title;
  int count;
  bool isActive;
  CustomTabs(
      {Key? key,
      required this.title,
      required this.count,
      required this.isActive})
      : super(key: key);

  @override
  ConsumerState<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends ConsumerState<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.isActive
            ? CustomChipsWidget(
                text: "${widget.count}",
                isActive: ref.read(homePod).activeIndex == 0)
            : CustomCircleWidget(text: "${widget.count}"),
        SizedBox(
          width: 1.w,
        ),
        CustomText(
          text: widget.title,
        ),
      ],
    );
  }
}
