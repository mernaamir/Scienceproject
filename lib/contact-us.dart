import 'package:flutter/material.dart';
import 'package:gradprojec/contact-model.dart';
import 'firebase_functions.dart';

class ContactUs extends StatefulWidget{
  static const String routeName="contactUs";

  ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController _name = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("تواصل معانا",style: TextStyle(fontSize: 30),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Text("تواصل معانا ",style: TextStyle(fontSize: 30),),
          const Text("اسمك  "),
          SizedBox(
              child: TextFormField(

                controller: _name,
              )),
          const Text("البريد الالكتروني الخاص بك"),
          SizedBox(
            width: double.infinity,
              child: TextFormField(
                controller: _email,
              )),
          const Text("ارسل لنا استفسارك "),
          SizedBox(
              child: TextFormField(
                controller: _phonenumber,
              )),
          ElevatedButton(
              onPressed: () {
                int phone=int.parse(_phonenumber.text);
                ContactModel contact = ContactModel(

                    name: _name.text, email: _email.text, phonenumber: phone);
                firebaseFunctions.addcontact(contact);
                _name.clear();
                _email.clear();
                _phonenumber.clear();


              },
              child: const Text("ارسال")),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, AllPersonScreen.routeName);
          //     },
          //     child: const Text("get persons")),
          // ElevatedButton(onPressed: (){
          //   Navigator.pushNamed(context, SearchScreen.routeName);
          // }, child: Text("Search for a person"))
        ],
      ),
    );
  }}
