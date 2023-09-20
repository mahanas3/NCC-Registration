import 'package:firebase2/Fire_store.dart';
import 'package:firebase2/login.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // List<void>signup;
  //  User_Repository repository;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final newname = TextEditingController();

  final newemail = TextEditingController();

  final newpassword = TextEditingController();

  final newnumber = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(0, 0, 60, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: UserRepository().getData(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Column(
                                children: [
                                  Text('Name:${snapshot.data[index]['name']}',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  Text(
                                    'Email:${snapshot.data[index]['email']}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Password:${snapshot.data[index]['password']}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Contact:${snapshot.data[index]['contact']}',
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  newname.text = snapshot.data[index]['name'];
                                  newemail.text = snapshot.data[index]['email'];
                                  newpassword.text =
                                      snapshot.data[index]['password'];
                                  newnumber.text =
                                      snapshot.data[index]['contact'];



                                  showDialog(
                                      context: context,
                                      builder: (context)
                                  {

                                    return AlertDialog(
                                      title: const Text('UPDATE'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            TextField(
                                              controller: newname,
                                              decoration:
                                              const InputDecoration(
                                                  border:
                                                  OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        30)),
                                                  ),
                                                  hintText:
                                                  'Enter your name',
                                                  labelText: 'Name'),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                              controller: newemail,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          30))),
                                                  hintText:
                                                  'Enter your email',
                                                  labelText: 'Email'),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                              controller: newpassword,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          30))),
                                                  hintText:
                                                  'Enter your password',
                                                  labelText: 'Password'),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                                controller: newnumber,
                                                decoration: const InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius
                                                            .all(Radius
                                                            .circular(
                                                            30))),
                                                    hintText:
                                                    'Enter your phone',
                                                    labelText:
                                                    'Contact')),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Column(
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () async {

                                                      String newName =
                                                          newname.text;
                                                      String newEmail =
                                                          newemail.text;
                                                      String newPassword =
                                                          newpassword
                                                              .text;
                                                      String newContact =
                                                          newnumber.text;


                                                      await UserRepository().updateData(
                                                          documentId:
                                                              snapshot.data[
                                                                      index].id,
                                                          newname:
                                                              newName,
                                                          newemail:
                                                              newEmail,
                                                          newpassword:
                                                              newPassword,
                                                          newcontact:
                                                              newContact);

                                                      Navigator.pop(
                                                          context);
                                                    },
                                                    child: const Text(
                                                        'SUBMIT')),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });

                                },
                                child: const Text('UPDATE'),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  snapshot.data[index].id;
                                  print(snapshot.data[index].id);
                                  UserRepository()
                                      .deleteData(snapshot.data[index].id);

                                  setState(() {});

                                  UserRepository()
                                      .deleteData1(snapshot.data[index].id);
                                },
                                child: const Text('Delete'))
                          ],
                        );
                      }),
                );
              }
              return const Text('hello');
            },
          ),
          Center(
            child: SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text(
                    'SIGN-OUT',
                  )),
            ),
          )
        ],
      ),
    );
  }
}
