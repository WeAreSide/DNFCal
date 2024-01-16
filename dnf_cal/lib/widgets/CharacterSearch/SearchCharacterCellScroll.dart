import 'package:dnf_cal/widgets/SearchCharacterCell.dart';
import 'package:flutter/material.dart';


class SearchCharacterCellScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 16),
              child: SearchCharacterCell(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SearchCharacterCell(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SearchCharacterCell(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SearchCharacterCell(),
            ),
          ],
        )
    );
  }
}
