import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/custom_state_model.dart';

var customStateNotifierPod =
    StateNotifierProvider<CustomStateNotifier, CustomStateModel>(
        (ref) => CustomStateNotifier(ref));

class CustomStateNotifier extends StateNotifier<CustomStateModel> {
  Ref ref;
  CustomStateNotifier(this.ref) : super(CustomStateModel());

  updateAuthLoader() {
    bool value = state.authLoader;
    state = state.copyWith(authLoader: !value);
  }
}
