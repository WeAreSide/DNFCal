import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/RegisterCharacterModel.dart';

class RegisterChracterEditBar extends StatelessWidget {
  const RegisterChracterEditBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                '모험단 이름',
                fontSize: 16,
              ),
            ),
          ),
          Consumer<RegisterCharacterModel>(
            builder: (context, registerCharacterModel, child) {
              return IconButton(
                onPressed: () {
                  registerCharacterModel.toggleEditing();
                },
                icon: Icon(
                  Provider.of<RegisterCharacterModel>(context).isEditing
                      ? Icons.edit_off
                      : Icons.edit,
                  color: Colors.white,
                  size: 30,
                ),
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
