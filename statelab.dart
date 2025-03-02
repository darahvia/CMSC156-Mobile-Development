import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateUserScreen(),
    );
  }
}

class CreateUserScreen extends StatefulWidget {
  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedSex = 'Male';
  bool _isConfirmed = false;

  void _submit() {
    if (_formKey.currentState!.validate() && _isConfirmed) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserScreen(
            name: _nameController.text,
            birthday: _birthdayController.text,
            sex: _selectedSex,
            description: _descriptionController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                maxLength: 20,
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                controller: _birthdayController,
                decoration: InputDecoration(labelText: 'Birthday (YYYY-MM-DD)'),
                keyboardType: TextInputType.datetime,
                validator: (value) =>
                    value!.isEmpty ? 'Enter a valid birthday' : null,
              ),
              DropdownButtonFormField(
                value: _selectedSex,
                items: ['Male', 'Female']
                    .map(
                        (sex) => DropdownMenuItem(value: sex, child: Text(sex)))
                    .toList(),
                onChanged: (value) => setState(() => _selectedSex = value!),
                decoration: InputDecoration(labelText: 'Sex'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Short Description'),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isConfirmed,
                    onChanged: (value) => setState(() => _isConfirmed = value!),
                  ),
                  Text('Confirm Information'),
                ],
              ),
              ElevatedButton(
                onPressed: _isConfirmed ? _submit : null,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  final String name, birthday, sex, description;

  UserScreen(
      {required this.name,
      required this.birthday,
      required this.sex,
      required this.description});

  @override
  Widget build(BuildContext context) {
    IconData sexIcon = sex == 'Male' ? Icons.male : Icons.female;

    return Scaffold(
      appBar: AppBar(title: Text('User Info')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(sexIcon, size: 100),
            Text('Name: $name'),
            Text('Birthday: $birthday'),
            Text('Sex: $sex'),
            Text('Description: $description'),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LabActivityScreen()),
              ),
              child: Text('Go to Lab Activity'),
            ),
          ],
        ),
      ),
    );
  }
}

class LabActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lab Activity'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Widget Tab'),
              Tab(text: 'Description Tab'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Widget Output Here')),
            Center(child: Text('Description of the Lab Activity')),
          ],
        ),
      ),
    );
  }
}
