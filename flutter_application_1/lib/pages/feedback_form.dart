import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/side_bar_menu.dart';
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {

final _formKey = GlobalKey<FormState>();
var selectedPage = 'Seleccione una pagina';
bool? _isChecked = false; 

final _paginas = [  
  'Seleccione una pagina',  
    'Inicio',
    'Lista de heroes',
    'Pagina de heroe',
    'Otro'
  ];

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

      body: Center(child: Container(
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(176, 176, 176, 176),
          ),
      height: 600,
      width: 350,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children:<Widget> [
          const SizedBox(height: 15,),
          const Text("Coméntanos que ha pasado"),
          const SizedBox(height: 15,),
          const Text("¿En que pagina de la app?"),
           const Padding(padding: EdgeInsets.all(10)),
          Container(
            padding: const EdgeInsets.only(left: 9,top: 5, bottom: 6, right: 20),
            decoration:  BoxDecoration(color:Colors.white,
            borderRadius: const BorderRadius.only( topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
            ),
            border: Border.all(
              color: const Color.fromARGB(255, 217, 219, 209),
              width: 3
              )),
              width:300,
              height: 40,
            child: DropdownButton<String>(
              isExpanded: true,
              style: const TextStyle(color: Color.fromARGB(255, 217, 219, 209), fontSize: 18, fontWeight: FontWeight.w500),
              value: selectedPage,
              icon: const Icon(Icons.keyboard_arrow_down,color: Color.fromRGBO(42, 66, 82, 20),),
              items: _paginas.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  enabled: items != 'Seleccione una pagina',
                  child: Text(items, style: TextStyle(fontFamily: 'DMSans', color: items != 'Seleccione una pagina'
                  ? Color.fromARGB(255, 252, 38, 0) : Colors.black,)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPage = newValue!;
                });
              },
            )),

          const SizedBox(height: 25,),
          const Text("¿Qué ha pasado?"),
          const SizedBox(height: 15,),
          //
          Container (
              decoration: BoxDecoration(color:Colors.white,
              borderRadius: const BorderRadius.only( topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
              ),
              border: Border.all(
                color: const Color.fromARGB(255, 217, 219, 209),
                width: 3
                )
                ),
                width: 300,
                height: 170,
                padding: const EdgeInsets.only(top: 5,left: 10),
                child: const TextField(
                  autofocus: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                  cursorColor: Colors.black,
                  cursorRadius: Radius.circular(200),
                  cursorWidth: 2.0,
                  textInputAction: TextInputAction.send,
                  decoration: InputDecoration.collapsed(hintText: 'Describe el problema en detalle', hintStyle: TextStyle(fontFamily: 'DMSans',fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black ))
                  ),),

          //
         
          const SizedBox(height: 15,),
          Container(
                  child: (CheckboxListTile(value: _isChecked , activeColor: Color.fromRGBO(236, 2, 2, 1), title: Text('Desea recibir notifaciones sobre noticias de la app?', style: TextStyle(fontFamily: 'DMSans')), onChanged:(value) {
                setState(() {
                  _isChecked = value;
                });
                ListTileControlAffinity.leading;
              },
              controlAffinity: ListTileControlAffinity.leading,)),
              ),
           const SizedBox(height: 44),
          Form(
                key: _formKey,
                child: 
                  Column(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(370, 40),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomRight: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                            topLeft: Radius.circular(13)
                            )),
                            backgroundColor: const Color.fromRGBO(174, 145, 75, 1) ,
                            ),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Enviando Mensaje')),
                                );
                              }
                            },
                            child: const Text('Enviar Mensaje', style: TextStyle(fontFamily: 'DMSans',fontSize: 16,fontWeight: FontWeight.w700, color: Color.fromARGB(255, 217, 219, 209)),),
                          ),
                        ]
                        )
      )],
        
      ),
      ))
      );
  }
}