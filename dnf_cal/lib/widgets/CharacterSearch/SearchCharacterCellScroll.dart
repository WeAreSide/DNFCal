import 'package:dnf_cal/models/SearchCharacterModel.dart';
import 'package:dnf_cal/widgets/SearchCharacterCell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/SearchModel.dart';

class SearchCharacterCellScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Column(
      children: [
        for (var character in context.watch<SearchModel>().searchedCharacter)
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            // child: SearchCharacterCell(),
            child: SearchCharacterCell(character: character),
          ),
      ],
    ));
  }
}
