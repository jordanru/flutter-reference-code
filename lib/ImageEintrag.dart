import 'package:flutter/material.dart';

class ImageEintrag {

  String titel;
  //List<AssetImage> image;
  String bemerkung;
  String datum;
  String creater;
  List<String> images;

  ImageEintrag(this.titel,  this.bemerkung, this.images, this.datum, this.creater);

}