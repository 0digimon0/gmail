abstract class ListMailEvents {}

class ArchieveEvent extends ListMailEvents {}

class UpdateStarStateEvent extends ListMailEvents {
  final bool isSelected;
  final String mailId;
  UpdateStarStateEvent(this.isSelected, this.mailId);
}

class SelectMailEvent extends ListMailEvents {
  final String mailId;
  final bool isSelected;
  SelectMailEvent(this.mailId, this.isSelected);
}

abstract class MailStates {}

class InitListState extends MailStates {}

class ArchievedMailState extends MailStates {}

class SendingUpdateLabelState extends MailStates {}

class ReceivedLabelState extends MailStates {}

class SelectedMailState extends MailStates {
  bool isSelected;
  String mailId;
  SelectedMailState(this.mailId, this.isSelected);
}
