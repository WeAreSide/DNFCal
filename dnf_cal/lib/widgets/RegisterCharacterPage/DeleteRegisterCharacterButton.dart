import 'package:dnf_cal/models/RegisterCharacterModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget DeleteRegisterCharacterButton(BuildContext context,
    {required int id}) {
  return Consumer<RegisterCharacterModel>(
    builder: (context, registerCharacterModel, child) {
      if (registerCharacterModel.isEditing) {
        return Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('캐릭터 등록 해제'),
                      content: Text('캐릭터를 등록 해제 하시겠습니까?\n'
                          '등록 해제된 캐릭터는 언제든 캐릭터 검색 탭에서 다시 등록할 수 있습니다.'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('취소')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              registerCharacterModel.removeItem(id);
                            },
                            child: Text('확인')),
                      ],
                    );
                  });
            },
            icon: Icon(
              Icons.delete_forever,
              color: Color(0xffE80D0D),
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    },
  );
}
