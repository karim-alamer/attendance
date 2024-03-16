import 'package:design_project/UI/qcode_validation_request_onescreen.dart';
import 'package:design_project/theme/custom_button_style.dart';
import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/image_constant.dart';
import 'package:design_project/utils/size_utils.dart';
import 'package:design_project/widgets/app_bar/appbar_leading_image.dart';
import 'package:design_project/widgets/app_bar/appbar_title.dart';
import 'package:design_project/widgets/app_bar/appbar_trailing_image.dart';
import 'package:design_project/widgets/app_bar/custom_app_bar.dart';
import 'package:design_project/widgets/custom_elevated_button.dart';
import 'package:design_project/widgets/custom_icon_button.dart';
import 'package:design_project/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class ToDaysClass extends StatefulWidget {
  const ToDaysClass({super.key});

  @override
  State<ToDaysClass> createState() => _ToDaysClassState();
}

class _ToDaysClassState extends State<ToDaysClass> {
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
                    "Todays Classes",
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                SizedBox(height: 21.v),
                _buildList(context),
                SizedBox(height: 29.v),
                _buildBackButton("Mark Attendance"),
                SizedBox(height: 29.v),
                _buildBackButton("Back"),
              ],
            ),
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
          _buildRow(context, "M", "Mathematics", 0),
          SizedBox(height: 11.v),
          _buildRow(context, "C", "Calculus", 1),
          SizedBox(height: 12.v),
          _buildRow(context, "A", "Algebra", 2),
          SizedBox(height: 12.v),
          _buildRow(context, "S", "Statistics", 3),
          SizedBox(height: 9.v),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String initial,
    String subject,
    int index,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_selectedRadio == index) {
                      // If the radio button is already selected, deselect it
                      _selectedRadio = -1;
                    } else {
                      // Otherwise, select the radio button
                      _selectedRadio = index;
                    }
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorMap[initial], // Background color
                  ),
                  child: Center(
                    child: Text(
                      initial,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: const TextStyle(
                        fontSize: 16), // Adjust font size as needed
                  ),
                  const Text(
                    "09:30 am",
                    style:
                        TextStyle(fontSize: 16), // Adjust font size as needed
                  ),
                ],
              ),
              const Spacer(),
              Radio<bool>(
                value: true,
                groupValue: _radioValues[index],
                onChanged: (bool? value) {
                  setState(() {
                    _radioValues[index] = value!;
                  });
                },
              ),
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
          setState(() {});
        },
      ),
    );
  }

  // Widget _buildBackButton(String text) {
  //   return Center(
  //     child: SizedBox(
  //       width: 200,
  //       child: ElevatedButton(
  //         onPressed: () {},
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: const Color.fromARGB(255, 1, 22, 39),
  //           shape: RoundedRectangleBorder(
  //             borderRadius:
  //                 BorderRadius.circular(25.0), // Adjust the radius as needed
  //           ),
  //         ),
  //         child: Text(
  //           text,
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
