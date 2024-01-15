import 'package:dnf_cal/models/SearchModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/CustomColor.dart';

class ServerSelectionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ServerSelectionWidget();
  }
}

class _ServerSelectionWidget extends State<ServerSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
          height: 30,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var serverName in context.read<SearchModel>().servers)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          context.read<SearchModel>().setServer(serverName);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xffD9D9D9).withOpacity(0.6),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        side: BorderSide(
                            color: CustomColor.buttonStroke(), width: 1),
                        minimumSize: const Size(16, 30), // 최소 너비와 높이
                      ),
                      child: Text(
                        serverName,
                        style: TextStyle(
                          color: context.read<SearchModel>().selectedServer ==
                                  serverName
                              ? CustomColor.uncommon()
                              : CustomColor.uncommon().withOpacity(0.5),
                          fontFamily: 'DNFForgedBlade',
                          // Replace with your custom font family
                          fontSize: 16, // Adjust the font size as needed
                          // Other text style properties
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}
