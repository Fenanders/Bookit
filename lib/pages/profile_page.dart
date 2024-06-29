import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_books_yandi/helper/data_theme.dart';
import 'package:uas_books_yandi/helper/theme_changer.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool _darkMode = false;
  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  _toggleTheme(bool isOn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = isOn;
    });
    await prefs.setBool('darkMode', isOn);
  }

  @override
  Widget build(BuildContext context) {
    var themeModel = Provider.of<ThemeModel>(context, listen: false);
    final dataTheme = new DataTheme();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          ListTile(
            title: Text("Username"),
            subtitle: Text("JohnDoe"),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text("Email"),
            subtitle: Text("johndoe@example.com"),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text("Phone"),
            subtitle: Text("+1234567890"),
            leading: Icon(Icons.phone),
          ),
          ListTile(
            title: Text("About Me"),
            subtitle: Text("This is a description about John Doe."),
            leading: Icon(Icons.info_outline),
          ),
          ListTile(
            title: Text("Set To Dark Mode"),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Switch(
                  value: Provider.of<ThemeModel>(context).themeData.brightness == Brightness.dark,
                  onChanged: (value) {
                    setState(() {
                      // print(value);
                      themeModel.setTheme(value ? dataTheme.darkTheme() : dataTheme.lightTheme());
                      _toggleTheme(value);
                    });
                  },
                ),
              ],
            ),
            leading: Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
