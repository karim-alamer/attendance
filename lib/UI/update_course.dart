//UpdateCourse
import 'package:design_project/UI/add_course.dart';
import 'package:design_project/UI/qcode_validation_request_onescreen.dart';
import 'package:design_project/theme/custom_button_style.dart';
import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/image_constant.dart';
import 'package:design_project/utils/size_utils.dart';
import 'package:design_project/widgets/custom_elevated_button.dart';
import 'package:design_project/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class UpdateCourseItem extends StatefulWidget {
  const UpdateCourseItem({super.key});

  @override
  State<UpdateCourseItem> createState() => _UpdateCourseItemState();
}

class _UpdateCourseItemState extends State<UpdateCourseItem> {
  List<bool> _radioValues = [false, false, false, false];
  int _selectedRadio = -1;
  bool _showGoToUpdates = false;

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
                  padding: EdgeInsets.only(bottom: 10.h, left: 5.h),
                  child: Text(
                    "Update Courses",
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                if (!_showGoToUpdates) ...[
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 5.h),
                    child: const Text(
                      "The unsaved courses changes blow",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
                SizedBox(height: 21.v),
                _buildList(context),
                SizedBox(height: 200.v),
                _buildBackButton("Save changes"),
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
      padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!_showGoToUpdates) ...[
            _buildRow(context, "M", "Mathematics", 0),
            SizedBox(height: 11.v),
          ],
          _buildRow(context, "C", "Calculus", 1),
          SizedBox(height: 20.v),
          if (!_showGoToUpdates) ...[
            _buildRow(context, "A", "Algebra", 2),
            SizedBox(height: 12.v),
          ],
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
              //const Icon(Icons.add_circle_outline),
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
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            QrCodeValidationRequestOneScreen()),
                  );
                },
                child: const Text("See Details",
                    style: TextStyle(color: Colors.yellow)),
                //child: const Icon(Icons.play_arrow, color: Colors.black),
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
          setState(() {
            _showConfirmationDialog(context);
            _showGoToUpdates = false;
          });
        },
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(width: 2.0, color: Colors.white),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment
                .start, // Align children to the start vertically
            children: [
              Icon(
                Icons.error,
                color: Color(0xFF046DA8),
              ), // Add your icon here
              SizedBox(width: 15), // Adjust spacing as needed
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Are you sure?",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      "Do you want to save changes?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Handle "Confirm" button press
                Navigator.of(context).pop();
                _showSuccessDialog(context);
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 28.0, vertical: 10.0),
                backgroundColor: const Color(0xFF046DA8),
                primary: Colors.white,
              ),
              child: const Text("Save"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  bool _showGoToUpdates = false;
                });
                // Handle "Cancel" button press
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.black)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 28.0, vertical: 10.0),
              ),
              child: const Text(
                "Decline",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(width: 2.0, color: Colors.white),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment
                .start, // Align children to the start vertically
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ), // Add your icon here
              SizedBox(width: 15), // Adjust spacing as needed
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("changes saved successfully",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                    Text(
                      "the courses changes are saved successfully",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          overflow: TextOverflow.clip),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Handle "Confirm" button press
                Navigator.of(context).pop();
                setState(() {
                  _showGoToUpdates = true;
                });
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                backgroundColor: const Color(0xFF046DA8),
                primary: Colors.white,
              ),
              child: const Text("return to add courses page"),
            ),
          ],
        );
      },
    );
  }
}
