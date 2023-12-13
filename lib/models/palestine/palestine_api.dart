import 'package:app/models/palestine/meta_data.dart';
import 'package:app/models/palestine/palestine.dart';

class PalestineApi {
  List<Palestine>? palestineList;
  Metadata? metadata;

  PalestineApi({this.palestineList, this.metadata});

  PalestineApi.fromJson(json) {
    palestineList = [];
    if (json['record'] != null) json['record'].forEach((v) => palestineList?.add(Palestine.fromJson(v)));
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (palestineList != null) map['record'] = palestineList?.map((v) => v.toJson()).toList();
    if (metadata != null) map['metadata'] = metadata?.toJson();
    return map;
  }
}
