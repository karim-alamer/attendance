import 'package:design_project/theme/custom_button_style.dart';
import 'package:design_project/theme/theme_helper.dart';
import 'package:design_project/utils/image_constant.dart';
import 'package:design_project/utils/size_utils.dart';
import 'package:design_project/widgets/custom_elevated_button.dart';
import 'package:design_project/widgets/custom_image_view.dart';
// import 'package:design_project/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QrCodeValidationRequestOneScreen extends StatefulWidget {
  QrCodeValidationRequestOneScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeValidationRequestOneScreen> createState() =>
      _QrCodeValidationRequestOneScreenState();
}

class _QrCodeValidationRequestOneScreenState
    extends State<QrCodeValidationRequestOneScreen> {
  final TextEditingController editTextController = TextEditingController();

  final TextEditingController editTextController1 = TextEditingController();

  final TextEditingController editTextController2 = TextEditingController();

  final TextEditingController editTextController3 = TextEditingController();

  final TextEditingController editTextController4 = TextEditingController();

  final TextEditingController editTextController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(context),
                const SizedBox(height: 40),
                _buildUserInfo(),
                const SizedBox(height: 20),
                _buildSectionTitle("QR code validation request"),
                const SizedBox(height: 20),
                _buildSectionSubtitle(
                    "Insert your information as a teacher below"),
                const SizedBox(height: 20),
                _buildTextFormField("First name", editTextController),
                const SizedBox(height: 10),
                _buildTextFormField("Last name", editTextController1),
                const SizedBox(height: 10),
                _buildTextFormField("Teacher ID", editTextController2),
                const SizedBox(height: 10),
                _buildTextFormField("Academic E-mail", editTextController3),
                const SizedBox(height: 10),
                _buildTextFormField("Password", editTextController4,
                    obscureText: true),
                const SizedBox(height: 10),
                _buildTextFormField("Re-enter password", editTextController5,
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
            padding: EdgeInsets.fromLTRB(34, 15, 34, 5),
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
    return Row(
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

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: TextStyle(fontSize: 18, color: Colors.grey),
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
        fillColor: Color(0xFF686868),
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
  // Widget _buildBackButton(String text) {
  //   return Center(
  //     child: SizedBox(
  //       width: 200,
  //       child: ElevatedButton(
  //         onPressed: () {
  //           if (text == "Save") {
  //             _showConfirmationDialog(context);
  //           }
  //         },
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: appTheme.blueGray800,
  //           shape: RoundedRectangleBorder(
  //             borderRadius:
  //                 BorderRadius.circular(25.0), // Adjust the radius as needed
  //           ),
  //         ),
  //         child: Text(
  //           text,
  //           style: const TextStyle(color: Colors.black),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
                Icons.cancel,
                color: Colors.red,
              ), // Add your icon here
              SizedBox(width: 15), // Adjust spacing as needed
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("invalid request alter?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    Text(
                      "an error occurred.please try again?",
                      style: TextStyle(color: Colors.grey, fontSize: 11),
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
                    horizontal: 15.0, vertical: 10.0),
                backgroundColor: const Color(0xFF046DA8),
                primary: Colors.white,
              ),
              child: const Text("Try again"),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Validation request success",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(
                      "your validation request is accepted successfully",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                      overflow: TextOverflow.clip,
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
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 46.0, vertical: 10.0),
                backgroundColor: const Color(0xFF046DA8),
                primary: Colors.white,
              ),
              child: const Text("return to home page"),
            ),
          ],
        );
      },
    );
  }
}
