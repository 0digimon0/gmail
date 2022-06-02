import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmail/bloc/mail_event.dart';

class ListMailBloc extends Bloc<ListMailEvents, MailStates> {
  ListMailBloc(MailStates initialState) : super(initialState);

  @override
  Stream<MailStates> mapEventToState(ListMailEvents event) async* {
    if (event is UpdateStarStateEvent) {
      debugPrint(
          "call UpdateStarStateEvent for mail id:${event.mailId} with state ${event.isSelected}");
    }

    if (event is SelectMailEvent) {
      debugPrint(
          "call SelectMailEvent for mail id:${event.mailId} with state ${event.isSelected}");
      yield SelectedMailState(event.mailId, event.isSelected);
    }
  }
}
