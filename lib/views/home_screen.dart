// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today_astro/bloc/categories_bloc/categories_bloc.dart';
import 'package:india_today_astro/bloc/categories_bloc/categories_event.dart';
import 'package:india_today_astro/bloc/categories_bloc/categories_state.dart';
import 'package:india_today_astro/widgets/app_bar_home.dart';
import 'package:india_today_astro/widgets/app_dropdown.dart';
import 'package:india_today_astro/widgets/question_widget.dart';
import 'package:india_today_astro/widgets/wallet_widget.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  String chosenValue = "Self";
  CategoriesBloc? categoriesBloc;
  List<String> questionsList = [
    "Which is the right path for me ?",
    "Where and what is my potential?",
    " Do people around me like me?",
    "Which gemstone is suitable for me?",
    "Does my future hold success?",
    "What do stars say about my life?"
  ];

  @override
  void initState() {
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc!.add(FetchCategoryEvent());
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarHome(
          appBarName: '',
          isLeading: false,
        ),
        body: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
          if (state is CategoriesInitialStates) {
            return CircularProgressIndicator();
          } else if (state is CategoriesLoadingStates) {
            return CircularProgressIndicator();
          } else if (state is CategoriesFetchSuccessStates) {
            // for (int i = 0;
            //     i < state.categoriesResponseModel!.data!.length;
            //     i++) {
            //   categoryList.add(state.categoriesResponseModel!.data![i].name!);
            // }
            // print(categoryList);

            Map<String, String> reasonList = {'0': 'Select Reason '};
            state.categoriesResponseModel!.data!.forEach((element) {
              reasonList[element.id.toString()] = element.name!;
            });
            print(reasonList);

            return Column(
              children: [
                WalletWidget(),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ask A Question",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "hhhhjvvcvvdbbbhbjkcdjbdbjdsbkbkk cbksjdsbcbkbkdkjbdskjbdsdksbjdskbjdsjkbdkbjdcbjkcdkbjkbjdskbjdsbjkdcbjkbjkbjkcjbkcbcbckjbkkbdjsdkbjcdbjkdcj cdbdbdcbjcdbkdjbkdjkbdsjkbdsjkbddjbkdcbjkdcjkbdcjbkdbjkc",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Choose Category",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            SizedBox(
                              height: 60,
                              child: Dropdown(
                                selectedItem: reasonList,
                                Selection: state
                                    .categoriesResponseModel!.data![0].id
                                    .toString(),
                                onChanged: (String? val) {
                                  setState(() {
                                    chosenValue = val!;
                                    print(chosenValue);
                                  });
                                },
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),

                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   child: DropdownButton<String>(
                            //     value: chosenValue,
                            //     elevation: 5,
                            //     style: TextStyle(color: Colors.black),
                            //     items: categoryList.map<DropdownMenuItem<String>>(
                            //         (String value) {
                            //       return DropdownMenuItem<String>(
                            //         value: value,
                            //         child: Text(value),
                            //       );
                            //     }).toList(),
                            //     hint: Text(
                            //       "Please choose a category",
                            //       style: TextStyle(
                            //           color: Colors.black,
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.w600),
                            //     ),
                            //     onChanged: (String? value) {
                            //       setState(() {
                            //         // chosenValue = value!;
                            //       });
                            //     },
                            //   ),
                            // ),
                            TextFormField(
                              minLines: 2,
                              maxLines: 5,
                              maxLength: 150,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: 'Ask a Question ',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                            ),
                            Text(
                              "Ideas What to Ask ? (Select Any )",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 200,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                      itemCount: questionsList.length,
                                      itemBuilder: (context, index) {
                                        return QuestionsListCard(
                                            questionsName: questionsList[index],
                                            onPressed: () {});
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container()
                    ],
                  ),
                ))
              ],
            );
          } else if (state is CategoriesErrorStates) return Container();
          return Scaffold();
        }));
  }
}
