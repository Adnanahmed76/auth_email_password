import 'package:cloud_firestore/cloud_firestore.dart';

// Function to create a new document in Firestore
create(String collName,  docName,  name,  animal, int age) async {
  try {
    await FirebaseFirestore.instance.collection(collName).doc(docName).set({
      'name': name,
      'animal': animal,
      'age': age,
    });
    print("Database Updated");
  } catch (e) {
    print("Error updating database: $e");
  }
}

// Function to update an existing document in Firestore
update(String collName, docName,  field,  newFieldValue) async {
  try {
    await FirebaseFirestore.instance.collection(collName).doc(docName).update({
      field: newFieldValue,
    });
    print("Success updated");
  } catch (e) {
    print("Error updating document: $e");
  }
}
delete(String collName,docName)async{
  await FirebaseFirestore.instance.collection(collName).doc(docName).delete();
  print("Document deleted");
}