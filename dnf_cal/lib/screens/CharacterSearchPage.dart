import 'package:dnf_cal/models/SearchModel.dart';
import 'package:dnf_cal/widgets/SearchCharacterCell.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import '../widgets/CharacterSearch/CharacterSearchBar.dart';
import '../widgets/CharacterSearch/CharacterSearchTopWidget.dart';
import '../widgets/CharacterSearch/SearchCharacterCellScroll.dart';
import '../widgets/CharacterSearch/SearchResultTitleWidget.dart';
import '../widgets/CharacterSearch/SearchAndFilterWidget.dart';
import '../realm/Chracter.dart';

class CharacterSearchPage extends StatefulWidget {
  const CharacterSearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CharacterSearchPageState();
  }
}

class _CharacterSearchPageState extends State<CharacterSearchPage> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: statusBarHeight + 16),
          child: const CharacterSearchPageTopWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SearchAndFilterWidget(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: SearchResultTitleWidget(),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
                child: SearchCharacterCellScroll()))
      ],
    );
  }
}
