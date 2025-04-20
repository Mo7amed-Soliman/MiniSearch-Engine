// ignore_for_file: avoid_print

import 'dart:developer';

Map<String, dynamic> sortMapByValue(Map<String, dynamic> map) {
  List<MapEntry<String, dynamic>> entries = map.entries.toList();

  entries.sort((a, b) => b.value.compareTo(a.value));

  Map<String, dynamic> sortedMap = {};
  for (MapEntry<String, dynamic> entry in entries) {
    sortedMap[entry.key] = entry.value;
  }
  for (var entry in sortedMap.entries) {
    log("${entry.key}: ${entry.value}");
  }
  return sortedMap;
}
