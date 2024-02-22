import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/const_sized_box.dart';
import 'package:portfolio/constants/string.dart';
import 'package:portfolio/constants/text_style.dart';
import 'package:portfolio/screens/widgets/responsive.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool isHover = false;
  final onHoverActive = Matrix4.identity()..translate(0, -30, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.experience,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHover = value;
                    });
                  },
                  child: educationalDetails(
                      hover: isHover,
                      companyName: Strings.companyName1,
                      role: Strings.job,
                      date: Strings.date1,
                      description: Strings.des1)),
              Constants.sizedBox(height: 40),
              educationalDetails(
                  height: 360,
                  hover: isHover,
                  companyName: Strings.companyName2,
                  role: Strings.job,
                  date: Strings.date2,
                  description: Strings.des2),
            ],
          ),
        ],
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.experience,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHover = value;
                    });
                  },
                  child: educationalDetails(
                      hover: isHover,
                      companyName: Strings.companyName1,
                      role: Strings.job,
                      date: Strings.date1,
                      description: Strings.des1)),
              Constants.sizedBox(height: 40),
              educationalDetails(
                  hover: isHover,
                  companyName: Strings.companyName2,
                  role: Strings.job,
                  date: Strings.date2,
                  description: Strings.des2),
            ],
          ),
        ],
      ),
      desktop: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.experience,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      isHover = value;
                    });
                  },
                  child: educationalDetails(
                      hover: isHover,
                      companyName: Strings.companyName1,
                      role: Strings.job,
                      date: Strings.date1,
                      description: Strings.des1)),
              Constants.sizedBox(width: 40),
              educationalDetails(
                  // width: 500,
                  // height: 450,
                  hover: isHover,
                  companyName: Strings.companyName2,
                  role: Strings.job,
                  date: Strings.date2,
                  description: Strings.des2),
            ],
          ),
        ],
      ),
      color: AppColor.bgColor2,
      paddingWidth: size.width * 0.1,
    );
  }

  AnimatedContainer educationalDetails({
    required bool hover,
    required String companyName,
    required String role,
    required String date,
    required String description,
    double width = 500,
    double height = 350,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: width,
      height: height,
      transform: hover ? onHoverActive : onHoverRemove,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(color: AppColor.bgColor, boxShadow: [
        BoxShadow(
          color: AppColor.black,
          spreadRadius: 4.0,
          blurRadius: 4.5,
          offset: const Offset(3.0, 4.5),
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            companyName,
            style: AppTextStyles.montserratStyle(
                color: AppColor.white, fontSize: 20),
            textAlign: TextAlign.start,
          ),
          Constants.sizedBox(height: 12),
          Text(
            date,
            style: AppTextStyles.headerTextStyle(
                color: AppColor.white, fontSize: 16),
            textAlign: TextAlign.start,
          ),
          Constants.sizedBox(height: 12),
          Text(
            role,
            style: AppTextStyles.headerTextStyle(
                color: AppColor.white, fontSize: 16),
            textAlign: TextAlign.start,
          ),
          Constants.sizedBox(height: 50),
          Text(
            description,
            style: AppTextStyles.headerTextStyle(
                color: AppColor.white, fontSize: 15),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
