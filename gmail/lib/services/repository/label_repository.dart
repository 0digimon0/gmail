import 'dart:convert';
import 'package:gmail/model/label.dart';
import 'package:gmail/services/provider/json_converter.dart';

abstract class LabelRepository {
  Future<List<Label>> getAllLabels();
  Future<List<Label>> getRecentLabels();
}

class LabelRepositoryImp implements LabelRepository {
  @override
  Future<List<Label>> getAllLabels() async {
    String data = await JsonProvider.loadAStudentAsset();
    final jsonResponse = json.decode(data);
    LabelList labelsList = LabelList.fromJson(jsonResponse);
    return labelsList.labels;
  }

  Future<List<Label>> getRecentLabels() async {}
}
