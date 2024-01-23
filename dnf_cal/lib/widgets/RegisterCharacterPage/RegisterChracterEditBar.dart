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
      margin: const EdgeInsets.only(bottom: 22, left: 20, right: 20),
      height: 41,
      color: Colors.transparent,
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/app_icon.png',
              width: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DnfText(
                adventurerName,
                fontSize: 16,
              ),
            ),
          ),
          Spacer(),
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
        ],
      ),
    );
  }
}
