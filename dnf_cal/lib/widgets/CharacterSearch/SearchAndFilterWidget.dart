import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/models/SearchModel.dart';
import 'package:dnf_cal/widgets/CharacterSearch/CharacterSearchBar.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAndFilterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchAndFilterWidgetState();
  }
}

class _SearchAndFilterWidgetState extends State<SearchAndFilterWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          DropdownButton(
            dropdownColor: Colors.black.withOpacity(0.75),
            borderRadius: BorderRadius.circular(8.0),
            value: context.read<SearchModel>().selectedServer,
            items: context
                .read<SearchModel>()
                .servers
                .map((e) => DropdownMenuItem(
                      value: e, // 선택 시 onChanged 를 통해 반환할 value
                      child: DnfText(e),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                context.read<SearchModel>().setServer(value.toString());
              });
            },
          ),
          Flexible(child: CharacterSearchBar())
        ],
      ),
    );
  }
}