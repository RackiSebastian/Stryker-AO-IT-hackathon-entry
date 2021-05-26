import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;


Widget getMap() {
  String htmlId = "7";

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatlng = LatLng(1.3521, 103.8198);
    final myLat2 = LatLng(51.91090154587402, -8.284167816844231);

    final mapOptions = MapOptions()
      ..zoom = 12
      ..center = LatLng(51.91090154587402, -8.284167816844231);

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..clickable = true
      ..position = myLat2
      ..map = map
      ..title = "Hello world 2!");

    Marker(MarkerOptions()
      ..position = myLatlng
      ..map = map
      ..optimized = false
      ..title = 'Hello World!');

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}
