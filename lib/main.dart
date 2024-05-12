import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'codedart00',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          background: AppConstants.backgroundColor,
        ), // Background color
      ),
      home: BioLinkPage(),
    );
  }
}

class BioLinkPage extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile_picture.png'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  AppConstants.userName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  AppConstants.jobTitle,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppConstants.jancok,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20),
              LinkButton(
                title: 'Nihbuatjajan',
                onPressed: () {
                  _launchURL('https://sfl.gl/AxwwH');
                },
              ),
              LinkButton(
                title: 'GitHub',
                onPressed: () {
                  _launchURL('https://sfl.gl/Z0ZeEMi');
                },
              ),
              LinkButton(
                title: 'Tempatnya Beli Alat Spy',
                onPressed: () {
                  _launchURL('https://sfl.gl/vNDI');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinkButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  LinkButton({required this.title, required this.onPressed});

  @override
  _LinkButtonState createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: InkWell(
          onTap: widget.onPressed,
          onTapDown: (_) {
            setState(() {
              _isPressed = true;
            });
          },
          onTapCancel: () {
            setState(() {
              _isPressed = false;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isPressed = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: _isPressed
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppConstants.buttonPressedColor,
                        AppConstants.buttonPressedColor,
                      ],
                    )
                  : LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppConstants.buttonBackgroundColor,
                        AppConstants.buttonBackgroundColor,
                      ],
                    ),
              boxShadow: _isPressed
                  ? [
                      BoxShadow(
                        color: AppConstants.buttonPressedColor,
                        offset: Offset(0, 3),
                        blurRadius: 10,
                      ),
                    ]
                  : null,
            ),
             child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: AppConstants.buttonMaxWidth),
              child: Padding(
                padding: AppConstants.buttonPadding, // Menggunakan padding dari constant
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppConstants.buttonTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}