import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/models/RegisterCharacterModel.dart';
import 'package:dnf_cal/realm/Character.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/CharacterProfile.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/RegisterChracterEditBar.dart';
import 'package:flutter/material.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:provider/provider.dart';

class RegisterCharacterPage extends StatefulWidget {
  const RegisterCharacterPage({Key? key}) : super(key: key);

  @override
  State<RegisterCharacterPage> createState() => _RegisterCharacterPageState();
}

class _RegisterCharacterPageState extends State<RegisterCharacterPage> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        SizedBox(
          height: statusBarHeight + 16,
        ),
        RegisterChracterEditBar(),
        _RegisterCharacters(),
      ],
    );
  }
}

class _RegisterCharacters extends StatefulWidget {
  const _RegisterCharacters({Key? key}) : super(key: key);

  @override
  State<_RegisterCharacters> createState() => _RegisterCharactersState();
}

class _RegisterCharactersState extends State<_RegisterCharacters> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RegisterCharacterModel>(context);
    final characterList = model.characterList;
    return Expanded(
      child: GridView(
        padding: EdgeInsets.only(top: 22, left: 22, right: 22),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 18,
        ),
        children: [
          for (Character character in characterList)
            CharacterProfile(character),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<RegisterCharacterModel>(context, listen: false)
        .loadCharacterList();
  }
}
