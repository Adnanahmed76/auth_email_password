import 'package:authe_email/functions/databaseFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class DatabaseOptions extends StatefulWidget {
  const DatabaseOptions({super.key});

  @override
  State<DatabaseOptions> createState() => _DatabaseOptionsState();
}

class _DatabaseOptionsState extends State<DatabaseOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
      appBar: AppBar(title: Text("Firebase options"),
       actions: [
            IconButton(onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              
            },
            icon: Icon(Icons.leave_bags_at_home), )
          ],
      
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                create(
                  'pets',
                  'kitty',
                  'jerry',
                  'cat',
                  5
                );
              }, child: Text("Create")),
                  ElevatedButton(onPressed: (){
                    update('pets', 'tom', 'age', 14);
                  }, child: Text("Update")),
                      ElevatedButton(onPressed: (){}, child: Text("Retrive")),
                          ElevatedButton(onPressed: (){}, child: Text("Delete"))
            ],
          ),
        ),
      ),
    );
  }
}