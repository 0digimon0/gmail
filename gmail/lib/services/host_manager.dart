import 'package:gmail/model/email_object.dart';

class Response {
  String msgId;
  String data;
}

abstract class HostManagerInterface {
  Response sendDataToServer(String msgId, String data);
}
