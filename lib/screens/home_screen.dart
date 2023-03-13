import 'package:flutter/material.dart';
import 'package:portfolio/bloc/portfolio_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/string.dart';
import '../constants/url.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PortfolioBloc _bloc = PortfolioBloc();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.45,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/download.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage(Links.imagePath),
                  ),
                ),
              ),
            ),
          ),
          const Center(
              child: Text(
                Strings.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              )),
          const Center(
              child: Text(
                Strings.username,
                style: TextStyle(
                  color: Color(0xFF423472),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              )),
          const SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () async {
                    _bloc.add(Resume());
                  },
                  child: const Text(
                    "View Resume",
                    style: TextStyle(
                      color: Color(0xFF423472),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              const Divider(color: Colors.black87,)
            ],
          ),
          //===================================== above is resume============================
          Center(
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("About Me",
                            style: TextStyle(
                              color: Color(0xFF423472),
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(Strings.aboutMeSummary),

                        Divider(color: Colors.black87,)
                      ],

                    ),
                  ),

                ],
              ),
            ),
          ),
          // Column(
          //   children: [
          //     Container(
          //       color: Colors.cyanAccent,
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(
          //             vertical: 20,horizontal: 40),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //                 "sjcc"
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          _listViewCard(context, Lists.projectNameLists, Lists.projectDescLists,
              Lists.projectLinkLists),
        ],
      ),
    );
  }

  Widget _listViewCard(BuildContext context, List projectName,
      List projectDescription, List projectLink) {
    return Container(
        margin: EdgeInsets.only(left: MediaQuery
            .of(context)
            .size
            .width * 0.1, right: MediaQuery
            .of(context)
            .size
            .height * 0.2),
        height: MediaQuery
            .of(context)
            .size
            .height * 0.30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: projectName.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.3,
                child: Card(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  projectName[index],
                                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              projectDescription[index],
                            ),
                          ),
                          const Spacer(),
                          const Divider(color: Colors.black87,),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  _bloc.add(ViewProject(projectName: projectName[index] ));
                                },
                                child: Text(
                                  "View Project",
                                  style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w200).copyWith(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              );
            }
        )
    );
  }
//    Widget _listViewCard(BuildContext context, List projectName,List projectDescription,List projectLink) {
//      ListViewBuilder
//    }
//   return SizedBox(
//     width: MediaQuery.of(context).size.width * 0.4,
//     child: Card(
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             children: [
//               Icon(
//                 Icons.build,
//                 color: Colors.red,
//                 size: 18,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 projectName[index],
//                 style: kSectionTitleText,
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Text(
//             projectData.description,
//           ),
//         ),
//         const Spacer(),
//         const Divider(),
//         Align(
//           alignment: Alignment.bottomRight,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ElevatedButton(
//               onPressed: () async {
//                 //Launch project on GitHub
//                 final Uri _url = Uri.parse(projectData.link);
//                 await launchUrl(_url);
//               },
//               child: Text(
//                 "View Project",
//                 style: kSubTitleText.copyWith(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ]),
//     ),
//   );
// }
}

