import 'package:exos_lists_grids/detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/place.dart';

class NavigatorHelper {
  toDetail({required BuildContext context, required Place place}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return DetailView(place: place);
    }));
  }
}
