import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/const_sized_box.dart';
import 'package:portfolio/constants/string.dart';
import 'package:portfolio/constants/text_style.dart';
import 'package:portfolio/screens/Skills.dart';
import 'package:portfolio/screens/about_me.dart';
import 'package:portfolio/screens/contact.dart';
import 'package:portfolio/screens/education.dart';
import 'package:portfolio/screens/experience.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'About',
    'Eduction',
    'Experience',
    'Skills',
    'Contact',
  ];
  var menuIndex = 0;
  final screensList = const <Widget>[
    HomeScreen(),
    AboutMeScreen(),
    EducationalScreen(),
    ExperienceScreen(),
    SkillsDetails(),
    ContactScreen(),
  ];
  Future scrollTo({required int index}) async {
    _itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() => setState(() {
              menuIndex = index;
            }));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        toolbarHeight: 90,
        titleSpacing: 40,
        elevation: 0,
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 768) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Strings.portfolio,
                  style: AppTextStyles.headerTextStyle(
                      color: AppColor.white, fontSize: 25),
                ),
                const Spacer(),
                PopupMenuButton(
                  icon: Icon(
                    Icons.menu_sharp,
                    size: 32,
                    color: AppColor.white,
                  ),
                  color: AppColor.lightBlue,
                  position: PopupMenuPosition.under,
                  constraints: BoxConstraints.tightFor(width: size.width * 0.9),
                  itemBuilder: (BuildContext context) => menuItems
                      .asMap()
                      .entries
                      .map((e) => PopupMenuItem(
                            textStyle: AppTextStyles.montserratStyle(
                                color: Colors.amberAccent),
                            onTap: () => scrollTo(index: e.key),
                            child: Text(e.value),
                          ))
                      .toList(),
                )
              ],
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(Strings.portfolio,
                    style: AppTextStyles.headerTextStyle(
                        color: AppColor.white, fontSize: 25)),
                const Spacer(),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          scrollTo(index: index);
                        },
                        borderRadius: BorderRadius.circular(100),
                        onHover: (value) {
                          setState(() {
                            if (value) {
                              menuIndex = index;
                            } else {
                              menuIndex = 0;
                            }
                          });
                        },
                        child: buildNavBarAnimatedContainer(
                            index, menuIndex == index ? true : false),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Constants.sizedBox(width: 10),
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Constants.sizedBox(width: 30),
                // Text(
                //   Strings.home,
                //   style: AppTextStyles.headerTextStyle(),
                // ),
                // Constants.sizedBox(width: 30),
                // Text(Strings.about, style: AppTextStyles.headerTextStyle()),
                // Constants.sizedBox(width: 30),
                // Text(Strings.education, style: AppTextStyles.headerTextStyle()),
                // Constants.sizedBox(width: 30),
                // Text(Strings.experience, style: AppTextStyles.headerTextStyle()),
                // Constants.sizedBox(width: 30),
                // Text(Strings.contact, style: AppTextStyles.headerTextStyle()),
                // Constants.sizedBox(width: 30),
              ],
            );
          }
        }),
      ),
      body: ScrollablePositionedList.builder(
        itemCount: screensList.length,
        itemScrollController: _itemScrollController,
        itemBuilder: (context, index) {
          return screensList[index];
        },
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 95 : 90,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: Text(
        menuItems[index],
        style: AppTextStyles.headerTextStyle(
            color: hover ? AppColor.themeColor : AppColor.white),
      ),
    );
  }
}
