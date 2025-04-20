import 'package:flutter/material.dart';
import 'package:search_engine/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.links, required this.index});
  final Map<String, dynamic> links;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: secondaryColor,
      ),
      child: ListTile(
        title: GestureDetector(
          onTap: () => _launchUrl(Uri.parse(links.keys.toList()[index])),
          child: Text(
            "${links.keys.toList()[index]}   ${links.values.toList()[index]}",
            style: const TextStyle(
              fontFamily: 'Poppins-Regular',
              color: primaryColor,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
