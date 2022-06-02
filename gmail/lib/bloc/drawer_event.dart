import 'package:gmail/model/label.dart';

abstract class DrawerEvent {}

class LoadRecentLabelsEvent implements DrawerEvent {}

class LoadAllLabelsEvent implements DrawerEvent {}

class MenuClickEvent implements DrawerEvent {
  final int data;
  MenuClickEvent(this.data);
}

abstract class DrawerState {}

class LoadingAllLabelState implements DrawerState {}

class LoadedAllLabelsState implements DrawerState {
  LoadedAllLabelsState(this.allLabel);
  List<Label> allLabel;
}

class SelectedMenuState implements DrawerState {
  int selectedIndex;
  SelectedMenuState(this.selectedIndex);
}

class SelectAllMailInbox implements DrawerState {}

class SelectMailInbox implements DrawerState {}

class SelectStaredLabel implements DrawerState {}

class SelectOtherLabel implements DrawerState {}
