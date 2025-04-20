// ignore_for_file: avoid_print

import 'dart:io';

import 'package:html/parser.dart' as parser;
import "package:http/http.dart" as http;

void main() async {
  const startPage = 'https://www.dailynewsegypt.com/';
  const maxLinks = 10000;
  final theLinks = [startPage]; // The start page

  int pageCounter = 0;
  int linksCounter = 1;

  while (theLinks.length < maxLinks) {
    try {
      final res = await http.get(Uri.parse(theLinks[pageCounter]));
      if (res.statusCode == 200) {
        final document = parser.parse(res.body);
        final links = document.querySelectorAll('a[href^="https://"]');
        for (final link in links) {
          final href = link.attributes['href'];
          if (maxLinks != linksCounter &&
              href != null &&
              !theLinks.contains(href)) {
            print('--------------- Link number -------------- $linksCounter');
            theLinks.add(href);
            print(href);
            linksCounter++;
          }
        }
        pageCounter++;
      } else {
        print('Error: ${res.statusCode}');
        pageCounter++;
      }
    } catch (e) {
      print('Exception: $e');
      pageCounter++;
    }
  }
  // Save the links to a file
  final linksFile =
      await File('the_links.txt').writeAsString(theLinks.join('\n'));
  print('Saved links to ${linksFile.path}');

  int counter = 1;
  for (final link in theLinks) {
    try {
      final res2 = await http.get(Uri.parse(link));
      final document2 = parser.parse(res2.body);
      final textContent = document2.body?.text;
      var cleanedText = textContent?.replaceAll(RegExp(r'[^a-zA-Z\s]'), '');
      if (cleanedText != null) {
        cleanedText =
            cleanedText.replaceAll(RegExp(r'^\s*$', multiLine: true), '');
        final file = await File('url$counter.txt').writeAsString(cleanedText);

        print('Saved plain text from $link to ${file.path}');
        counter++;
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
