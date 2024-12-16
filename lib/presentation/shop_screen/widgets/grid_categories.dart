import 'package:alamodeapp/models/category_model.dart';
import 'package:alamodeapp/services/category_service.dart';
import 'package:alamodeapp/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';

class GridCategories extends StatefulWidget {
  const GridCategories({Key? key}) : super(key: key);

  @override
  _GridCategoriesState createState() => _GridCategoriesState();
}

class _GridCategoriesState extends State<GridCategories> {
  late Future<List<Category>> _futureCategories;
  final CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    _futureCategories = _categoryService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: _futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Hiển thị loading
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Hiển thị lỗi
          return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Hiển thị thông báo không có dữ liệu
          return Center(child: Text('Không có danh mục nào'));
        } else {
          // Hiển thị danh sách danh mục
          List<Category> categories = snapshot.data!;

          return Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 16.h, right: 24.h),
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: theme.textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          Text(
                            "See All",
                            style: CustomTextStyles.titleSmall15,
                          ),
                          SizedBox(width: 12.h),
                          CustomIconButton(
                            height: 30.h,
                            width: 30.h,
                            padding: EdgeInsets.all(6.h),
                            decoration: IconButtonStyleHelper.fillPrimary,
                            alignment: Alignment.center,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgArrow,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.h,
                    crossAxisSpacing: 4.h,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryItemWidget(category: category);
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  final Category category;

  const CategoryItemWidget({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.categoriesFilterScreen,
            arguments: category);
      },
      child: Container(
        padding: EdgeInsets.all(4.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onErrorContainer,
          borderRadius: BorderRadiusStyle.roundedBorder10,
          boxShadow: [
            BoxShadow(
              color: appTheme.black900.withOpacity(0.1),
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hiển thị hình ảnh danh mục
            CustomImageView(
              imagePath: category.image,
              height: 74.h,
              width: 74.h,
              radius: BorderRadius.circular(5.h),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.h),
            Text(
              category.name,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (category.subcategoryCount > 0)
              Container(
                margin: EdgeInsets.only(top: 4.h),
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
                decoration: BoxDecoration(
                  color: appTheme.blue5001,
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Text(
                  "${category.subcategoryCount}",
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.labelLargeBold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
