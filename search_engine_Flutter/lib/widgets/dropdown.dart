import 'package:flutter/material.dart';
import 'package:search_engine/utils/constants.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {super.key, required this.dropdownvalue, required this.onChanged});

  final Function(String?)? onChanged;

  final String dropdownvalue;

  // List of items in our dropdown menu
  static const items = [
    'Inverted Index',
    'PageRank',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: DropdownButton(
        dropdownColor: secondaryColor,
        iconEnabledColor: primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 6,
        ),
        borderRadius: BorderRadius.circular(9),
        style: const TextStyle(
          color: primaryColor,
          fontFamily: 'Poppins-Regular',
        ),

        underline: const SizedBox(), //remove underline

        value: dropdownvalue,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 32,

        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),

        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: onChanged,
      ),
    );
  }
}
