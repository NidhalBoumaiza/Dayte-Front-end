class Dayte {
  List<Matche>? matches;

  Dayte({this.matches});

  Dayte.fromJson(Map<String, dynamic> json) {
    if (json['matches'] != null) {
      matches = <Matche>[];
      json['matches'].forEach((v) {
        matches!.add(new Matche.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.matches != null) {
      data['matches'] = this.matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Matche {
  int? id;
  String? name;
  String? profilePicture;
  String? date;
  String? time;

  Matche({this.id, this.name, this.profilePicture, this.date, this.time});

  Matche.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    profilePicture = json['profile_picture'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_picture'] = this.profilePicture;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}