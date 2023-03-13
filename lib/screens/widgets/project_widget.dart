import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project_model.dart';

class ProjectWidget extends StatelessWidget {
  Project projectData;
  ProjectWidget({Key? key, required this.projectData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  projectData.name,
                  style: const TextStyle(color: Color(0xFF423472),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Divider(color: Colors.red,),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () async {
                  //Launch project on GitHub
                  final Uri _url = Uri.parse(projectData.link);
                  await launchUrl(_url);
                },
                child: Text(
                  "View Project",
                  style: const TextStyle(color: Color(0xFF423472),
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,).copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}