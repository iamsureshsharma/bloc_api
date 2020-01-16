class Detail {
  List<Data> details;

  Detail({this.details});

  Detail.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      details = new List<Data>();
      json['results'].forEach((index) {
        details.add(new Data.fromJson(index));
      });
    }
  }
}

class Data {
  String id;
  String key;
  String name;
  String site;
  int size;
  String type;

  Data({this.id, this.key, this.name, this.site, this.size, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
  }
}
