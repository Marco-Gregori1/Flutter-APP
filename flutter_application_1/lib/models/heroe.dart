// To parse this JSON data, do
//
//     final heroe = heroeFromJson(jsonString);

import 'dart:convert';
List<Heroe> heroeFromJson(String str) => List<Heroe>.from(json.decode(str).map((x) => Heroe.fromJson(x)));

//List<Heroe> heroeFromJson(String str) => List<Heroe>.from(json.decode(str).map((x) => Heroe.fromJson(x)));

//String heroeToJson(List<Heroe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Heroe {
    Heroe({
        required this.id,
        required this.name,
        required this.description,
        required this.thumbnail,
        required this.resourceUri,
    });

    int id;
    String name;
    String description;
    Thumbnail thumbnail;
    String resourceUri;

    factory Heroe.fromJson(Map<String, dynamic> json) => Heroe(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "thumbnail": thumbnail.toJson(),
        "resourceURI": resourceUri,
    };
}


class Thumbnail {
    Thumbnail({
        required this.path,
        required this.extension,
    });

    String path;
    String extension;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
    };
}