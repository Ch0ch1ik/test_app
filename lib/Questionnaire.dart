import 'dart:convert';
/// id : 2
/// name : "Preferencje Polaków dot. opakowań napojów"
/// description : "Wygra puszka czy butelka? TAK !"
/// active : true
/// start_date : "2023-06-29T10:06:13Z"
/// end_date : "2023-10-27T10:06:13Z"
/// total_votes : 0
/// image : ""
/// duration : 2
/// question : 2

Questionnaire questionnaireFromJson(String str) => Questionnaire.fromJson(json.decode(str));
String questionnaireToJson(Questionnaire data) => json.encode(data.toJson());
class Questionnaire {
  Questionnaire({
      num? id, 
      String? name, 
      String? description, 
      bool? active, 
      String? startDate, 
      String? endDate, 
      num? totalVotes, 
      String? image, 
      num? duration, 
      num? question,}){
    _id = id;
    _name = name;
    _description = description;
    _active = active;
    _startDate = startDate;
    _endDate = endDate;
    _totalVotes = totalVotes;
    _image = image;
    _duration = duration;
    _question = question;
}

  Questionnaire.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _active = json['active'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _totalVotes = json['total_votes'];
    _image = json['image'];
    _duration = json['duration'];
    _question = json['question'];
  }
  num? _id;
  String? _name;
  String? _description;
  bool? _active;
  String? _startDate;
  String? _endDate;
  num? _totalVotes;
  String? _image;
  num? _duration;
  num? _question;
Questionnaire copyWith({  num? id,
  String? name,
  String? description,
  bool? active,
  String? startDate,
  String? endDate,
  num? totalVotes,
  String? image,
  num? duration,
  num? question,
}) => Questionnaire(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  active: active ?? _active,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  totalVotes: totalVotes ?? _totalVotes,
  image: image ?? _image,
  duration: duration ?? _duration,
  question: question ?? _question,
);
  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  bool? get active => _active;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  num? get totalVotes => _totalVotes;
  String? get image => _image;
  num? get duration => _duration;
  num? get question => _question;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['active'] = _active;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['total_votes'] = _totalVotes;
    map['image'] = _image;
    map['duration'] = _duration;
    map['question'] = _question;
    return map;
  }

}