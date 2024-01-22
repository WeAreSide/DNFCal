import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/RegisterCharacterModel.dart';

class RegisterChracterEditBar extends StatelessWidget {
  const RegisterChracterEditBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String adventurerName;
    if (context.watch<RegisterCharacterModel>().isEmpty ||
        context.watch<RegisterCharacterModel>().characterList.isEmpty) {
      adventurerName = "등록된 캐릭터가 없습니다.";
    } else {
      adventurerName = context
              .read<RegisterCharacterModel>()
              .characterList
              .first
              .adventureName ??
          "등록된 캐릭터가 없습니다.";
    }
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
                adventurerName,
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
