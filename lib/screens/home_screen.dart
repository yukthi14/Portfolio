import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/portfolio_bloc.dart';
import '../constants/string.dart';
import '../constants/url.dart';

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
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60, width: 3),
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
                  color: Color(0xFF423472),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )),
            const Center(
                child: Text(
              Strings.username,
              style: TextStyle(
                color: Color(0xFF423472),
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side:
                            const BorderSide(color: Colors.black87, width: 2)),
                    onPressed: () async {
                      _bloc.add(Resume());
                    },
                    child: const Text(
                      "View Resume",
                      style: TextStyle(
                        color: Color(0xFF423472),
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Divider(
                  color: Colors.black87,
                )
              ],
            ),
            //===================================== above is resume============================
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
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
                                fontSize: 25.0,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            Strings.aboutMeSummary,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Divider(color: Colors.deepPurple,
                            thickness: 2,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocProvider(
              create: (_) => _bloc,
              child: BlocBuilder<PortfolioBloc, ViewState>(
                  builder: (context, state) {
                if (state is ViewProjectInitialState) {
                  return _listViewCard(
                      context, state.name, state.description, state.link);
                } else {
                  return _errorMessageShowing(context);
                }
              }),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 35,
              endIndent: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        _bloc.add(Data());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.black87, width: 2),
                            image: const DecorationImage(
                              image: AssetImage('assets/linkedin.jpeg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _bloc.add(Git());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              border:
                                  Border.all(color: Colors.black87, width: 3),
                              image: const DecorationImage(
                                image: AssetImage('assets/github.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 30,
                child: const Text(
                  Strings.mailTo,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _errorMessageShowing(context) {
    return const Center(
      child: Text(
        Strings.errorMessage,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _listViewCard(BuildContext context, List projectName,
      List projectDescription, List projectLink) {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.height * 0.2),
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: projectName.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Card(
                  elevation: 40,
                  shadowColor: Colors.purple,
                  color: Colors.purple.shade100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.build,
                                color: Color(0xFF423472),
                                size: 25,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                projectName[index],
                                style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF423472)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            projectDescription[index],
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        ),
                        const Spacer(),
                        const Divider(
                          color: Colors.black87,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  shadowColor: Colors.black),
                              onPressed: () async {
                                _bloc.add(ViewProject(
                                    projectName: projectName[index]));
                              },
                              child: Text(
                                "View Project",
                                style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200)
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              );
            }));
  }
}
