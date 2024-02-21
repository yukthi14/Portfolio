import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/const_sized_box.dart';
import 'package:portfolio/constants/launchUrl.dart';
import 'package:portfolio/constants/string.dart';
import 'package:portfolio/constants/text_style.dart';
import 'package:portfolio/screens/widgets/responsive.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.contact,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emailAddress(),
              Constants.sizedBox(height: 30),
              socialLinks(),
            ],
          ),
        ],
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.contact,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emailAddress(width: 350, height: 150),
              Constants.sizedBox(width: 30),
              socialLinks(width: 350, height: 150),
            ],
          ),
        ],
      ),
      desktop: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.contact,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emailAddress(),
              Constants.sizedBox(width: 30),
              socialLinks(),
            ],
          ),
        ],
      ),
      color: AppColor.bgColor,
      paddingWidth: size.width * 0.1,
    );
  }

  Container emailAddress({double width = 400, double height = 150}) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(color: AppColor.bgColor2, boxShadow: [
        BoxShadow(
          color: AppColor.black,
          spreadRadius: 4.0,
          blurRadius: 4.5,
          offset: const Offset(3.0, 4.5),
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: AppColor.bgColor,
                  radius: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.mail_outline_outlined,
                      color: AppColor.white,
                    ),
                  )),
              Constants.sizedBox(width: 20),
              Text(
                Strings.email,
                style: AppTextStyles.montserratStyle(color: AppColor.white),
              ),
            ],
          ),
          Constants.sizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              Strings.contactEmail,
              style: AppTextStyles.headerTextStyle(color: AppColor.white),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Container socialLinks({double width = 400, double height = 150}) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(color: AppColor.bgColor2, boxShadow: [
        BoxShadow(
          color: AppColor.black,
          spreadRadius: 4.0,
          blurRadius: 4.5,
          offset: const Offset(3.0, 4.5),
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: AppColor.bgColor,
                  radius: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.share_outlined,
                      color: AppColor.white,
                    ),
                  )),
              Constants.sizedBox(width: 20),
              Text(
                Strings.socialProfiles,
                style: AppTextStyles.montserratStyle(color: AppColor.white),
              ),
            ],
          ),
          Constants.sizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: CircleAvatar(
                    backgroundColor: AppColor.bgColor,
                    radius: 20,
                    child: GestureDetector(
                      onTap: () {
                        launchGitHub();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset(
                          AppAssets.github,
                          color: AppColor.white,
                        ),
                      ),
                    )),
              ),
              Constants.sizedBox(width: 20),
              CircleAvatar(
                  backgroundColor: AppColor.bgColor,
                  radius: 20,
                  child: GestureDetector(
                    onTap: () {
                      launchLinkedin();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        AppAssets.linkedIn,
                        color: AppColor.white,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              Constants.sizedBox(width: 20),
              CircleAvatar(
                  backgroundColor: AppColor.bgColor,
                  radius: 20,
                  child: GestureDetector(
                    onTap: () {
                      launchTwitter();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        AppAssets.twitter,
                        color: AppColor.white,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  // void _launchGitHub() async {
  //   if (await canLaunch(Links.githubLink)) {
  //     await launch(Links.githubLink);
  //   } else {
  //     throw 'Could not launch ${Links.githubLink}';
  //   }
  // }
}
