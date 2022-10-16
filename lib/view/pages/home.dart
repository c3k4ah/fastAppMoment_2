import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fortnite/view/pages/details.dart';
import 'package:fortnite/view/pages/profil.dart';
import 'package:fortnite/view/transition/transition.dart';

import '../../colors.dart';
import '../../controller/datactrl.dart';
import '../../mediaquery.dart';
import '../../model/skin.model.dart';
import '../widget/blur_container.dart';
import '../widget/rate.dart';

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CustomSize _size = CustomSize();
  final DataControll _data = DataControll();
  final _debouncer = Debouncer();
  List<SkinInfo> skinList = [];
  List<SkinInfo> localSkinList = [];

  @override
  void initState() {
    _data.getSkin().then((skinFromJson) {
      setState(() {
        skinList = skinFromJson;
        localSkinList = skinList.toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: swatch_1,
      appBar: AppBar(
        backgroundColor: swatch_1,
        elevation: 0,
        title: const Text(
          "Skin List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 7,
            ),
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(context, TransitionPage(const ProfilPage()));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              child: Icon(
                Icons.person,
                size: 30,
                color: swatch_1,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: _size.height(context),
        width: _size.width(context),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _size.width(context),
                height: 55,
                margin: const EdgeInsets.all(
                  15,
                ),
                decoration: BoxDecoration(
                  color: swatch_2.withOpacity(
                    .15,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      //controller: _searchController,
                      onChanged: (val) {
                        _debouncer.run(() {
                          setState(() {
                            localSkinList = skinList
                                .where(
                                  (u) =>
                                      (u.name.toString().toLowerCase().contains(
                                            val.toString().toLowerCase(),
                                          )),
                                )
                                .toList();
                          });
                        });
                      },
                      onSaved: (val) {},
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 35,
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text(
                  "Most Popular Skin",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: _size.width(context),
                height: _size.height(context) * .7,
                child: buildSkinList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildSkinList() {
    if (localSkinList.isNotEmpty) {
      return OrientationBuilder(builder: (context, orientation) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.6,
          ),
          itemCount: localSkinList.length,
          itemBuilder: ((context, index) {
            SkinInfo skin = localSkinList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  TransitionPage(
                    Details(
                      skinInfo: skin,
                    ),
                  ),
                );
              },
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    height: 230,
                    decoration: BoxDecoration(
                      color: swatch_2.withOpacity(
                        .15,
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ExactAssetImage(
                          skin.image!,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    height: 65,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  blurContainer(
                    width: _size.width(context),
                    height: 65,
                    radius: 20,
                    sigmaX: 7.0,
                    sigmaY: 7.0,
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 7),
                          child: Text(
                            skin.name!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: rate(
                              rateStar: skin.rate!,
                              width: 100,
                              iconSize: 20,
                              color: swatch_6),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        );
      });
    }
    return SizedBox(
      height: 5,
      child: LinearProgressIndicator(
        color: swatch_6,
        minHeight: 1,
        backgroundColor: swatch_5,
      ),
    );
  }
}
