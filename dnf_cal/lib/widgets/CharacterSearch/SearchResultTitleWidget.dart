import 'package:dnf_cal/models/CustomColor.dart';
import 'package:dnf_cal/models/SearchModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dnf_cal/widgets/global/DnfText.dart';

class SearchResultTitleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchResultTitleState();
  }
}

class _SearchResultTitleState extends State<SearchResultTitleWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
          height: 41,
          child: Row(
            children: [
              DnfText(
                "검색 결과",
                textAlign: TextAlign.left,
                fontSize: 16,
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Visibility(
                  visible: context.watch<SearchModel>().isSubmitted,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SearchModel>().setSubmitted(false);
                      context.read<SearchModel>().setInputText();
                      context.read<SearchModel>().clearText();
                      context.read<SearchModel>().setSearchedCharacter([]);
                      context.read<SearchModel>().setServer('all');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD9D9D9).withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      side: BorderSide(
                          color: CustomColor.buttonStroke(), width: 1),
                      minimumSize: const Size(16, 20), // 최소 너비와 높이
                    ),
                    child: DnfText(
                      "clear",
                      fontSize: 16, // Adjust the font size as needed
                    ),
                  )),
            ],
          )),
    );
  }
}
