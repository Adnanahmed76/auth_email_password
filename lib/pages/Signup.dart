
import 'package:authe_email/functions/authfunctions.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _fromkey=GlobalKey<FormState>();
  bool isLogin=false;
  String email="";
  String password="";
  String username="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Email/pass Auth",style: TextStyle(color: Colors.black),),),
        body: Form(
          key: _fromkey,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
           
              children: [
               !isLogin?  TextFormField(
                validator: (value){
                  if(value.toString().length<3){
                    return "Username is so small";
                  }
                  else{
                    return null;
                  }
                  
                },
                onSaved: (value){
                  setState(() {
                    username=value!;
                  });
                },
                  key: ValueKey("username"),
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                  
                  
                  
                  ),
                  
               ):Container(),
                SizedBox(
                  height: 10,
                ),
                 TextFormField(
                  key: ValueKey("email"),
                    validator: (value){
                  if(!(value.toString().contains("@"))){
                    return "Invalid email";
                  }
                  else{
                    return null;
                  }
                  
                },
                onSaved: (value){
                  setState(() {
                    email=value!;
                  });
                },
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  
                  
                  
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                 TextFormField(
                  obscureText: true,
                    validator: (value){
                  if(value.toString().length<6){
                    return "password is so small";
                  }
                  else{
                    return null;
                  }
                  
                },
                onSaved: (value){
                  setState(() {
                    password=value!;
                  });
                },
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  
                  
                  
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: 150,
                
                  child: ElevatedButton
                  (
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      
                    ),
                    onPressed: (){
                      if(_fromkey.currentState!.validate()){
                        _fromkey.currentState!.save();
                        SignUp(email, password);
                      }
                 
                    }, child : isLogin? Text("Login",style: TextStyle(fontSize: 20 ,color:  Colors.black),) : Text("Sign Up",style: TextStyle(fontSize: 20,color: Colors.black),)),
                ),
                
                TextButton(onPressed: (){ setState(() {
                        isLogin=!isLogin;
                      });}, child: isLogin? Text("dont have an account ? signup"): Text("Already have an account"))
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}