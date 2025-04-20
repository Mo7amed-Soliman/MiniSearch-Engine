import 'dart:convert';
import 'dart:io';

Future<Map<String, dynamic>> loadMapFromJsonFile() async {
  File file = File('lib/page_rank.json');
  String jsonString = await file.readAsString();

  Map<String, dynamic> map = json.decode(jsonString);

  return map;
}

// void main() async {
//   Map<String, dynamic> map = await loadMapFromJsonFile();

//   // Access and use the map data as needed
//   print(map);
// }
