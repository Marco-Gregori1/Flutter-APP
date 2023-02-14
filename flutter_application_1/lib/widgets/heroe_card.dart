
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pages.dart';

class CardImage extends StatelessWidget {
  final int heroeId;
  final String urlImage;
  final String heroeName;
  final String? captionImage;
  final VoidCallback? onTap;

  const CardImage({super.key, 
    required this.heroeId,
    required this.urlImage, 
    required this.heroeName,
    this.captionImage,
    this.onTap,
    }
  );

  @override
  Widget build(BuildContext context) {
    return 
      GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 100,
          height: 135,
          //padding: const EdgeInsets.only(top: 10),
          child: Card(
            clipBehavior: Clip.antiAlias,      
            //shadowColor: Color.fromARGB(255, 29, 29, 29),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            elevation: 10,
            child: Column(
              children: [
              FadeInImage(
                height: 120,
                width: 220,
                placeholder: const AssetImage("assets/images/hero_placeholder.jpg"), 
                image: NetworkImage(urlImage),
                fit: BoxFit.fill,
                fadeInDuration: const Duration(milliseconds: 600), 
              ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(heroeName,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  ),
                ),
                if(captionImage != null)
                Container(        
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomLeft,
                  child: Text(captionImage ?? 'No caption',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 10),
                  ),
                )
            ]),
          ),
        ),
      );
  
  }
}