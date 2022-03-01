import 'package:flutter/material.dart';

class InfoUserTitleSubTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const InfoUserTitleSubTitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
