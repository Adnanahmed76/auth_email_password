
import 'package:cloud_firestore/cloud_firestore.dart';create ()async{
  await FirebaseFirestore.instance.collection('pets').doc('ton').set(
   { 'name':'Tom',
    'animal':'Dog',
    'age': 12
   }
  
  );
print("Database Updated");
}