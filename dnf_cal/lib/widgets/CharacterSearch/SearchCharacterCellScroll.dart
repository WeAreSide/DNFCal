
import 'package:dnf_cal/models/SearchCharacterModel.dart';
import 'package:dnf_cal/widgets/SearchCharacterCell.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/SearchModel.dart';

class SearchCharacterCellScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (context.watch<SearchModel>().searchedCharacter.isEmpty)
            DnfText("검색 결과가 존재하지 않음"),
          for (var character in context.watch<SearchModel>().searchedCharacter)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
                onTap: () {},
                child: SearchCharacterCell(character: character),
              ),
            ),
        ],
      ),
    );
  }
}
