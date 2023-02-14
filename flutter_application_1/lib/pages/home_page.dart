import 'package:flutter/material.dart';

import '../widgets/side_bar_menu.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        
        centerTitle: true,
        flexibleSpace: const Image(
          image: AssetImage('assets/images/background_header_image.png'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 10.0,
        title: Row(
          
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/marvel_logo.png',
            fit: BoxFit.contain,
            height: 50,
            
          ),
          ]
        ),
      ),
      drawer: const SideBarMenu(),
      

        
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
            height: 180.0,
            width: MediaQuery.of(context).size.width ,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/banner_home.png'),
                    fit: BoxFit.cover
                )
            ),
            child: Align(
                alignment: Alignment.centerLeft,
              child: Container(
                height: 100,
                margin: const EdgeInsets.only(left: 20.0, right: 0.0,top: 30),
                child: const Text(" CREATE AWESOME STUFF \n WITH THE WORLD'S GREATEST \n COMIC API", 
                style: TextStyle(color:Colors.white,fontFamily: 'Roboto',fontWeight: FontWeight.w600,fontSize: 15), maxLines: 3,),
              )
            ),
          ),
          const SizedBox(height: 30)
          ,
           Container(
                
                width: MediaQuery.of(context).size.width,
                height: 150,
                margin: const EdgeInsets.only(left: 20.0, right: 0.0,top: 20),
                child:  const Text("The Marvel Comics API allows \n developers everywhere to access \n information about Marvel's vast \n ibrary of comics—from what's \n coming up, to 70 years ago.",
                 style: TextStyle(fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w500), maxLines: 5,),
              ),
              const SizedBox(height: 15)
              ,
                 Container(
                
                width: MediaQuery.of(context).size.width,
                height: 20,
                margin: const EdgeInsets.only(left: 20.0, right: 0.0,top: 20),
                child: const Text("START NOW!", style: TextStyle(color: Colors.red,fontSize: 20,fontFamily: 'Roboto',fontWeight: FontWeight.w600), maxLines: 5,),
              )
              ,
                 Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                margin: const EdgeInsets.only(left: 20.0, right: 0.0,top: 20),
                child: const Text("To start please click the side-bar \n button to access to all the \n features.", 
                style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500,fontSize: 20), maxLines: 5,),
              )
          ],
          
        ),
      ),
    );
  }
}