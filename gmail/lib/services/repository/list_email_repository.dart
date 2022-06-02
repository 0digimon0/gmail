import 'package:gmail/model/email_object.dart';

abstract class ListMailRepository {
  List<EmailObject> getEmailWithLabel(String label);
  List<EmailObject> getInboxEmail();
  List<EmailObject> getAllEmailAllAccount(String label);
  sendUpdateLabelState(String mailId, String label, bool state) {}
}

class ListMailRepositoryImpl extends ListMailRepository {
  @override
  List<EmailObject> getAllEmailAllAccount(String label) {
    // TODO: implement getAllEmailAllAccount
    throw UnimplementedError();
  }

  @override
  List<EmailObject> getEmailWithLabel(String label) {
    // TODO: implement getEmailWithLabel
    throw UnimplementedError();
  }

  @override
  List<EmailObject> getInboxEmail() {
    // TODO: implement getInboxEmail
    throw UnimplementedError();
  }
}
