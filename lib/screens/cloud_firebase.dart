import 'package:authe_email/functions/databaseFunctions.dart';
import 'package:authe_email/pages/pets.dart';
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
                  'bully',
                  'bully',
                  'bull',
                  10
                );
              }, child: Text("Create")),
                  ElevatedButton(onPressed: (){
                    update('pets', 'tom', 'animal', "tiger");
                  }, child: Text("Update")),
                      ElevatedButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>PetList()));
                      }, child: Text("Retrive")),
                          ElevatedButton(onPressed: (){
delete('pets', 'kitts');
                          }, child: Text("Delete"))
            ],
          ),
        ),
      ),
    );
  }
}