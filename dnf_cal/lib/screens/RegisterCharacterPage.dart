import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/CharacterProfile.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/RegisterChracterEditBar.dart';
import 'package:flutter/material.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';

class RegisterCharacterPage extends StatefulWidget {
  const RegisterCharacterPage({Key? key}) : super(key: key);

  @override
  State<RegisterCharacterPage> createState() => _RegisterCharacterPageState();
}

class _RegisterCharacterPageState extends State<RegisterCharacterPage> {
  bool isEditing = false;
  List<int> items = List.generate(20, (index) => index);

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void removeItem(int id) {
    setState(() {
      items.removeWhere((item) => item == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        SizedBox(
          height: statusBarHeight + 16,
        ),
        RegisterChracterEditBar(
          onEdit: toggleEditing,
          isEditing: isEditing,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 22, left: 22, right: 22),
            color: Colors.transparent,
            child: GridView(
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 18,
              ),
              children: items
                  .map(
                    (id) => CharacterProfile(
                      isEditing: isEditing,
                      onDelete: () => removeItem(id),
                      id: id,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
