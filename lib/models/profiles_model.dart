import 'package:get/get.dart';

class profiles_model {
  List<Suggestions>? suggestions;

  profiles_model({this.suggestions});

  profiles_model.fromJson(Map<String, dynamic> json) {
    if (json['suggestions'] != null) {
      suggestions = <Suggestions>[];
      json['suggestions'].forEach((v) {
        suggestions!.add(new Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestions {
  String? id;
  String? name;
  List<String>? pictures;
  int? age;
  List<Prompts>? prompts;
  String? gender;
  List<String>? interests;
  String? location;
  RxBool? liked;

  Suggestions({
    this.id,
    this.name,
    this.pictures,
    this.age,
    this.prompts,
    this.gender,
    this.interests,
    this.location,
    this.liked,
  });

  Suggestions.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    pictures = json['pictures'].cast<String>();
    age = json['age'];
    if (json['prompts'] != null) {
      prompts = <Prompts>[];
      json['prompts'].forEach((v) {
        prompts!.add(new Prompts.fromJson(v));
      });
    }
    gender = json['gender'];
    interests = json['interests'].cast<String>();
    location = json['location'];
    liked = RxBool(json['liked']);
    print(liked);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['pictures'] = this.pictures;
    data['age'] = this.age;
    if (this.prompts != null) {
      data['prompts'] = this.prompts!.map((v) => v.toJson()).toList();
    }
    data['gender'] = this.gender;
    data['interests'] = this.interests;
    data['location'] = this.location;
    data['liked'] = this.liked;

    return data;
  }
}

class Prompts {
  String? prompt;
  String? answer;

  Prompts({this.prompt, this.answer});

  Prompts.fromJson(Map<String, dynamic> json) {
    prompt = json['prompt'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prompt'] = this.prompt;
    data['answer'] = this.answer;
    return data;
  }
}
