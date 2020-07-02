import 'package:flutter/material.dart';
import 'package:ifsports/components/edit-profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    void _showEditProfilePanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child:  EditProfileForm(),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("PERFIL"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _showEditProfilePanel();
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Image.network(
                "https://pbs.twimg.com/profile_images/1258073549438242816/EifOVcV3_400x400.jpg",
                height: 150,
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              title: Text("Nome: "),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Email: "),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Modalidades:"),
            ),
          ),
        ],
      ),
    );
  }
}
