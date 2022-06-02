class Label {
  int id;
  String name;
  String iconUrl;
  int count;

  Label(this.id, this.name, this.iconUrl, this.count);

  static Label labelFromJson(Map<String, dynamic> json) {
    return Label(
      json['id'],
      json['name'],
      json['icon_uri'],
      json['count'],
    );
  }

  Map<String, dynamic> labelToJson(Label instance) => <String, dynamic>{
        'id': instance.id,
        'name': instance.name,
        'icon_uri': instance.iconUrl,
        'count': instance.count,
      };
}

class LabelList {
  List<Label> labels;

  LabelList({this.labels});

  factory LabelList.fromJson(List<dynamic> parsedJson) {
    List<Label> _labels =
        parsedJson.map((i) => Label.labelFromJson(i)).toList();

    return new LabelList(labels: _labels);
  }
}
