import 'package:flutter/material.dart';
import '../shared/preferences.dart';
import '../widgets/side_bar_menu.dart';
class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {


@override
  void initState() {
    getSavedData();
    super.initState();
  }

void getSavedData() async{
   _isChecked = Preferences.isChecked;
   textController.text = Preferences.email;

}


final _formKey = GlobalKey<FormState>();
var selectedPage = 'Seleccione una pagina';
bool? _isChecked = false; 
var _savedEmail = '';
TextEditingController textController = TextEditingController();

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
      height: 650,
      width: 350,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children:<Widget> [
          const SizedBox(height: 15,),
          const Text("Coméntanos que ha pasado",textAlign: TextAlign.left,
          style: TextStyle( fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 18)),
          const SizedBox(height: 20,),
          const Text("¿En que pagina ocurrió?",textAlign: TextAlign.left,
          style: TextStyle( fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 15)),
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
                  ? const Color.fromRGBO(254,23,31,1) : Colors.black,)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPage = newValue!;
                });
              },
            )),
          
          const SizedBox(height: 25,),
          const Text("¿Qué ha pasado?",textAlign: TextAlign.left,
          style: TextStyle( fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 15)),
          const SizedBox(height: 15,),
          //
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
          const SizedBox(height: 25,),
            const Text("Escribe tu correo electronico",textAlign: TextAlign.left,
          style: TextStyle( fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize: 15)),
          const SizedBox(height: 25,),
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
                height: 35,
                padding: const EdgeInsets.only(top: 5,left: 10),
                child:  TextField(
                  controller: textController,
                  autofocus: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                  cursorColor: Colors.black,
                  cursorRadius: const Radius.circular(200),
                  cursorWidth: 2.0,
                  textInputAction: TextInputAction.send,
                  decoration: const InputDecoration.collapsed(hintText: 'Email', hintStyle: TextStyle(fontFamily: 'DMSans',fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black ))
                  ),),
          const SizedBox(height: 15,),
         
          Container(
                  child: (CheckboxListTile(value: _isChecked , activeColor: const Color.fromRGBO(254,23,31,1), title: const Text('Desea recibir notifaciones sobre noticias de la app?', style: TextStyle(fontFamily: 'Roboto')), onChanged:(value) {
                setState(() {
                  _isChecked = value;
                });
                ListTileControlAffinity.leading;
              },
              controlAffinity: ListTileControlAffinity.leading,)),
              ),
           const SizedBox(height: 15),
          Form(
                key: _formKey,
                child: 
                  Column(
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 40),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            bottomRight: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                            topLeft: Radius.circular(13)
                            )),
                            backgroundColor: const Color.fromRGBO(254,23,31,1),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                
                                setState(() {
                                  Preferences.email = textController.text;
                                  Preferences.isChecked = _isChecked!;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Enviando Mensaje')),
                                );
                              }
                            },
                            child: const Text('Enviar Mensaje', 
                            style: TextStyle(fontFamily: 
                            'Roboto',fontSize: 16,fontWeight: FontWeight.w700, 
                            color: Color.fromARGB(255, 217, 219, 209)),),
                          ),
                        ]
                        )
      )],
        
      ),
      ))
      );
  }
}