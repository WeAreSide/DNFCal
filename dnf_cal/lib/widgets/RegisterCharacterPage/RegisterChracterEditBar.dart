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
            // characterList가 비어있으면 edit 버튼을 눌러도 아무런 동작을 하지 않는다.
            onPressed: context.watch<RegisterCharacterModel>().isEmpty
                ? null
                : () {
                    context.read<RegisterCharacterModel>().toggleEditing();
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
