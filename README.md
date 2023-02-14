# APP MARVEL FLUTTER (Marco Gregori)

Desarrollada en un Pixel 5 Api 33 (android-x64 emulator) de resolucion: 1080 x 2340


Esta APP requiere su API de marvel levantada para funcionar debidamente,
Link: https://github.com/Marco-Gregori1/TP-Lab-IV-

una vez obtenida la api, se debera levantar con los siguientes comandos 
  cd TP-Lab-IV
  npm install 
  node app.js

Esta api contiene las siguientes caracteristicas/paginas
Menu deslizable que permitira setear el tema o color de la app y navegar por las siguientes paginas que componen la App:
  -Home o pagina de inicio: Da la bienvenida al usuario
  -Listado de supoerheroes: Como su nombre indica consume la api para traer todos los superheroes con un infiniteScroll, a su vez soporta la busqueda
   por nombre de algun superheroe en especifico. También, al seleccionar un heroe, se visualiza una pagina individual donde se ve a detalle la informacion 
   anteriormente consumida y el nombre e imagen de los comics que tiene ese heroe en su haber en forma de Carrusel.
  -Aviso de errores: form que no esta conectado a la API pero guarda el mail y los checks inputados en el usuario en las prefs de la app.
