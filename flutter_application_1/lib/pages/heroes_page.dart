
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/remote_service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:flutter_application_1/pages/heroe_page.dart';
import 'package:flutter_application_1/models/heroe.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class HeroesPage extends StatefulWidget {
  const HeroesPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HeroesState createState() => _HeroesState();
}



class _HeroesState extends State<HeroesPage>{
  
  final controller = ScrollController();
  
  int heroesOffset = 0;
  int heroesLimit = 10;

  // ignore: non_constant_identifier_names
  List<Heroe>? _ListadoHeroes;
  var showbtn = false;
  var isLoaded = false;
  var isFiltered = false;
  


  void updateList(String text){
    if(text == ''){
      getData(heroesLimit,heroesOffset,null);
      }
    else{
    getData(heroesLimit + 90,heroesOffset,text);
    setState(() {isFiltered = true;});
    }
    setState(() {isLoaded = true;});

     // _ListadoHeroes = _ListadoHeroes!.where((element) => element.name.toLowerCase().contains(text.toString())).toList();
    //});
  }


  getData(limit, offset,text) async {
    if (text == '' || text == null){
      setState(() {isFiltered = false;});
      _ListadoHeroes = await RemoteService().getHeroes(limit,offset,null);
      }
    else{_ListadoHeroes = await RemoteService().getHeroes(limit,offset,text);
      setState(() {
        isFiltered = true;
      });}
    if(_ListadoHeroes != null){
      // ignore: use_build_context_synchronously
      setState(() {
        isLoaded = true;
      });
    }
  }

// Se ejecuta cuando se abre una ventana 
 @override
  void initState() {
    setState(() {isFiltered = false;});
    getData(heroesLimit,heroesOffset,null);
    super.initState();
    
    
      controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset && isFiltered == false) {
        heroesLimit += 10;
        heroesOffset = 0;
         getData(heroesLimit,heroesOffset,null);
         
      }
        if(heroesLimit > 11){ // checkea que se halla fetcheado antes de aparezca el boton de volver arriba
              showbtn = true;
              setState(() {
                //update state 
              });
        }else{
             showbtn = false;
              setState(() {
                //update state 
              });
        }
    });
    
    
    
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context){
    
    
    Size size = MediaQuery.of(context).size;
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

      body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator(  backgroundColor: Color.fromARGB(255, 119, 119, 119),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red,),),),
          child: Column(
          children: 
            <Widget>[
            Container(
              height: size.height * 0.095,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFED1D24),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical:20,horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(15)
                ),
                // ignore: prefer_const_constructors
                child: TextField(
                  
                  onSubmitted: (text) { updateList(text);},
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: "Search for heroes",
                  hintStyle: TextStyle(color: Color(0xFF424242) ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.search,),
                ),
              ),
        
            ),
            ),
        
          ), 
          Flexible(
          fit: FlexFit.tight,
          child: 
            // ignore: prefer_is_empty
            (_ListadoHeroes?.length == 0 && isLoaded)? 
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child:  Text("No se han encontrado superheroes...",textAlign: TextAlign.center,),
                  ) 
                  :
            GridView.builder(
            controller: controller,
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            physics: const BouncingScrollPhysics(),
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
             crossAxisCount: 2, 
             childAspectRatio:  (200 / 330)
             ),
            
            itemCount: _ListadoHeroes == null || isFiltered == true ? _ListadoHeroes?.length : (_ListadoHeroes?.length)! + 1,
            itemBuilder: (context,index){
              if (index < (_ListadoHeroes?.length)!){
                return CardImage(
                heroeId: _ListadoHeroes![index].id,
                urlImage: '${_ListadoHeroes![index].thumbnail.path}.${_ListadoHeroes![index].thumbnail.extension}', 
                heroeName: _ListadoHeroes![index].name,
                captionImage:_ListadoHeroes![index].description,
                onTap: (){Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HeroePage
                  (
                  heroeId: _ListadoHeroes![index].id,
                  url: '${_ListadoHeroes![index].thumbnail.path}.${_ListadoHeroes![index].thumbnail.extension}',
                  name:  _ListadoHeroes![index].name,
                  desc: _ListadoHeroes![index].description,
                  )));}
                );
              }
            else { 
              return Positioned(
                width: 20,
                left: 150,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                  decoration: const BoxDecoration (
                  color: Colors.transparent),
                  child: const Center(child: CircularProgressIndicator(  backgroundColor: Color.fromARGB(255, 119, 119, 119),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red,),)))
                );}
          },
          )
          )
          
        ],
        
          ),
      ),
      floatingActionButton: AnimatedOpacity(
           duration: const Duration(milliseconds: 1000),  //show/hide animation
           opacity: showbtn?1.0:0.0,
        child: FloatingActionButton(
        
        elevation: 0.0,
        backgroundColor:const Color.fromARGB(255, 199, 14, 14),
        onPressed: (){  controller.animateTo( //go to top of scroll
                     0,  //scroll offset to go
                     duration: const Duration(milliseconds: 500), 
                    //duration of scroll
                     curve:Curves.fastOutSlowIn //scroll type
                    );},
        child: const Icon(Icons.keyboard_double_arrow_up)
          ),
      )
    );
  }




}
