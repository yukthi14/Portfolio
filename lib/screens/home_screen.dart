import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/const_sized_box.dart';
import 'package:portfolio/constants/string.dart';
import 'package:portfolio/constants/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PortfolioBloc _bloc = PortfolioBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(ProjectInitial());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          backgroundColor: AppColor.bgColor,
          toolbarHeight: 90,
          titleSpacing: 100,
          elevation: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(Strings.portfolio),
              const Spacer(),
              Text(
                Strings.home,
                style: AppTextStyles.headerTextStyle(),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(Strings.about, style: AppTextStyles.headerTextStyle()),
              const SizedBox(
                width: 30,
              ),
              Text(Strings.services, style: AppTextStyles.headerTextStyle()),
              const SizedBox(
                width: 30,
              ),
              Text(Strings.contact, style: AppTextStyles.headerTextStyle()),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(
              top: size.height * 0.3,
              left: size.width * 0.1,
              right: size.width * 0.1),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.helloText,
                        style: AppTextStyles.montserratStyle(
                            color: AppColor.white),
                      ),
                      Constants.sizedBox(height: 15),
                      Text(
                        Strings.name,
                        style: AppTextStyles.headingStyles(),
                      ),
                      Constants.sizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            Strings.role,
                            style: AppTextStyles.montserratStyle(
                                color: AppColor.white),
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                'Flutter Developer',
                                textStyle: AppTextStyles.montserratStyle(
                                    color: AppColor.lightBlue),
                              ),
                            ],
                            pause: const Duration(milliseconds: 1000),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          )
                        ],
                      ),
                      Constants.sizedBox(height: 15),
                      SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                          Strings.aboutMeSummary,
                          style: AppTextStyles.normalStyles(),
                        ),
                      ),
                      Constants.sizedBox(height: 22),
                      Row(
                        children: [
                          socialButton(asset: AppAssets.github),
                          Constants.sizedBox(width: 15),
                          socialButton(asset: AppAssets.linkedIn),
                          Constants.sizedBox(width: 15),
                          socialButton(asset: AppAssets.twitter),
                          Constants.sizedBox(width: 15),
                        ],
                      ),
                      Constants.sizedBox(height: 18),
                      buildMaterialButton(onTap: () {})
                    ],
                  ),
                  Constants.sizedBox(height: 18),
                ],
              )
            ],
          ),
        )
        // SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height * 0.45,
        //         decoration: const BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage('assets/background.jpeg'),
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //         child: Align(
        //           alignment: Alignment.bottomCenter,
        //           child: Padding(
        //             padding: const EdgeInsets.all(10),
        //             child: Container(
        //               decoration: BoxDecoration(
        //                 border: Border.all(color: Colors.white60, width: 3),
        //                 borderRadius: BorderRadius.circular(75),
        //               ),
        //               child: const CircleAvatar(
        //                 radius: 75,
        //                 backgroundImage: AssetImage(Links.imagePath),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       const Center(
        //           child: Text(
        //         Strings.name,
        //         style: TextStyle(
        //             color: Color(0xFF423472),
        //             fontSize: 30.0,
        //             fontWeight: FontWeight.bold),
        //       )),
        //       const Center(
        //           child: Text(
        //         Strings.username,
        //         style: TextStyle(
        //           color: Color(0xFF423472),
        //           fontWeight: FontWeight.bold,
        //           fontSize: 20.0,
        //         ),
        //       )),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           OutlinedButton(
        //               style: OutlinedButton.styleFrom(
        //                   side:
        //                       const BorderSide(color: Colors.black87, width: 2)),
        //               onPressed: () async {
        //                 _bloc.add(Resume());
        //               },
        //               child: const Text(
        //                 "View Resume",
        //                 style: TextStyle(
        //                   color: Color(0xFF423472),
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 17.0,
        //                 ),
        //               )),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           const Divider(
        //             color: Colors.black87,
        //           )
        //         ],
        //       ),
        //       //===================================== above is resume============================
        //       Center(
        //         child: SizedBox(
        //           width: MediaQuery.of(context).size.width * 0.8,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Flexible(
        //                 flex: 3,
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: const [
        //                     Text("About Me",
        //                         style: TextStyle(
        //                           color: Color(0xFF423472),
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 25.0,
        //                         )),
        //                     SizedBox(
        //                       height: 10,
        //                     ),
        //                     Text(
        //                       Strings.aboutMeSummary,
        //                       style: TextStyle(
        //                         fontSize: 23,
        //                         fontWeight: FontWeight.w500,
        //                       ),
        //                     ),
        //                     Divider(color: Colors.deepPurple,
        //                       thickness: 2,)
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       BlocProvider(
        //         create: (_) => _bloc,
        //         child: BlocBuilder<PortfolioBloc, ViewState>(
        //             builder: (context, state) {
        //           if (state is ViewProjectInitialState) {
        //             return _listViewCard(
        //                 context, state.name, state.description, state.link);
        //           } else {
        //             return _errorMessageShowing(context);
        //           }
        //         }),
        //       ),
        //       const Divider(
        //         color: Colors.black,
        //         thickness: 1,
        //         indent: 35,
        //         endIndent: 30,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(15.0),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             GestureDetector(
        //                 onTap: () {
        //                   _bloc.add(Data());
        //                 },
        //                 child: Padding(
        //                   padding: const EdgeInsets.only(top: 10.0),
        //                   child: Container(
        //                     width: 70,
        //                     height: 70,
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(80),
        //                       border: Border.all(color: Colors.black87, width: 2),
        //                       image: const DecorationImage(
        //                         image: AssetImage('assets/linkedin.jpeg'),
        //                         fit: BoxFit.fill,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: <Widget>[
        //                 GestureDetector(
        //                   onTap: () {
        //                     _bloc.add(Git());
        //                   },
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(top: 10.0),
        //                     child: Container(
        //                       width: 70,
        //                       height: 70,
        //                       decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(80),
        //                         border:
        //                             Border.all(color: Colors.black87, width: 3),
        //                         image: const DecorationImage(
        //                           image: AssetImage('assets/github.png'),
        //                           fit: BoxFit.fill,
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       Center(
        //         child: SizedBox(
        //           width: MediaQuery.of(context).size.width * 0.2,
        //           height: 30,
        //           child: const Text(
        //             Strings.mailTo,
        //             style: TextStyle(fontSize: 20),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }

  MaterialButton buildMaterialButton({
    required VoidCallback onTap,
  }) {
    return MaterialButton(
        color: AppColor.lightBlue,
        onPressed: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        hoverColor: AppColor.bgColor,
        splashColor: AppColor.splashColor,
        elevation: 6,
        height: 50,
        minWidth: 150,
        child: Text(
          Strings.downloadCv,
          style: AppTextStyles.headerTextStyle(),
        ));
  }

  Ink socialButton({required String asset}) {
    return Ink(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderColor, width: 2),
        color: AppColor.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {},
        splashColor: AppColor.splashColor,
        hoverColor: AppColor.lightShadeBlue,
        child: Image.asset(
          asset,
          width: 20,
          color: AppColor.themeColor,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

// Widget _errorMessageShowing(context) {
//   return const Center(
//     child: Text(
//       Strings.errorMessage,
//       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//     ),
//   );
// }

// Widget _listViewCard(BuildContext context, List projectName,
//     List projectDescription, List projectLink) {
//   return Container(
//       margin: EdgeInsets.only(
//           left: MediaQuery.of(context).size.width * 0.1,
//           right: MediaQuery.of(context).size.height * 0.2),
//       height: MediaQuery.of(context).size.height * 0.3,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: projectName.length,
//           itemBuilder: (context, index) {
//             return SizedBox(
//               width: MediaQuery.of(context).size.width * 0.3,
//               child: Card(
//                 elevation: 40,
//                 shadowColor: Colors.purple,
//                 color: Colors.purple.shade100,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           children: [
//                             const Icon(
//                               Icons.build,
//                               color: Color(0xFF423472),
//                               size: 25,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Text(
//                               projectName[index],
//                               style: const TextStyle(
//                                   fontSize: 23,
//                                   fontWeight: FontWeight.w700,
//                                   color: Color(0xFF423472)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           projectDescription[index],
//                           style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black87),
//                         ),
//                       ),
//                       const Spacer(),
//                       const Divider(
//                         color: Colors.black87,
//                       ),
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black87,
//                                 shadowColor: Colors.black),
//                             onPressed: () async {
//                               _bloc.add(ViewProject(
//                                   projectName: projectName[index]));
//                             },
//                             child: Text(
//                               "View Project",
//                               style: const TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w200)
//                                   .copyWith(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ]),
//               ),
//             );
//           }));
// }
}
