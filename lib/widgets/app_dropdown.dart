// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final selectedItem;
  final String Selection;
  final Function(String?) onChanged;

  const Dropdown({
    required this.selectedItem,
    required this.Selection,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * .95,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 80.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: Selection,
                items: selectedItem.entries
                    .map<DropdownMenuItem<String>>(
                        (MapEntry<String, String> e) =>
                            DropdownMenuItem<String>(
                              value: e.key,
                              child: Text(
                                e.value,
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
