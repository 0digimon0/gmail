import 'package:bloc/bloc.dart';
import 'package:gmail/bloc/drawer_event.dart';
import 'package:gmail/model/label.dart';
import 'package:gmail/services/repository/label_repository.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  LabelRepositoryImp repository;

  DrawerBloc(DrawerState initialState, {this.repository}) : super(initialState);

  @override
  Stream<DrawerState> mapEventToState(DrawerEvent event) async* {
    if (event is LoadAllLabelsEvent) {
      yield LoadingAllLabelState();

      try {
        List<Label> allLabels = await repository.getAllLabels();
        yield LoadedAllLabelsState(allLabels);
      } catch (e) {
        print("DrawerBloc - error get all label: $e");
      }
    }

    if (event is MenuClickEvent) {
      print("DrawerBloc - on click item");
      yield SelectedMenuState(event.data);

      // switch (event.data) {
      //   case 1:
      //     yield SelectAllMailInbox();
      //     break;
      //   case 2:
      //     yield SelectMailInbox();
      //     break;
      //   case 4:
      //     yield SelectStaredLabel();
      //     break;
      //   default:
      //     yield SelectOtherLabel();
      // }
    }
  }
}
