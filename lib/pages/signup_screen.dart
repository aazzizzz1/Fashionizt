import 'dart:convert';
import 'dart:ui';
import 'package:fashionizt/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController user = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController cpass = new TextEditingController();
  bool hidePassword = true;
  bool hidePassword2 = true;
  final List<String> items = [
    'Customer',
    'Designer',
    'Mitra Produksi',
  ];
  String? selectedValue;

  //api register
  Future register() async {
    final response = await http.post(Uri.parse("https://fashionizt.yufagency.com/signup.php"), body: {
      "username": user.text,
      "email": email.text,
      "password": pass.text,
      "cpassword" : cpass.text,
      "level" : selectedValue,
    });

    var data = json.decode(response.body);
    if
    (data == "Blank") {
      Fluttertoast.showToast(
        msg: "Please Fill Out The Entire Form",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return SignUpScreen();
          })
      );
    } else if (data == "Error") {
      Fluttertoast.showToast(
        msg: "User Already Exist",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return SignUpScreen();
          })
      );
    } else if (data == "Wrong Password") {
      Fluttertoast.showToast(
        msg: "Password Does Not Match",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return SignUpScreen();
          })
      );
    } else {
      Fluttertoast.showToast(
        msg: "Registration Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.2),
        fontSize: 15,
        textColor: blush,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen(),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
              backgroundColor: blacksand,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      // height: size.height * 0.13,
                      child: Column(
                        children: [
                          Container(
                            // height: size.height*0.08,
                            height: size.height * 0.11,
                          ),
                          // Top Text
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            // width: width,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: blush,
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.04,
                          ),
                          // TextFiled
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      controller: user,
                                      cursorColor: blush,
                                      style:
                                      TextStyle(color: blush),
                                      showCursor: true,
                                      decoration:
                                      kTextFiledInputDecoration, //ada di constant.dart
                                    ),
                                    Container(
                                      height: size.height * 0.02,
                                    ),
                                    TextFormField(
                                        controller: email,
                                        onSaved: (input) => email = input! as TextEditingController,
                                        validator: (input) => input!.contains('@')
                                            ? "Email id should be valid"
                                            : null,
                                        cursorColor: blush,
                                        style: TextStyle(
                                            color: blush),
                                        showCursor: true,
                                        decoration:
                                        kTextFiledInputDecoration
                                            .copyWith(
                                            labelText:
                                            "Email")),
                                    Container(
                                      height: size.height * 0.02,
                                    ),
                                    TextFormField(
                                      controller: pass,
                                      cursorColor: blush,
                                      style: TextStyle(color: blush),
                                      showCursor: true,
                                      keyboardType: TextInputType.text,
                                      onSaved: (input) => pass = input! as TextEditingController,
                                      validator: (input) => (input?.length ?? 0) < 3
                                          ? "Password should be more than 3 characters"
                                          : null,
                                      obscureText: hidePassword,
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: blush),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: blush, width: 2),
                                        ),
                                        labelText: "Password",
                                        labelStyle:
                                        TextStyle(color: blush, fontSize: 18, fontWeight: FontWeight.w700),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hidePassword = !hidePassword;
                                            });
                                          },
                                          color: blush.withOpacity(0.4),
                                          icon: Icon(hidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: size.height * 0.02,
                                    ),
                                    TextFormField(
                                      controller: cpass,
                                      cursorColor: blush,
                                      style: TextStyle(color: blush),
                                      showCursor: true,
                                      keyboardType: TextInputType.text,
                                      obscureText: hidePassword2,
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: blush),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: blush, width: 2),
                                        ),
                                        labelText: "Confirm Password",
                                        labelStyle:
                                        TextStyle(color: blush, fontSize: 18, fontWeight: FontWeight.w700),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hidePassword2 = !hidePassword2;
                                            });
                                          },
                                          color: blush.withOpacity(0.4),
                                          icon: Icon(hidePassword2
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                      ),
                                    ),

                                  //  Divider(),
                                    Text("\nWhat is your role? ",
                                      style: TextStyle(
                                        color: blush,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    Form(
                                      child: DropdownButton(
                                        hint: Text(
                                            'Select Role',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: blush,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        ),
                                        value: selectedValue,
                                        dropdownColor: blacksand,
                                        style: TextStyle(
                                          color: blush,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                        ),
                                        icon: Icon(Icons.arrow_drop_down_outlined),
                                        iconSize: 22,
                                        iconEnabledColor: blush,
                                        iconDisabledColor: Colors.grey,
                                        onChanged: (value){
                                          setState(() {
                                            selectedValue = value as String;
                                          });
                                        },
                                        items: items.map((item){
                                          return DropdownMenuItem<String>(
                                            value: item,
                                              child: Text(item,
                                              style: TextStyle(
                                                color: blush,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    Container(
                                      height: size.height * 0.03,
                                    ),
                                    Row(
                                      children: <Widget> [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 0),
                                          width: width / 1.2,
                                          height: 37,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                              ),
                                              padding: const EdgeInsets.all(5.0),
                                              primary: blacksand,
                                              backgroundColor: blush,
                                              shadowColor: Colors.black,
                                              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
                                            ),
                                            onPressed: () {
                                              register();
                                            },
                                            child: Text('Sign Up'),
                                          ),
                                        )
                                      ], // <Widget>[]
                                    ),
                                    Container(
                                      height: size.height * 0.04,
                                      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Already have an Account ?",
                                          style: TextStyle(color: blush),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return LoginScreen();
                                                }));
                                          },
                                          child: Text(
                                            " Login ",
                                            style: TextStyle(
                                                color: blush,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        )
                                      ], // <Widget>[]
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}