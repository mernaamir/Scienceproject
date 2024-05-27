import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradprojec/contact-model.dart';

// class firebaseFunctions{
//   getData() async {
//    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("Unversities").get();
//
//   }
// }

class firebaseFunctions{
  static CollectionReference <ContactModel> getcontactCollection()
  {
    return FirebaseFirestore.instance.collection("Contacts").withConverter<ContactModel>
      (fromFirestore: (snapshot, _) {
      return ContactModel.fromJson(snapshot.data()!);
    }, toFirestore: (value,_){
      return value.toJson();
    });
  }
  static void addcontact(ContactModel contact)
  {
    var collection=getcontactCollection();
    var docRef=collection.doc();
    contact.studID=docRef.id;
    docRef.set(contact);
  }}