class Metadata {
  Metadata({
    this.id,
    this.private,
    this.createdAt,
  });

  Metadata.fromJson(json) {
    id = json['id'];
    private = json['private'];
    createdAt = json['createdAt'];
  }
  String? id;
  bool? private;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['private'] = private;
    map['createdAt'] = createdAt;
    return map;
  }
}
