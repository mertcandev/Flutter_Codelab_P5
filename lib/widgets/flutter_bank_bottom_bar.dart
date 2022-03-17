// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p5/models/models.dart';
import 'package:flutter_codelab_p5/models/utilites.dart';

class FlutterBankBottomBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    var bottomItems = Utils.getBottomBarItems(context);

    return Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Utils.mainThemeColor.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset.zero
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          bottomItems.length, (index) {
            FlutterBankBottomBarItem bottomItem = bottomItems[index];
            
            return Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                highlightColor: Utils.mainThemeColor.withOpacity(0.2),
                splashColor: Utils.mainThemeColor.withOpacity(0.1),
                onTap: () {
                  bottomItem.action!();
                },
                child: Container(
                  constraints: const BoxConstraints(minWidth: 80),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(bottomItem.icon, color: Utils.mainThemeColor, size: 20),
                      Text(bottomItem.label!, 
                        style: const TextStyle(color: Utils.mainThemeColor, fontSize: 10)
                      )
                    ]
                  )
                )
              )
            );
          }
        )
      )
    );
  }
}
