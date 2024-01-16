import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/models/RegisterCharacterModel.dart';
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
    return ChangeNotifierProvider(
      create: (context) {
        return RegisterCharacterModel();
      },
      child: Column(
        children: [
          SizedBox(
            height: statusBarHeight + 16,
          ),
          RegisterChracterEditBar(),
          Expanded(
            child: Selector<RegisterCharacterModel, int>(
              selector: (context, registerCharacterModel) =>
                  registerCharacterModel.items.length,
              builder: (context, items, child) {
                return GridView(
                  padding: const EdgeInsets.only(top: 22, left: 22, right: 22),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 18,
                  ),
                  children: Provider.of<RegisterCharacterModel>(context)
                      .items
                      .map(
                        (item) => CharacterProfile(
                          id: item,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
