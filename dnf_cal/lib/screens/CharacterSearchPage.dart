import 'package:dnf_cal/widgets/CharacterSearch/ServerSelectionWidget.dart';
import 'package:flutter/material.dart';
import '../widgets/CharacterSearch/CharacterSearchBar.dart';
import '../widgets/CharacterSearch/CharacterSearchTopWidget.dart';
import '../widgets/CharacterSearch/SearchResultTitleWidget.dart';

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
        CharacterSearchBar(),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ServerSelectionWidget(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SearchResultTitleWidget(),
        )
      ],
    );
  }
}
