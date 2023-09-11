import 'package:flutter/material.dart';
import 'package:vr_zoo/pages/login_page.dart';
import 'package:vr_zoo/provider/admin_home_page_provider.dart';
// import 'package:vr_zoo/provider/gridview_provider.dart';
import 'package:vr_zoo/provider/profile_provider.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    AdminHomePageProvider(),
    ProfilePage(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback(_showOpenDialog);
    super.initState();
  }

  // show Open Dialog method
  _showOpenDialog(_) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                "Note",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              content:
                  Text("You will be redirected to Home Page once you refresh"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                ElevatedButton(
                  child: Text("Dismiss"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.redAccent)))),
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              },
              icon: Icon(Icons.power_settings_new))
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the pop-up menu when the FAB is pressed.
          _showPopupMenu(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enable scrolling for the bottom sheet
      builder: (BuildContext context) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Add Data',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Create a form with TextFormFields
                    Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Animal Name'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Animal Description'),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Animal Image Url'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Animal Model 3d Url'),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Implement logic to add the item to your data source here.
                                  Navigator.of(context)
                                      .pop(); // Close the bottom sheet.
                                },
                                child: Text('Cancel'),
                              ),
                              SizedBox(width: 50,),
                              MaterialButton(
                                color: Colors.redAccent,
                                onPressed: () {
                                  // Implement logic to add the item to your data source here.
                                  Navigator.of(context)
                                      .pop(); // Close the bottom sheet.
                                },
                                child: Text('Add'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
