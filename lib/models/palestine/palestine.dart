class Palestine {
  String? text;
  int? time;
  int? startTime;
  int? endTime;

  Palestine({this.text, this.time, this.startTime, this.endTime});

  Palestine.fromJson(json) {
    text = json['Text'];
    time = json['Time'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Text'] = text;
    map['Time'] = time;
    map['StartTime'] = startTime;
    map['EndTime'] = endTime;
    return map;
  }
}
