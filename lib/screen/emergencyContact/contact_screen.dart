import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resq_guide/helpers/contact.dart';
import 'package:resq_guide/models/contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late final UserProvider userProv;

  @override
  void initState() {
    super.initState();
    userProv = context.read<UserProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userProv.fetchData();
    });
  }

  void showAddUserDialog(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.nameController.text = '';
    userProvider.phoneNumberController.text = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: userProvider.nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: userProvider.phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                userProvider.addUser();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showUpdateDialog(BuildContext context, UserModel user) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.nameController.text = user.name;
    userProvider.phoneNumberController.text = user.phoneNumber;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: userProvider.nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: userProvider.phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                String newName = userProvider.nameController.text;
                String newPhoneNumber = userProvider.phoneNumberController.text;
                userProvider.updateUser(user.id, newName, newPhoneNumber);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/contact.jfif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Emergency\nContact',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: userProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: userProvider.userData.length,
                          itemBuilder: (context, index) {
                            final user = userProvider.userData[index];
                            return ListTile(
                              title: Text(user.name),
                              subtitle: Text(user.phoneNumber),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      showUpdateDialog(context, user);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      userProvider.deleteUser(user.id);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserDialog(context);
        },
        backgroundColor: const Color.fromARGB(255, 223, 127, 80),
        child: const Icon(Icons.add),
      ),
    );
  }
}
