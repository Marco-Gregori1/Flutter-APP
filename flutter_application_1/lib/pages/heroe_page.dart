
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/comic.dart';
import 'package:flutter_application_1/services/remote_service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HeroePage extends StatefulWidget {
  final int heroeId;
  final String url;
  final String name;
  final String desc;
  const HeroePage({super.key,required this.heroeId,required this.url,required this.name,required this.desc});
  
  @override
  // ignore: library_private_types_in_public_api
  _HeroeState createState() => _HeroeState();
  
}

class _HeroeState extends State<HeroePage>{
  
  // ignore: non_constant_identifier_names
  List<Comic>? _ListadoComics;

  var isLoaded = false;

  Future<void> getComicsHeroe(id) async {
     _ListadoComics = await RemoteService().getComicsHeroe(id);
    
    if(_ListadoComics != null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  // Se ejecuta cuando se abre una ventana
 @override
  initState() {
    super.initState();
    getComicsHeroe(widget.heroeId);

  }


    Widget buildImage (String urlimage,String nombre,int index) => Column(
      children: [
        
        
        Container(
          height: 350,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: FadeInImage(
                  placeholder: const AssetImage("assets/images/comic_placeholder.png"), 
                  image: NetworkImage(urlimage),
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 600),
                ),
        ),
        Container(
          
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text( nombre ,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 17),
        ),)
      ],
    );

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.width),
              child: FadeInImage(
              placeholder: const AssetImage('assets/images/comic_placeholder.png'), 
              image: NetworkImage(widget.url),
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 600),
            ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 300),
              
              child:Container(
              
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.only(
                topLeft:  Radius.circular(40),
                topRight:  Radius.circular(40)
                )),
              
              width: MediaQuery.of(context).size.width,
              height: 100,
              
              child: Align(
                alignment: Alignment.center,
                child: Text( widget.name,
                 style: const TextStyle( fontFamily: 'American',fontWeight: FontWeight.w500,
                  color: Colors.red,
                  fontSize: 30),
                  maxLines: 1,
                  
                   ),
              ),),
              
            ),
            
            ],)
            ,
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Align(
                alignment: Alignment.center,
                child: widget.desc.isEmpty ? const Text('No hay descripción de personaje...',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w400) ) : Text(widget.desc,
                 style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w400,
                  fontSize: 17),
                  maxLines: 10,
                  
                   ),)
            ),
              Container(
               padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text( "Comics",
                  overflow: TextOverflow.ellipsis,
                  style:TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500,fontSize: 40),
            ),),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: 
                
                Visibility(
                visible: isLoaded,
                replacement: const Center(child: CircularProgressIndicator(backgroundColor: Color.fromARGB(255, 119, 119, 119),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red,),),),
                child: 
                  // ignore: prefer_is_empty
                  (_ListadoComics?.length == 0 && isLoaded)? 
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child:  Text("No hay comics",textAlign: TextAlign.center,style:TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500)),
                  ) 
                  :
                  CarouselSlider.builder(
                  itemCount: _ListadoComics?.length, 
                  itemBuilder: ((context, index, realIndex) {
                    final comic = '${_ListadoComics![index].thumbnail.path}.${_ListadoComics![index].thumbnail.extension}';
                    final nombre = _ListadoComics![index].title /* _ListadoComics![index].title*/;
                    
                    return buildImage(comic,nombre,index);;
                  }), 
                  options: CarouselOptions(height: 420)),
              ),
            )
          ],
        ),
        
      ),
    
      floatingActionButton: AnimatedOpacity(
           duration: const Duration(milliseconds: 1000),  //show/hide animation
           opacity:1.0,
        child: FloatingActionButton(
        
        elevation: 0.0,
        backgroundColor:Colors.red,
        onPressed: (){Navigator.pop(context);},
        child: const Icon(Icons.arrow_back)
          ),
    ));
  }
}