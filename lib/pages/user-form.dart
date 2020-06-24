import 'package:flutter/material.dart';
import 'package:ifsports/pages/user.dart';
import 'package:ifsports/provider/users-provider.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário User'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();

                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                autofocus: true,
                onSaved: (value) => _formData['name'] = value,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length < 3) {
                    return 'Nome inválido';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                initialValue: _formData['email'],
                autofocus: true,
                onSaved: (value) => _formData['email'] = value,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                autofocus: true,
                onSaved: (value) => _formData['avatarUrl'] = value,
                decoration: InputDecoration(
                  labelText: 'URL do Avatar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
