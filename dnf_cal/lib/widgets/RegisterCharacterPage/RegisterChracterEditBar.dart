import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/RegisterCharacterModel.dart';

class RegisterChracterEditBar extends StatelessWidget {
  const RegisterChracterEditBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RegisterCharacterModel>(context);
    final characterList = model.characterList;
    final bool isEmpty = characterList.isEmpty;
    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      height: 41,
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.square,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: DnfText(
                isEmpty ? "캐릭터를 등록해주세요" : "캐릭터 등록",
                fontSize: 16,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<RegisterCharacterModel>(context, listen: false)
                  .toggleEditing();
            },
            icon: Icon(
              Provider.of<RegisterCharacterModel>(context).isEditing
                  ? Icons.edit_off
                  : Icons.edit,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
