import 'package:app/models/palestine_image.dart';
import 'package:flutter/material.dart';

class PalestineImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: palestineImagesList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: _imageItemCard,
    );
  }

  Widget _imageItemCard(BuildContext context, int index) {
    var palestine = palestineImagesList[index];
    var margin_left = index == 0 ? 24.0 : 0.0;
    var margin_right = index == palestineImagesList.length - 1 ? 24.0 : 16.0;
    return Container(
      width: 120,
      height: 100,
      margin: EdgeInsets.only(left: margin_left, right: margin_right),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(palestine.image, height: double.infinity, width: double.infinity, fit: BoxFit.cover),
      ),
    );
  }
}
