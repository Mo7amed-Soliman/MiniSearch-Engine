import 'package:search_engine/function/decode_url.dart';

// 0     1
// word  link1 : count1; link2:count2;link3:count3;
Map<String, int> convertToMap(String inputString) {
  final List<String> parts = inputString.split('\t');
  // final word = parts[0];
  final String dataPart = parts[1];

  final items = dataPart.split(';');
  final wordData = <String, int>{};

  for (final item in items) {
    if (item.contains(':')) {
      final keyValue = item.split(':');
      final key = decodeUrl(keyValue[0]);
      final value = keyValue[1];
      wordData[key] = int.parse(value);
    }
  }

  return wordData;
}



// {
//   'link1':count1,
//   'link2':count2,
//   'link3':count3
// }

 
