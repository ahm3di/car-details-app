import 'dart:ui';
import 'package:car_details_app/screens/email_login.dart';
import 'package:car_details_app/widgets/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:car_details_app/screens/home_screen.dart';

class LoginOptions extends StatefulWidget {
  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Colors.teal[200],
              Colors.teal[100],
              Colors.teal[50],
              Colors.teal[50],
              Colors.white
            ])),
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 150, bottom: 20),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 0, bottom: 20),
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            Container(
              child: new Text(
                "Login",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25.0),
            SizedBox(
              height: 50.0,
              child: SignInButton(
                Buttons.Email,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmailLogin()));
                },
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 50.0,
              child: SignInButton(
                Buttons.GoogleDark,
                onPressed: () async {
                  bool result = await AuthProvider().loginWithGoogle();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  if (!result) print("Error logging in with google");
                },
              ),
            ),
            SizedBox(height: 40.0),
            GestureDetector(
                onTap: () {
                  _showDialog("About", "");
                },
                child: new Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 19.0, color: Colors.cyan[800]),
                )),
            Container(
              padding: const EdgeInsets.only(top: 95),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("CN6211",
                      style: TextStyle(fontSize: 12.0, color: Colors.blueGrey)),
                  Text("Mobile App Development",
                      style: TextStyle(fontSize: 12.0, color: Colors.blueGrey)),
                  Text("Ahmed, Talia, Chris & Keerthy (2020)",
                      style: TextStyle(fontSize: 12.0, color: Colors.blueGrey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Privacy Policy"),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                      'Muhammed Ahmed Iqbal (u1715095), Talia-Mikayla Vellai (u1701356), Christopher Catt (u1703109) & Keerthy Pulendrarajah (u1708102)'
                      'built the My Car Details app as an Open Source app. '
                      'This app was created in fulfilment of the coursework assessment for module CN6211 provided by '
                      'Gaurav Malik',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan[800])),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Information Collection and Use",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "For a better experience, while using our Service, you maybe required to provide us with certain personally identifiable information, "
                            "such as your email address and car registration plate. "
                            "The information that is requested will be retained on your device and is not collected by us in any way."
                            "The app does use third-party services that may collect information used to identify you."
                            "Link to privacy policy of third-party service providers used by the app:",
                            style: TextStyle(color: Colors.cyan[800])),
                        SizedBox(height: 10.0),
                        Text("<Google Analytics for Firebase>",
                            style: TextStyle(color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Log Data",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "We want to inform you that whenever you use our Service, "
                            "in a case of an error in the app data and information (through third party products) on your phone called Log Data is collected. "
                            "This Log Data may include information such as your device Internet Protocol (“IP”) address, "
                            "operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.",
                            style: TextStyle(color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Cookies",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. "
                            "These are sent to your browser from the websites that you visit and are stored on your device's internal memory."
                            "This Service does not use these “cookies” explicitly. "
                            "However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. "
                            "You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device.",
                            style: TextStyle(color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Service Providers",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "We may employ third-party companies and individuals due to the following reasons:",
                            style: TextStyle(color: Colors.cyan[800])),
                        SizedBox(height: 10.0),
                        Text("•	To facilitate our Service ; ",
                            style: TextStyle(color: Colors.cyan[800])),
                        Text(
                            "•	To provide the Service on our behalf ;"
                            "or",
                            style: TextStyle(color: Colors.cyan[800])),
                        Text("•	To perform Service-related services ; ",
                            style: TextStyle(color: Colors.cyan[800])),
                        SizedBox(height: 10.0),
                        Text(
                            "We want to inform users of this Service that these third parties have access to your Personal Information. "
                            "The reason is to perform the tasks assigned to them on our behalf. "
                            "However, they are obligated not to disclose or use the information for any other purpose.",
                            style: TextStyle(color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Security",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "We value your trust in providing us your Personal Information, "
                            "thus we are striving to use commercially acceptable means of protecting it. "
                            "But remember that no method of transmission over the internet, "
                            "or method of electronic storage is 100% secure and reliable, "
                            "and we cannot guarantee its absolute security.",
                            style: TextStyle(color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Third Party Sites",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "This Service may contain links to other sites. "
                            "If you click on a third-party link, you will be directed to that site, for instance, "
                            "Google Maps to check nearby car services. Note that these external sites are not operated by us. "
                            "Therefore, we strongly advise you to review the Privacy Policy of these websites. "
                            "We have no control over and assume no responsibility for the content, privacy policies,"
                            " or practices of any third-party sites or services.",
                            style: TextStyle(color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Children's Privacy",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "These Services do not address anyone under the age of 13.",
                            style: TextStyle(color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Changes To This Privacy Policy",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "The Policy on this page is effective as of 15-06-2020",
                            style: TextStyle(color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Contact Us",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at ",
                            style: TextStyle(color: Colors.cyan[800])),
                        SizedBox(height: 20.0),
                        Text(
                            "u1715095@uel.ac.uk, or u1701356@uel.ac.uk, or u1703109@uel.ac.uk, or u1708102@uel.ac.uk ",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.cyan[800])),
                        SizedBox(height: 50.0),
                        Text(
                            "This privacy policy page was created at privacypolicytemplate.net and modified/generated by App Privacy Policy Generator",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.cyan[800])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
