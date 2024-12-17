import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { loremipsumdolor3, loremipsumdolorsitametconsectetur, order, profile }

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgGroup1950,
        activeIcon: ImageConstant.imgGroup1950,
        type: BottomBarEnum.loremipsumdolorsitametconsectetur),
    BottomMenuModel(
        icon: ImageConstant.imgBagPrimary,
        activeIcon: ImageConstant.imgBagPrimary,
        type: BottomBarEnum.loremipsumdolor3),
    BottomMenuModel(
        icon: ImageConstant.imgCategories,
        activeIcon: ImageConstant.imgCategories,
        type: BottomBarEnum.order),
    BottomMenuModel(
        icon: ImageConstant.imgLockPrimary,
        activeIcon: ImageConstant.imgLockPrimary,
        type: BottomBarEnum.profile),
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
            offset: Offset(0, -1),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 20.64.h,
                  width: 22.02.h,
                  color: Color(0XFF004CFF),
                ),
                SizedBox(height: 5.5.h),
                Text(
                  bottomMenuList[index].title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 12.fSize,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 30.h,
                  width: 26.h,
                  color: Color(0XFF000000),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onChanged?.call(bottomMenuList[index].type);
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
