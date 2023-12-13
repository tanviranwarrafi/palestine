import 'package:app/utils/assets.dart';

class PalestineImage {
  String image;
  String title;
  String desc;

  PalestineImage({required this.image, required this.title, required this.desc});

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['title'] = title;
    map['desc'] = desc;
    return map;
  }
}

List<PalestineImage> palestineImagesList = [
  PalestineImage(image: Assets.palestine_1, title: '', desc: ''),
  PalestineImage(image: Assets.palestine_2, title: '', desc: ''),
  PalestineImage(image: Assets.palestine_3, title: '', desc: ''),
  PalestineImage(image: Assets.palestine_4, title: '', desc: ''),
  PalestineImage(image: Assets.palestine_5, title: '', desc: ''),
  PalestineImage(image: Assets.palestine_6, title: '', desc: ''),
  PalestineImage(image: Assets.palestine_7, title: '', desc: ''),
  PalestineImage(image: Assets.palestine_8, title: '', desc: ''),
];
