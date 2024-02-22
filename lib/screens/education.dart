import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/const_sized_box.dart';
import 'package:portfolio/constants/string.dart';
import 'package:portfolio/constants/text_style.dart';
import 'package:portfolio/screens/widgets/responsive.dart';

class EducationalScreen extends StatefulWidget {
  const EducationalScreen({super.key});

  @override
  State<EducationalScreen> createState() => _EducationalScreenState();
}

class _EducationalScreenState extends State<EducationalScreen> {
  bool isHover = false;
  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.education,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isHover = value;
                });
              },
              child: educationalDetailsMobile(hover: isHover)),
        ],
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.education,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isHover = value;
                });
              },
              child: educationalDetails(hover: isHover)),
        ],
      ),
      desktop: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.education,
                style: AppTextStyles.headingStyles(fontSize: 30),
              ))),
          Constants.sizedBox(height: 60),
          InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  isHover = value;
                });
              },
              child: educationalDetails(hover: isHover)),
        ],
      ),
      color: AppColor.bgColor,
      paddingWidth: size.width * 0.1,
    );
  }

  AnimatedContainer educationalDetails({required bool hover}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: hover ? 555 : 550,
      height: hover ? 455 : 450,
      transform: hover ? onHoverActive : onHoverRemove,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
          color: AppColor.bgColor2,
          borderRadius: BorderRadius.circular(10),
          border:
              hover ? Border.all(color: AppColor.themeColor, width: 3) : null,
          boxShadow: [
            BoxShadow(
              color: AppColor.black,
              spreadRadius: 4.0,
              blurRadius: 4.5,
              offset: const Offset(3.0, 4.5),
            ),
          ]),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white,
            ),
            child: Image.asset(
              AppAssets.amcLogo,
            ),
          ),
          Constants.sizedBox(height: 30),
          Text(
            Strings.collegeName,
            style: AppTextStyles.montserratStyle(
              color: AppColor.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 12),
          Text(
            Strings.courseName,
            style: AppTextStyles.montserratStyle(
              color: AppColor.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 5),
          Text(
            Strings.year,
            style: AppTextStyles.montserratStyle(
                color: AppColor.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 30),
          Text(
            Strings.achievement,
            style: AppTextStyles.montserratStyle(
                color: AppColor.white, fontSize: 21),
            textAlign: TextAlign.start,
          ),
          Constants.sizedBox(height: 16),
          Text(
            Strings.achievementDes,
            style: AppTextStyles.headerTextStyle(color: AppColor.white),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }

  AnimatedContainer educationalDetailsMobile({required bool hover}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: hover ? 335 : 340,
      height: hover ? 515 : 510,
      transform: hover ? onHoverActive : onHoverRemove,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
          color: AppColor.bgColor2,
          borderRadius: BorderRadius.circular(10),
          border:
              hover ? Border.all(color: AppColor.themeColor, width: 3) : null,
          boxShadow: [
            BoxShadow(
              color: AppColor.black,
              spreadRadius: 4.0,
              blurRadius: 4.5,
              offset: const Offset(3.0, 4.5),
            ),
          ]),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white,
            ),
            child: Image.asset(
              AppAssets.amcLogo,
            ),
          ),
          Constants.sizedBox(height: 30),
          Text(
            Strings.collegeName,
            style: AppTextStyles.montserratStyle(
              color: AppColor.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 12),
          Text(
            Strings.courseName,
            style: AppTextStyles.montserratStyle(
              color: AppColor.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 5),
          Text(
            Strings.year,
            style: AppTextStyles.montserratStyle(
                color: AppColor.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 30),
          Text(
            Strings.achievement,
            style: AppTextStyles.montserratStyle(
                color: AppColor.white, fontSize: 21),
            textAlign: TextAlign.start,
          ),
          Constants.sizedBox(height: 16),
          Text(
            Strings.achievementDes,
            style: AppTextStyles.headerTextStyle(color: AppColor.white),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
