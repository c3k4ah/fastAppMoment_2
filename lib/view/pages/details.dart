import 'package:flutter/material.dart';
import 'package:fortnite/colors.dart';
import 'package:fortnite/mediaquery.dart';
import 'package:fortnite/model/skin.model.dart';

import '../widget/blur_container.dart';
import '../widget/rate.dart';
import '../widget/skin_text.dart';

class Details extends StatefulWidget {
  final SkinInfo skinInfo;
  const Details({super.key, required this.skinInfo});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final CustomSize _size = CustomSize();

  Color skinBgColor(int code) {
    if (code == 3) {
      return swatch_3;
    } else if (code == 6) {
      return swatch_6;
    } else if (code == 5) {
      return swatch_5;
    } else {
      return swatch_1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: skinBgColor(widget.skinInfo.color!),
      body: SizedBox(
        height: _size.height(context),
        width: _size.width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: _size.height(context),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: _size.width(context),
                        height: _size.height(context) * .8,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image:
                                    ExactAssetImage(widget.skinInfo.image!))),
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: _size.height(context) * .4,
                          width: _size.width(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.none,
                                  image:
                                      ExactAssetImage(widget.skinInfo.image!))),
                        ),
                        Container(
                          height: _size.height(context) * .4,
                          decoration: BoxDecoration(
                            color: swatch_1.withOpacity(
                              0.6,
                            ),
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                        ),
                        blurContainer(
                          width: _size.width(context),
                          height: _size.height(context) * .4,
                          radius: 20,
                          sigmaX: 30.0,
                          sigmaY: 30.0,
                          margin: EdgeInsets.zero,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                height: 5,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: swatch_2,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 7),
                                width: _size.width(context),
                                //  color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.skinInfo.name!,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _size.width(context),
                                      child: Center(
                                        child: rate(
                                          rateStar: widget.skinInfo.rate!,
                                          width: 150,
                                          iconSize: 30,
                                          color: skinBgColor(
                                            widget.skinInfo.color!,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        skinTextDetails(
                                          label: "Type",
                                          text: widget.skinInfo.type!,
                                        ),
                                        skinTextDetails(
                                          label: "Rarity",
                                          text: widget.skinInfo.rarity!,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        skinTextDetails(
                                          label: "Price",
                                          text:
                                              "${widget.skinInfo.cost.toString()} Ar",
                                        ),
                                        skinTextDetails(
                                          label: "Description",
                                          text: widget.skinInfo.description!,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: MaterialButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: skinBgColor(
                                          widget.skinInfo.color!,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "CHOOSE SKIN",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
