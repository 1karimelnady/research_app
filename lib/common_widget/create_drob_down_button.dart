import 'package:provider/provider.dart';
import '../app_manager/local_data.dart';
import '../cubit/Auth_cubit/auth_cubit.dart';
import '../providers/language_provider.dart';
import '../utilities/cache_helper.dart';
import '../utilities/text_style.dart';
import 'package:flutter/material.dart';

class CreateDropDownSmall extends StatefulWidget {
  final AuthCubit authCubit;
  const CreateDropDownSmall({Key? key, required this.authCubit})
      : super(key: key);

  @override
  State<CreateDropDownSmall> createState() => _CreateDropDownSmallState();
}

class _CreateDropDownSmallState extends State<CreateDropDownSmall> {
  LanguageProvider? languageProvider;

  List<String> usertype = [];
  bool visibility = false;
  String? startedItem;

  @override
  void initState() {
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    usertype = [
      "male",
      "female",
    ];
    startedItem = "male";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: MainTitle.display5(context),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              setState(() {
                visibility = !visibility;
              });
            },
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: mainColor),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6.0),
                    topLeft: Radius.circular(6.0),
                    bottomRight: visibility == false
                        ? Radius.circular(6.0)
                        : Radius.circular(0.0),
                    bottomLeft: visibility == false
                        ? Radius.circular(6.0)
                        : Radius.circular(0.0),
                  ),
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        startedItem ?? "Gender",
                        style:
                            GreyTitle.display5(context).copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 28,
                      color: mainColor,
                    ),
                  ],
                )),
          ),
          Visibility(
              visible: visibility,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 0.7, color: mainColor),
                  ),
                  child: Column(
                      children: List.generate(
                          2,
                          (index) => InkWell(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  CacheHelper.setData(
                                      key: "gender",
                                      value: index == 0 ? "male" : "female");
                                  setState(() {
                                    visibility = !visibility;
                                    if (index == 0) {
                                      startedItem = usertype[index];
                                    } else {
                                      startedItem = usertype[index];
                                    }
                                  });
                                  widget.authCubit
                                      .saveUserGender(gender: usertype[index]);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      Text(usertype[index],
                                          style: MainTitle.display5(context)
                                              .copyWith(fontSize: 13)),
                                      Divider(
                                        color: mainColor,
                                        height: 1,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              )))))
        ],
      ),
    );
  }
}
