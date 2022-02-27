// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class QuestionsListCard extends StatelessWidget {
  const QuestionsListCard({
    Key? key,
    required this.questionsName,
    required this.onPressed,
  }) : super(key: key);

  final String questionsName;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/qa.png",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    questionsName,
                    style: TextStyle(
                      fontSize: 16, //button font size
                      //button font color
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
