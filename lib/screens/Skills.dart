import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/assets.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/const_sized_box.dart';
import 'package:portfolio/constants/string.dart';
import 'package:portfolio/constants/text_style.dart';
import 'package:portfolio/screens/widgets/responsive.dart';

class SkillsDetails extends StatefulWidget {
  const SkillsDetails({super.key});

  @override
  State<SkillsDetails> createState() => _SkillsDetailsState();
}

class _SkillsDetailsState extends State<SkillsDetails> {
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
                text: Strings.skills,
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
              child: skillsDetailMobile(hover: isHover)),
        ],
      ),
      tablet: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                  text: TextSpan(
                text: Strings.skills,
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
              child: skillsDetailTablet(hover: isHover)),
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
                text: Strings.skills,
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
              child: skillsDetails(hover: isHover)),
        ],
      ),
      color: AppColor.bgColor,
      paddingWidth: size.width * 0.1,
    );
  }

  Column skillsDetailMobile({required bool hover}) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Image.asset(
            AppAssets.flutterDartLogo,
          ),
        ),
        Constants.sizedBox(height: 20),
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Image.asset(
            AppAssets.firebaseLogo,
          ),
        ),
        Constants.sizedBox(height: 20),
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Image.asset(
            AppAssets.postmanLogo,
          ),
        ),
        Constants.sizedBox(height: 20),
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Image.asset(
            AppAssets.androidStudioLogo,
          ),
        ),
        Constants.sizedBox(height: 20),
        Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Image.asset(
            AppAssets.vsCodeLogo,
          ),
        ),
      ],
    );
  }

  Column skillsDetailTablet({required bool hover}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.flutterDartLogo,
              ),
            ),
            Constants.sizedBox(width: 20),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.firebaseLogo,
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 30), // Adding spacing between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.postmanLogo,
              ),
            ),
            Constants.sizedBox(width: 20),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.androidStudioLogo,
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.vsCodeLogo,
              ),
            ),
          ],
        )
      ],
    );
  }

  Column skillsDetails({required bool hover}) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.flutterDartLogo,
              ),
            ),
            Constants.sizedBox(width: 20),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.firebaseLogo,
              ),
            ),
            Constants.sizedBox(width: 20),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.postmanLogo,
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 30), // Adding spacing between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.androidStudioLogo,
              ),
            ),
            Constants.sizedBox(width: 20),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.white,
              ),
              child: Image.asset(
                AppAssets.vsCodeLogo,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
