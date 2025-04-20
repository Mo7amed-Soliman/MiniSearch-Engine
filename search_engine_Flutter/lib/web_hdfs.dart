// ignore_for_file: avoid_print
import 'package:search_engine/function/convert_to_map.dart';
import 'package:search_engine/function/get_matching_line.dart';
import 'function/fetch_content_in_web_hdfs_rest_api.dart';

void main() async {
  List<String> lines = await fetchContent();

  final Map<String, int> result = convertToMap(getMatchingLine(lines, 'Ahmed'));
  print(result);
  List<MapEntry<String, int>> entries = result.entries.toList();

  entries.sort((a, b) => b.value.compareTo(a.value));

  Map<String, int> sortedMap = {};
  for (MapEntry<String, int> entry in entries) {
    sortedMap[entry.key] = entry.value;
  }
  for (var entry in sortedMap.entries) {
    print("${entry.key}: ${entry.value}");
  }
}
