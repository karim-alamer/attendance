import 'package:design_project/UI/dash_manage.dart';
import 'package:design_project/UI/manage_course.dart';
import 'package:design_project/UI/qcode_validation_request_onescreen.dart';
import 'package:design_project/UI/todays_class.dart';
import 'package:design_project/theme/app_decoration.dart';
import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/image_constant.dart';
import 'package:design_project/utils/size_utils.dart';
import 'package:design_project/widgets/app_bar/appbar_leading_image.dart';
import 'package:design_project/widgets/app_bar/appbar_title.dart';
import 'package:design_project/widgets/app_bar/appbar_trailing_image.dart';
import 'package:design_project/widgets/app_bar/custom_app_bar.dart';
import 'package:design_project/widgets/custom_icon_button.dart';
import 'package:design_project/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final boxConstraints = BoxConstraints(
      minWidth: screenSize.width,
      maxWidth: screenSize.width,
      minHeight: screenSize.height,
      maxHeight: screenSize.height,
    );
    SizeUtils.setScreenSize(boxConstraints, MediaQuery.of(context).orientation);
    // SizeUtils.setScreenSize(MediaQuery.of(context).size as BoxConstraints, MediaQuery.of(context).orientation);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: 500,
          padding: EdgeInsets.symmetric(
            horizontal: 25.h,
            vertical: 39.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomIconButton(
                    height: 61.adaptSize,
                    width: 61.adaptSize,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgUser03c,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.h,
                      top: 23.v,
                      bottom: 4.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shouq fahad",
                          style: theme.textTheme.titleMedium,
                        ),
                        const Text(
                          "444337766@nu.edu.sa",
                          // style: CustomTextStyles.bodyMediumRobotoBlack900,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 58.v),
              Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: Text(
                  "Hi, Shouq.",
                  style: theme.textTheme.displayMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: Text(
                  "Welcome to your Class",
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              SizedBox(height: 48.v),
              _buildTwelve(context),
              SizedBox(height: 21.v),
              _buildList(context),
              SizedBox(height: 29.v),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 1.h,
                      right: 19.h,
                    ),
                    child: _buildThirtyFour(
                      context,
                      checkAttendance: "Manage courses",
                    ),
                  ),
                 const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 19.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashCourses()),
                        );
                      },
                      child: const Icon(Icons.play_arrow, color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 34.v),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 1.h,
                      right: 19.h,
                    ),
                    child: _buildThirtyFour1(context),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 19.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QrCodeValidationRequestOneScreen()),
                        );
                      },
                      child: const Icon(Icons.play_arrow, color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 32.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h, right: 19.h),
                child: _buildThirtyFour(
                  context,
                  checkAttendance: "Check Attendance report",
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 68.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgSearch,
        margin: EdgeInsets.only(
          left: 38.h,
          top: 19.v,
          bottom: 5.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Hudurk",
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgBellFill,
          margin: EdgeInsets.fromLTRB(27.h, 19.v, 27.h, 5.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTwelve(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 18.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today’s Classes",
            style: theme.textTheme.headlineSmall,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ToDaysClass()),
              );
            },
            child: const Icon(Icons.play_arrow, color: Colors.black),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildList(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 5.h,
        right: 11.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
          // borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 17.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 32.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 7.h,
                    vertical: 2.v,
                  ),
                  // decoration: AppDecoration.fillLime.copyWith(
                  //   borderRadius: BorderRadiusStyle.circleBorder16,
                  // ),
                  child: Text(
                    "M",
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 6.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    "Mathematics ",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 9.v,
                    bottom: 5.v,
                  ),
                  child: Text(
                    "09:30 am",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(right: 15.h),
            child: Row(
              children: [
                Container(
                  width: 32.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.h,
                    vertical: 3.v,
                  ),
                  // decoration: AppDecoration.fillBlueGray.copyWith(
                  //   borderRadius: BorderRadiusStyle.circleBorder16,
                  // ),
                  child: Text(
                    "C",
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 5.v,
                    bottom: 4.v,
                  ),
                  child: Text(
                    "Calculus",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.v),
                  child: Text(
                    "10:40 am",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(right: 15.h),
            child: Row(
              children: [
                Container(
                  width: 32.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.h,
                    vertical: 3.v,
                  ),
                  // decoration: AppDecoration.fillBlueGray.copyWith(
                  //   borderRadius: BorderRadiusStyle.circleBorder16,
                  // ),
                  child: Text(
                    "A",
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 5.v,
                    bottom: 4.v,
                  ),
                  child: Text(
                    "Algebra",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.v),
                  child: Text(
                    "10:40 am",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(right: 15.h),
            child: Row(
              children: [
                Container(
                  width: 32.adaptSize,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.h,
                    vertical: 3.v,
                  ),
                  // decoration: AppDecoration.fillBlueGray.copyWith(
                  //   borderRadius: BorderRadiusStyle.circleBorder16,
                  // ),
                  child: Text(
                    "S",
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 5.v,
                    bottom: 4.v,
                  ),
                  child: Text(
                    "Statistics",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.v),
                  child: Text(
                    "10:40 am",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildThirtyFour1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        //left: 5.h,
        right: 19.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " QR Code validation Request",
            style: theme.textTheme.headlineSmall,
          ),
          CustomImageView(
            // imagePath: ImageConstant.imgOverflowMenu,
            height: 21.adaptSize,
            width: 21.adaptSize,
            margin: EdgeInsets.only(
              left: 1.h,
              top: 3.v,
              bottom: 4.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFour(
    BuildContext context, {
    required String s,
    required String statistics,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 32.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 9.h,
            vertical: 2.v,
          ),
          child: Text(
            s,
            style: theme.textTheme.titleLarge!.copyWith(
              color: appTheme.whiteA700,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            top: 6.v,
            bottom: 3.v,
          ),
          child: Text(
            statistics,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: appTheme.gray800,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 10.v,
            bottom: 4.v,
          ),
          child: Text(
            time,
            // style: theme.textTheme.bodyMedium!.copyWith(
            //   color: appTheme.blueGray400,
            // ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildThirtyFour(
    BuildContext context, {
    required String checkAttendance,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          checkAttendance,
          style: theme.textTheme.headlineSmall!.copyWith(
            color: appTheme.gray90002,
          ),
        ),
        CustomImageView(
          // imagePath: ImageConstant.imgOverflowMenu,
          height: 21.adaptSize,
          width: 21.adaptSize,
          margin: EdgeInsets.only(
            left: 53.h,
            top: 3.v,
            bottom: 4.v,
          ),
        ),
      ],
    );
  }
}
