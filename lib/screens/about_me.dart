import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/const_sized_box.dart';
import 'package:portfolio/constants/string.dart';
import 'package:portfolio/constants/text_style.dart';
import 'package:portfolio/screens/widgets/responsive.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(height: 150),
          buildFadeInRight(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildFadeInRight(),
          Constants.sizedBox(width: 150),
          buildAboutMeContents(),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildFadeInRight(),
          Constants.sizedBox(width: 150),
          buildAboutMeContents(),
        ],
      ),
      color: AppColor.bgColor2,
      paddingWidth: size.width * 0.1,
    );
  }

  FadeInRight buildFadeInRight() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: AppColor.bgColor,
          image: DecorationImage(
              image: AssetImage(AppAssets.profileImage), fit: BoxFit.fill),
        ),
      ),
    );
  }

  Expanded buildAboutMeContents() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeInRight(
            duration: const Duration(milliseconds: 1200),
            child: RichText(
              text: TextSpan(
                  text: Strings.about,
                  style: AppTextStyles.headingStyles(fontSize: 30),
                  children: [
                    TextSpan(
                      text: Strings.me,
                      style: AppTextStyles.headingStyles(
                          fontSize: 30, color: AppColor.themeColor),
                    )
                  ]),
            ),
          ),
          Constants.sizedBox(height: 30),
          FadeInLeft(
            duration: const Duration(milliseconds: 1600),
            child: Text(
              Strings.aboutMeSummary,
              style: AppTextStyles.normalStyles(),
            ),
          )
        ],
      ),
    );
  }
}
