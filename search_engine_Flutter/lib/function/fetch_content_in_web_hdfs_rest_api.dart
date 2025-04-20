// ignore_for_file: avoid_print
// https://hadoop.apache.org/docs/r1.0.4/webhdfs.html
import 'dart:convert';

import 'package:dio/dio.dart';

Future<List<String>> fetchContent() async {
  const baseUrl = "http://192.168.249.129:50070/webhdfs/v1";
  const path = "/output01/part-r-00000";
  const url = "$baseUrl$path?op=OPEN";

  try {
    final dio = Dio();

    final response = await dio.get(url);
    // 100000
    // num :link
    // word unm :count ;
    //
    if (response.statusCode == 200) {
      final fileContent = response.data.toString();
      final lines = const LineSplitter().convert(fileContent);
      return lines;
    } else if (response.statusCode == 401) {
      throw Exception("Unauthorized: Check authentication credentials.");
    } else if (response.statusCode == 403) {
      throw Exception("Forbidden: Insufficient privileges to read the file.");
    } else if (response.statusCode == 404) {
      throw Exception(
          "Not Found: HDFS Name-node or WebHDFS service not available.");
    } else {
      throw Exception(
          "Failed to read file. Error code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error while fetching file:  ${e.toString()}");

    return [];
  }
}
