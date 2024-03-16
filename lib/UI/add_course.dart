import 'package:design_project/UI/update_course.dart';
import 'package:design_project/theme/custom_button_style.dart';
import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/image_constant.dart';
import 'package:design_project/widgets/custom_image_view.dart';
import 'package:design_project/widgets/custom_elevated_button.dart';
import 'package:design_project/utils/size_utils.dart';
// import 'package:design_project/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddCourse extends StatefulWidget {
  AddCourse({Key? key}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final TextEditingController editTextController = TextEditingController();

  final TextEditingController editTextController1 = TextEditingController();

  final TextEditingController editTextController2 = TextEditingController();

  final TextEditingController editTextController3 = TextEditingController();

  final TextEditingController editTextController4 = TextEditingController();

  final TextEditingController editTextController5 = TextEditingController();
  bool _showGoToUpdates = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(context),
                const SizedBox(height: 40),
                _buildUserInfo(),
                const SizedBox(height: 20),
                _buildSectionTitle("Add Courses"),
                const SizedBox(height: 20),
                _buildSectionSubtitle("Insert the course details below"),
                const SizedBox(height: 20),
                _buildTextFormField("Course Name", editTextController),
                const SizedBox(height: 10),
                _buildTextFormField("Course ID", editTextController1),
                const SizedBox(height: 10),
                _buildTextFormField("Semester", editTextController2),
                const SizedBox(height: 10),
                _buildTextFormField("Section", editTextController3),
                const SizedBox(height: 10),
                _buildTextFormField("Course hour count", editTextController4,
                    obscureText: true),
                const SizedBox(height: 30),
                _buildBackButton("Save"),
                const SizedBox(height: 10),
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

  void _goToUpdates() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UpdateCourseItem()),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionSubtitle(String subtitle) {
    if (_showGoToUpdates) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _showGoToUpdates = false;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateCourseItem()),
            );
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0), // Adjust padding as needed
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust border radius as needed
            //border: Border.all(color: Colors.red), // Border color
            color: const Color(0xFFC0A9A9), // Background color
          ),
          child: const Text(
            'Go to"Updated courses" to save changes',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xFF750B0B)), // Adjust text style as needed
          ),
        ),
      );
    }

    return Text(
      subtitle,
      style: const TextStyle(fontSize: 18, color: Colors.grey),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller,
      {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFF686868),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(25.0), // Adjust the radius as needed
        ),
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
            if (text == "Save") {
              _showConfirmationDialog(context);
            }
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Are you sure?",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    "Do you want to add this course?",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
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
              child: const Text("Confirm"),
            ),
            TextButton(
              onPressed: () {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Course added successfully",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(
                    "the IT course is added successfully",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
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
