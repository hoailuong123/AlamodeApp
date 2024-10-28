// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

import '../core/app_export.dart';

enum BottomBarEnum { loremipsumdolor3, loremipsumdolorsitametconsectetur }

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgGroup1950,
        activeIcon: ImageConstant.imgGroup1950,
        title: "Lorem ipsum dolor sit amet consectetur",
        type: BottomBarEnum.loremipsumdolorsitametconsectetur),
    BottomMenuModel(
        icon: ImageConstant.imgFavoritePrimary,
        activeIcon: ImageConstant.imgFavoritePrimary,
        title: "Lorem ipsum dolor sit amet consectetur",
        type: BottomBarEnum.loremipsumdolor3),
    BottomMenuModel(
        icon: ImageConstant.imgCategories,
        activeIcon: ImageConstant.imgCategories,
        title: "Lorem ipsum dolor sit amet consectetur",
        type: BottomBarEnum.loremipsumdolor3),
    BottomMenuModel(
        icon: ImageConstant.imgBagPrimary,
        activeIcon: ImageConstant.imgBagPrimary,
        title: "Lorem ipsum dolor sit amet consectetur",
        type: BottomBarEnum.loremipsumdolor3),
    BottomMenuModel(
        icon: ImageConstant.imgLockPrimary,
        activeIcon: ImageConstant.imgLockPrimary,
        title: "Lorem ipsum dolor sit amet consectetur",
        type: BottomBarEnum.loremipsumdolorsitametconsectetur),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0X29000000),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -1,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 20.64.h,
                  width: 22.02.h,
                  color: Color(0XFF004CFF),
                ),
                SizedBox(height: 5.5.h),
                SizedBox(
                  width: 116.2.h,
                  child: Text(
                    bottomMenuList[index].title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 12.fSize,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 30.h,
              width: 26.h,
              color: Color(0XFF000000),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {
          });
        },
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel(
      {required this.icon,
      required this.activeIcon,
      this.title,
      required this.type});

  String icon;
  String activeIcon;
  String? title;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
