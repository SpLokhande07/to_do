class CustomStateModel {
  bool authLoader;

  CustomStateModel({this.authLoader = false});

  copyWith({bool? authLoader}) {
    return CustomStateModel(authLoader: authLoader ?? this.authLoader);
  }
}
