import 'dart:convert';
import 'package:flutter/animation.dart';
import 'package:flutter_application_1/models/comic.dart';
import 'package:flutter_application_1/models/heroe.dart';
import 'package:http/http.dart' as http;


class RemoteService{


  Future<List<Heroe>?> getHeroes(int? limit,int offset,String? name) async {
  
  var client = http.Client();
  Uri uri;
  if (name != null) {
    uri = Uri.parse('http://10.0.2.2:8000/v1/entities/personajes?limit=100&offset=$offset&nameStartsWith=$name');
  } else {
    uri = Uri.parse('http://10.0.2.2:8000/v1/entities/personajes?limit=$limit&offset=$offset');
  }
  var response = await client.get(uri);
  
  // CONECTION TIME-OUT
  
  if (response.statusCode == 200){

  var res = json.decode(response.body);
  var results = res["data"]["results"]; // NO ES JSON
  
  var finalresponse = json.encode(results); // SE AGREGA FORMATO DE JSON
    var data = heroeFromJson(finalresponse.toString());
    
    return data;
      
    } 

  throw UnimplementedError();
  }
 
  Future<List<Comic>?> getComicsHeroe(id) async {

  var client = http.Client();
  
  // respuesta igual al de la api
  //var uri = Uri.parse('https://apimocha.com/v1heroes/comicsv2');

  //respuesta que funciona (3 comics)
  //var uri = Uri.parse('https://apimocha.com/v1heroes/comictest');
  var uri = Uri.parse('http://10.0.2.2:8000/v1/entities/personajes/$id/comics');



  //var uri = Uri.parse('http://10.0.2.2:8000/v1/entities/personajes/$id/comics');
  //print('http://10.0.2.2:8000/v1/entities/personajes/$id/comics');
  var response = await client.get(uri);
  
  // CONECTION TIME-OUT

  if (response.statusCode == 200){
    
  var res = json.decode(response.body);
  //var results = res["comics"]["items"]; // NO ES JSON
  var results = res["data"]["results"];
  //var finalresponse = json.encode(res); // SE AGREGA FORMATO DE JSON
  var finalresponse = json.encode(results);
  //print(finalresponse);
  //print(comicFromJson(finalresponse.toString())); // no hay problema aca dios
  var data = comicFromJson(finalresponse.toString()); 
  
  return data;
  } 
// retorna 1 objeto de tipo Comic
  throw UnimplementedError();
  }
 
}