import 'package:flutter/material.dart';

import 'package:fortnite/colors.dart';
import 'package:fortnite/mediaquery.dart';
import 'package:fortnite/view/widget/skin_text.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final CustomSize _size = CustomSize();

  int indexSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: swatch_1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: swatch_1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "My Profile",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: SizedBox(
        height: _size.height(context),
        width: _size.width(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: swatch_1,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: swatch_6,
                    width: 2,
                  ),
                ),
              ),
              skinTextDetails(
                height: 80,
                width: 170,
                label: "Dominick R.G",
                text: "Pro gamer",
                bold: false,
                textAlign: TextAlign.center,
                textSize: 25,
              ),
              SizedBox(
                height: 80,
                width: _size.width(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    skinTextDetails(
                      label: "Joined",
                      text: "Mar 18th, 2018",
                      textSize: 15,
                      width: 120,
                      labelColor: swatch_6,
                    ),
                    skinTextDetails(
                      label: "Rating",
                      text: "8/10",
                      textSize: 15,
                      width: 70,
                      labelColor: swatch_6,
                    ),
                    skinTextDetails(
                      label: "Rarity",
                      text: "Shadow series",
                      textSize: 15,
                      width: 100,
                      labelColor: swatch_6,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    listMenu(
                      onPress: () {
                        setState(
                          () {
                            indexSelected = 1;
                          },
                        );
                      },
                      isSelected: indexSelected == 1,
                      title: "Personal Info",
                      icon: Icons.person,
                    ),
                    listMenu(
                      onPress: () {
                        setState(
                          () {
                            indexSelected = 2;
                          },
                        );
                      },
                      isSelected: indexSelected == 2,
                      title: "Game Progress",
                      icon: Icons.analytics,
                    ),
                    listMenu(
                      onPress: () {
                        setState(
                          () {
                            indexSelected = 3;
                          },
                        );
                      },
                      isSelected: indexSelected == 3,
                      title: "Billing Methods",
                      icon: Icons.wallet,
                    ),
                    listMenu(
                      onPress: () {
                        setState(
                          () {
                            indexSelected = 4;
                          },
                        );
                      },
                      isSelected: indexSelected == 4,
                      title: "Settigs",
                      icon: Icons.settings,
                    ),
                    listMenu(
                      onPress: () {
                        setState(
                          () {
                            indexSelected = 5;
                          },
                        );
                      },
                      isSelected: indexSelected == 5,
                      title: "Logout",
                      icon: Icons.logout,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listMenu({
    required VoidCallback onPress,
    required bool isSelected,
    required String title,
    required IconData icon,
  }) {
    return SizedBox(
      child: ListTile(
        onTap: onPress,
        leading: Icon(
          icon,
          color: !isSelected ? swatch_2 : swatch_6,
          size: 30,
        ),
        title: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: !isSelected ? swatch_2 : Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: !isSelected ? swatch_2 : Colors.white,
        ),
      ),
    );
  }
}
