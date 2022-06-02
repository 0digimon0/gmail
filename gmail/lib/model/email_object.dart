class EmailObject {
  String mailId;
  String mailTitle;
  String mailSender;
  String mailContent;
  bool isRead;
  bool isStared;
  bool hasAttachments;

  EmailObject(int id) {
    mailId = "$id";
    mailTitle = "Flutter/Dart: How to get list value where key equals";
    mailSender = "Le Huu Thanh";
    mailContent =
        "I'm not sure why I'm having such a hard time finding an answer for this, but I have a list that I need to get the value from where the key matches certain criteria. The keys are all unique. In the example below, I want to get the color where the name equals \"headache\". Result should be \"4294930176\".";
    isRead = id % 3 == 0 ? true : false;
    isStared = id % 4 == 0 ? true : false;
    hasAttachments = id % 2 == 0 ? true : false;
  }
}

class Account {
  var accountName;
  var acountAvatar;
}

enum LabelType {
  all,
  inbox,
  stared,
  hidden,
  important,
  sent,
  scheduled,
  draft,
  spam,
  trash
}
