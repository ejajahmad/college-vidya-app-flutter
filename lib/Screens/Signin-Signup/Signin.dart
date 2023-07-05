import 'package:collegevidya/Connections/login%20connections.dart';
import 'package:collegevidya/Screens/Navigation.dart';
import 'package:collegevidya/Screens/Signin-Signup/otp%20form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';



class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController mobileNumberController = TextEditingController();
  String mobile = '';
  FocusNode focusNode = FocusNode();
  String? _selectedcountry;

  @override
  void dispose() {
    // TODO: implement dispose
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          //DIVING PAGE
          Expanded(
              flex: 1,
              child: Container(
                color: Color(0xff1043E9),
                child: Center(child:
                Text("Login",
                  style: TextStyle(color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),),
              )
          ),

          Expanded(flex: 2, child: Container(
            color: Colors.white,

            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50,),

                  Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonHideUnderline(
                          child: Container(
                            width: 100,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.grey[300]?.withOpacity(0.4),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: DropdownButton(
                                dropdownColor: Colors.grey[300],
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                // icon: Padding(
                                //   padding: const EdgeInsets.only(right: 10),
                                //   child: Icon(Icons.arrow_drop_down,color: Colors.grey,),
                                // ),
                                hint: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text('country',
                                    style: TextStyle(
                                        fontSize: 12
                                    ),),
                                ),

                                value: _selectedcountry,
                                onChanged: (countryValue) {
                                  setState(() {
                                    _selectedcountry = countryValue!;
                                  });
                                },
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black// Remove underline
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: 'india',
                                    child: Text('india'),

                                  ),
                                  DropdownMenuItem(
                                    value: 'russia',
                                    child: Text('russia'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 5,),


                        SizedBox(width: 265,height: 45,
                            child: TextField(
                              controller: mobileNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                hintText: 'phoneNumber',
                                hintStyle: TextStyle(fontSize: 12),
                                filled: true,
                                fillColor: Colors.grey[250],
                                prefixIcon: Icon(Icons.call,weight: 15,),
                                // hintStyle: TextStyle(fontSize: 12),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
                                ),
                              ),
                            )
                        ),

                      ],
                    ),
                  ),


                  SizedBox(height: 100,),

                  // LOGIN BUTTON
                  Container(
                    height: 50,
                    width: 370,
                    child: ElevatedButton(

                      child: Text('Login', style:
                      TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),),

                      onPressed: () async{
                    String mobile = mobileNumberController.text;
                    String otp = await generateOTP(mobile);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OTPVerificationPage(mobile: mobile)));

                      },

                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1043E9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),


                  //SIGN IN GESTURE DETECT BUTTON
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                      child: Row(
                        children: [
                          Text("Don't have an account? ", style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                          ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/signup');
                            },
                            child: Text('Sign up', style: TextStyle(
                                color: Color(0xff1043E9),
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          )
        ],
      ),
    );
  }


}
