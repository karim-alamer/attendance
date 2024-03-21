import 'package:design_project/UI/add_course.dart';
import 'package:design_project/UI/delete_couse.dart';
import 'package:design_project/UI/manage_course.dart';
import 'package:design_project/UI/qcode_validation_request_onescreen.dart';
import 'package:design_project/UI/update_course.dart';
import 'package:design_project/theme/custom_button_style.dart';
import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/image_constant.dart';
import 'package:design_project/utils/size_utils.dart';
import 'package:design_project/widgets/custom_elevated_button.dart';

import 'package:design_project/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class DashCourses extends StatefulWidget {
  const DashCourses({super.key});

  @override
  State<DashCourses> createState() => _DashCoursesState();
}

class _DashCoursesState extends State<DashCourses> {
  List<bool> _radioValues = [false, false, false, false];
  int _selectedRadio = -1;
  final Map<String, Color> colorMap = {
    'M': Color(0xFF6C4E00),
    'C': Color(0xFF1C2D40),
    'A': Color(0xFFD4BE70),
    'S': Color(0xFF1C2D40),
  };
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            //width: 500,
            padding: EdgeInsets.symmetric(
              horizontal: 25.h,
              vertical: 39.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildUserInfo(),
                  ],
                ),
                SizedBox(height: 58.v),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    "Manage Courses",
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: 21.v),
                _buildList(context),
                // SizedBox(height: 29.v),
                // _buildBackButton("Add Courses"),
                SizedBox(height: 29.v),
                _buildBackButton("Back"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 52,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: 63,
      leading: InkWell(
        onTap: () {
          // handle leading tap
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 33, top: 11, bottom: 9),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearch,
            height: 31,
            width: 30,
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: GestureDetector(
        onTap: () {
          // handle title tap
        },
        child: Padding(
          padding: EdgeInsets.zero,
          child: Text(
            "Hudurk",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: appTheme.blueGray900),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            // handle trailing tap
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(34, 15, 34, 5),
            child: CustomImageView(
              imagePath: ImageConstant.imgBellFill,
              height: 31,
              width: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/img_user_03c.png"),
          radius: 30,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shouq fahad",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("444337766@nu.edu.sa"),
          ],
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
                MaterialPageRoute(
                    builder: (context) => QrCodeValidationRequestOneScreen()),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 7.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(
            context,
            const Icon(Icons.add_circle_outline),
            "Add Course Details",
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ManageCourses()),
                );
              },
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 11.v),
          _buildRow(
            context,
            Icon(Icons.remove_circle_outline),
            "Delete Course",
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteCourseItem()),
                );
              },
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 12.v),
          _buildRow(
            context,
            Icon(Icons.calendar_today_sharp),
            "Update Course",
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateCourseItem()),
                );
              },
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 12.v),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    Icon initial,
    String subject,
    Widget index,
  ) {
    return Container(
      padding: const EdgeInsets.all(10), // Adjust padding as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Add border
        borderRadius: BorderRadius.circular(10), // Add border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              initial,
              SizedBox(width: 30.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: const TextStyle(
                        fontSize: 16), // Adjust font size as needed
                  ),
                ],
              ),
              const Spacer(),
              index,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(String text) {
    return GestureDetector(
      child: CustomElevatedButton(
        width: 200.h,
        text: text,
        buttonStyle: CustomButtonStyles.none,
        decoration: CustomButtonStyles.gradientBlueGrayToIndigoDecoration,
        alignment: Alignment.center,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCourse()),
          );
        },
      ),
    );
  }
}
