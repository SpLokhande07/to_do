import 'package:todo_app/import_helper.dart';
import 'package:todo_app/model/home_screen_states.dart';

var homePod = StateNotifierProvider<HomeStateNotifier, HomeScreenStateModel>(
    (ref) => HomeStateNotifier(ref));

class HomeStateNotifier extends StateNotifier<HomeScreenStateModel> {
  Ref ref;
  HomeStateNotifier(this.ref) : super(HomeScreenStateModel());
  TabController? tabController;

  initTabController(TickerProvider provider) async {
    tabController = TabController(length: 2, vsync: provider);
    state = state.copyWith(tabController: tabController, activeIndex: 0);
  }

  updateTabIndex(int index) {
    int val = index;
    state = state.copyWith(activeIndex: val);
  }

  resetState() {
    tabController!.dispose();
  }
}
