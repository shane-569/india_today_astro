// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

import 'package:india_today_astro/widgets/app_bar_home.dart';
import 'package:india_today_astro/widgets/app_bar_profile.dart';
import 'package:india_today_astro/widgets/app_button.dart';
import 'package:india_today_astro/widgets/text_borders.dart';
import 'package:india_today_astro/widgets/wallet_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  TabController? nestedTabController;
  int currentTabIndex = 0;
  final nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nestedTabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
    nestedTabController!.animateTo(currentTabIndex);
  }

  var selectedRelation = "Mother";
  var selectedGender = "Male";
  List<String> relationShip = [
    "Mother",
    "Father",
    "Brother",
    "Sister",
    "Spouse",
    "Son",
    "Daughter",
    "Father in Law",
    "Mother in Law"
  ];

  List<String> genderList = ["Male", "Female", "Others"];
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    nestedTabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarProfile(
          appBarName: '',
          isLeading: true,
        ),
        body: DefaultTabController(
            length: 2,
            child: Scaffold(
                body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    toolbarHeight: 0,
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      indicatorColor: Colors.deepOrange,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.deepOrange,
                      isScrollable: false,
                      tabs: [
                        Tab(child: Text('My Profile')),
                        Tab(child: Text('Order History')),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  DefaultTabController(
                    length: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            height: 50.0,
                            // decoration: BoxDecoration(
                            //   color: Colors.deepOrange[100],
                            //   borderRadius: BorderRadius.circular(10.0),
                            // ),
                            child: TabBar(
                              controller: nestedTabController,
                              indicator: BubbleTabIndicator(
                                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                                  indicatorHeight: 40.0,
                                  indicatorColor: Colors.orangeAccent,
                                  indicatorRadius: 5),
                              labelStyle: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.deepOrange,
                              tabs: <Widget>[
                                Text('Basic Profile'),
                                Text('Friends and Family'),
                              ],
                              onTap: (index) {},
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                                controller: nestedTabController,
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Builder(
                                            // ignore: missing_return
                                            builder: (context) {
                                          if (isChecked == false) {
                                            return Column(
                                              children: [
                                                WalletWidget(),
                                                RoundedButton(
                                                  buttonName:
                                                      '+ Add new profile',
                                                  press: () {
                                                    setState(() {
                                                      isChecked = true;
                                                    });
                                                  },
                                                )
                                              ],
                                            );
                                          } else {
                                            return Column(children: [
                                              SizedBox(
                                                height: 500,
                                                child: Form(
                                                    key: formKey,
                                                    child: ListView(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text("Name"),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    nameController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                validator:
                                                                    (val) {
                                                                  if (val!
                                                                      .isEmpty) {
                                                                    return "This field is required";
                                                                  } else if (val
                                                                          .length >
                                                                      30) {
                                                                    return "Name should be less than 30 characters ";
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        hintText:
                                                                            "Your Name",
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedErrorBorder:
                                                                            errorBorderStyleForm(),
                                                                        suffixIcon:
                                                                            clearField(
                                                                          nameController,
                                                                          context,
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "Date of birth"),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 100,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          nameController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      validator:
                                                                          (val) {
                                                                        if (val!
                                                                            .isEmpty) {
                                                                          return "This field is required";
                                                                        } else if (val.length >
                                                                            30) {
                                                                          return "Name should be less than 30 characters ";
                                                                        }
                                                                      },
                                                                      maxLength:
                                                                          2,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "DD",
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedErrorBorder:
                                                                            errorBorderStyleForm(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 100,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          nameController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      validator:
                                                                          (val) {
                                                                        if (val!
                                                                            .isEmpty) {
                                                                          return "This field is required";
                                                                        } else if (val.length >
                                                                            30) {
                                                                          return "Name should be less than 30 characters ";
                                                                        }
                                                                      },
                                                                      maxLength:
                                                                          2,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "MM",
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedErrorBorder:
                                                                            errorBorderStyleForm(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 100,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          nameController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      validator:
                                                                          (val) {
                                                                        if (val!
                                                                            .isEmpty) {
                                                                          return "This field is required";
                                                                        } else if (val.length >
                                                                            30) {
                                                                          return "Name should be less than 30 characters ";
                                                                        }
                                                                      },
                                                                      maxLength:
                                                                          4,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "YYYY",
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedErrorBorder:
                                                                            errorBorderStyleForm(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "Time of birth"),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 100,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          nameController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      validator:
                                                                          (val) {
                                                                        if (val!
                                                                            .isEmpty) {
                                                                          return "This field is required";
                                                                        } else if (val.length >
                                                                            2) {
                                                                          return "Time should be less than 2 characters ";
                                                                        }
                                                                      },
                                                                      maxLength:
                                                                          2,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "HH",
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedErrorBorder:
                                                                            errorBorderStyleForm(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 100,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          nameController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      validator:
                                                                          (val) {
                                                                        if (val!
                                                                            .isEmpty) {
                                                                          return "This field is required";
                                                                        } else if (val.length >
                                                                            30) {
                                                                          return "Name should be less than 30 characters ";
                                                                        }
                                                                      },
                                                                      maxLength:
                                                                          2,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "MM",
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedErrorBorder:
                                                                            errorBorderStyleForm(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 100,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          nameController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      validator:
                                                                          (val) {
                                                                        if (val!
                                                                            .isEmpty) {
                                                                          return "This field is required";
                                                                        } else if (val.length >
                                                                            30) {
                                                                          return "Name should be less than 30 characters ";
                                                                        }
                                                                      },
                                                                      maxLength:
                                                                          4,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "YYYY",
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedErrorBorder:
                                                                            errorBorderStyleForm(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "Place of birth"),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    nameController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                validator:
                                                                    (val) {
                                                                  if (val!
                                                                      .isEmpty) {
                                                                    return "This field is required";
                                                                  } else if (val
                                                                          .length >
                                                                      30) {
                                                                    return "Name should be less than 30 characters ";
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                        hintText:
                                                                            "Place of birth",
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedErrorBorder:
                                                                            errorBorderStyleForm(),
                                                                        suffixIcon:
                                                                            clearField(
                                                                          nameController,
                                                                          context,
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Container(
                                                              width: 160,
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "Relation"),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  FormField<
                                                                      String>(builder: (FormFieldState<
                                                                          String>
                                                                      state) {
                                                                    return InputDecorator(
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Relation",
                                                                        contentPadding:
                                                                            EdgeInsets.all(8),
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                      ),
                                                                      child: DropdownButtonHideUnderline(
                                                                          child: DropdownButton<String>(
                                                                        value:
                                                                            selectedRelation,
                                                                        onChanged:
                                                                            (String?
                                                                                curentValSelected) {
                                                                          setState(
                                                                              () {
                                                                            selectedRelation =
                                                                                curentValSelected!;
                                                                            state.didChange(curentValSelected);
                                                                          });
                                                                        },
                                                                        items: relationShip
                                                                            .map((val) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                val,
                                                                            child:
                                                                                Text(val),
                                                                          );
                                                                        }).toList(),
                                                                      )),
                                                                    );
                                                                  }),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              width: 160,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "Gender"),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  FormField<
                                                                      String>(builder: (FormFieldState<
                                                                          String>
                                                                      state) {
                                                                    return InputDecorator(
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            "Gender",
                                                                        contentPadding:
                                                                            EdgeInsets.all(8),
                                                                        enabledBorder:
                                                                            borderStyleForm(),
                                                                        errorBorder:
                                                                            errorBorderStyleForm(),
                                                                        focusedBorder:
                                                                            borderStyleForm(),
                                                                      ),
                                                                      child: DropdownButtonHideUnderline(
                                                                          child: DropdownButton<String>(
                                                                        value:
                                                                            selectedGender,
                                                                        onChanged:
                                                                            (String?
                                                                                curentValSelected) {
                                                                          setState(
                                                                              () {
                                                                            selectedGender =
                                                                                curentValSelected!;
                                                                            state.didChange(curentValSelected);
                                                                          });
                                                                        },
                                                                        items: genderList
                                                                            .map((val) {
                                                                          return DropdownMenuItem<
                                                                              String>(
                                                                            value:
                                                                                val,
                                                                            child:
                                                                                Text(val),
                                                                          );
                                                                        }).toList(),
                                                                      )),
                                                                    );
                                                                  }),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              ),
                                              RoundedButton(
                                                buttonName: '+ Add new profile',
                                                press: () {
                                                  setState(() {
                                                    isChecked = false;
                                                  });
                                                },
                                              )
                                            ]);
                                          }
                                        })
                                      ],
                                    ),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.directions_transit, size: 350),
                ],
              ),
            ))));
  }
}
