import 'package:flutter/material.dart';
import 'package:flutter_library_new/utilites/constants.dart';
import 'package:flutter_library_new/utilites/enums.dart';

import 'Screens/Activity/Activity_screen.dart';
import 'Screens/Main/main_page.dart';
import 'Screens/QrReader/QrReade_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(

      padding: EdgeInsets.symmetric(vertical: 0),
      decoration: BoxDecoration(

        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -45),
            blurRadius: 90,
            color: kPrimaryColor.withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [



            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: new Icon(Icons.home),
                  highlightColor: kPrimaryColor,
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                  onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage()),
                  ); },
                ),

                Text(AppLocalizations.of(context).home,style: TextStyle( color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,fontSize: 14,fontWeight: FontWeight.bold),)
              ],
            ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: new Icon(Icons.workspaces_outline),
                    highlightColor: kPrimaryColor,
                    color: MenuState.activity == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                    onPressed: (){ Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActivityScreen()),
                    ); },
                  ),

                  Text(AppLocalizations.of(context).activities,style: TextStyle( color: MenuState.activity == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,fontSize: 14,fontWeight: FontWeight.bold),)
                ],
              ),

           Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: new Icon(Icons.mobile_screen_share_outlined),
                    highlightColor: kPrimaryColor,
                    color: MenuState.scan == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                    onPressed: (){ Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QRScanPage()),
                    ); },
                  ),

                  Text(AppLocalizations.of(context).borrowing,style: TextStyle( color: MenuState.scan == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,fontSize: 14,fontWeight: FontWeight.bold),)
                ],
              ),
            ],
          )),
    );
  }
}
