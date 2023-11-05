import 'package:get/get.dart';

class myAccount {
  User? user;

  myAccount({this.user});

  myAccount.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  RxString? name;
  RxString? plan;
  RxList<dynamic>? pictures;
  List<String>? interests;
  List<Prompts>? prompts;
  RxString? birthday;
  RxString? gender;

  User({this.name,
    this.plan,
    this.pictures,
    this.interests,
    this.prompts,
    this.gender,
    this.birthday});

  User.fromJson(Map<String, dynamic> json) {
    name = RxString(json['name']);

    plan = RxString(json['plan']);
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(json['birth_date']);
    birthday = RxString(json['birth_date']);

    gender = RxString(json['gender']);
    pictures = RxList<dynamic>(json['pictures'].cast<dynamic>());
    interests = json['interests'].cast<String>();
    if (json['prompts'] != null) {
      prompts = <Prompts>[];
      json['prompts'].forEach((v) {
        prompts!.add(new Prompts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['plan'] = this.plan;
    data['pictures'] = this.pictures;
    data['interests'] = this.interests;
    if (this.prompts != null) {
      data['prompts'] = this.prompts!.map((v) => v.toJson()).toList();
    }
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
