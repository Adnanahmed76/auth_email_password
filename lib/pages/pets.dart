import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class PetList extends StatefulWidget {
  const PetList({super.key});

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this is a appbar
      appBar: AppBar(
        title: Text("My Pets"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>
        (stream: FirebaseFirestore.instance.collection('pets').snapshots(),
        builder: (context,petSnapshot){
          if(petSnapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            final petDocs=petSnapshot.data!.docs;
            return ListView.builder(
              itemCount: petDocs.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 10,
                  child: ListTile(
                  title: Text(petDocs[index]['name']),
                  subtitle: Text(petDocs[index]['animal']),
                  ),
                );
              });
          }
        }
        ),
      ),
    );
  }
}