import 'package:carousel_slider/carousel_slider.dart';
import 'package:college_banha_app/AuthPages/logInPage.dart';
import 'package:college_banha_app/FireBase/Authclass.dart';
import 'package:college_banha_app/Screens/LevelScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
// ignore: must_be_immutable
class _HomeScreenState extends State<HomeScreen> {
  List<Widget> image = [
    Image.asset('assets/image/mostafa1.jpeg'),
    Image.asset('assets/image/mostafa2.jpeg'),
    Image.asset('assets/image/mostafa3.jpeg'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black87,
        title: const Text('الرئسية'),
        actions: [
          Image.asset('assets/image/logo.jpg',),
          IconButton(onPressed: ()async {

            await Auth().signOut();
            Navigator.of(context).pushAndRemoveUntil(


                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
                    (route) => false);
          }, icon:const Icon(Icons.logout),tooltip: 'تسجيل الخروج',)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
              ),
              items: image,
            ),
            const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                const Text('نبذة عن المعهد:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                const  SizedBox(height: 5,),
              RichText(text:   TextSpan(
                children: [
                   const TextSpan(
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87
                    ),
                    text:
                    'المعهد العالي لعلوم الحاسب ونظم المعلومات هو صرح  تعليمى على ارض مصرية يخدم المجتمع المصري بتقديم خريج متميز في تخصص (علوم الحاسب ) لمعرفة المستويات و المواد الراسية اضغط علي  '
        
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=(){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  Levels()));
                    },
                    style:  TextStyle(color: Colors.blueAccent.shade200,fontSize: 19),
                    text: 'المستويات'
                  )
        
                ]
              ))
        
              ],),
          ),
          ],
        ),
      ),
    );
  }
}

