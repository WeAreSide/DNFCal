import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';

class RegisterChracterEditBar extends StatelessWidget {
  final VoidCallback onEdit;
  final bool isEditing;
  const RegisterChracterEditBar(
      {Key? key, required this.onEdit, required this.isEditing})
      : super(key: key);

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
            size: 20,
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
          isEditing
              ? IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit_off,
                    color: Colors.white,
                  ))
              : IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
