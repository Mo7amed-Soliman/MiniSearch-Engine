import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Search Engine',
      style: TextStyle(
        fontSize: 24,
        fontFamily: 'Poppins-Regular',
      ),
    );
  }
}
