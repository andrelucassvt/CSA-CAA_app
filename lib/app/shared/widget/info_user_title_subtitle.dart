import 'package:flutter/material.dart';

class InfoUserTitleSubTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final CrossAxisAlignment? crossAxisAlignment;
  const InfoUserTitleSubTitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.crossAxisAlignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[700]
          ),
        ),
        const Divider(),
      ],
    );
  }
}
