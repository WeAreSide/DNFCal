import 'package:dnf_cal/models/CustomColor.dart';
import 'package:flutter/material.dart';

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
              Text(
                "검색 결과",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: CustomColor.uncommon(),
                  fontSize: 16,
                  fontFamily: "DNFForgedBlade",
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Visibility(
                  visible: true,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD9D9D9).withOpacity(0.6),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      side: BorderSide(color: CustomColor.buttonStroke(), width: 1),
                      minimumSize: const Size(16, 20), // 최소 너비와 높이
                    ),
                    child: Text(
                      "claer",
                      style: TextStyle(
                        color: CustomColor.uncommon(),
                        fontFamily: 'DNFForgedBlade', // Replace with your custom font family
                        fontSize: 16, // Adjust the font size as needed
                        // Other text style properties
                      ),
                    ),
                  )
              ),
            ],
          )
      ),
    );
  }
}
