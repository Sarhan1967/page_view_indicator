import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
class PageModel{
  String _titles;
  String _images;
  String _descriptions;
  IconData _icons;

  PageModel(this._titles, this._images, this._descriptions, this._icons);

  IconData get icons => _icons;

  String get descriptions => _descriptions;

  String get images => _images;

  String get titles => _titles;
}