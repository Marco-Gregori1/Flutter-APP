import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/preferences.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:provider/provider.dart';

class SideBarMenu extends StatefulWidget {
  
  const SideBarMenu({super.key});

   @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context){
    final currentTheme = Provider.of<ThemeProvider>(context);
    
    return Drawer(
      child: Container(
        color: const Color(0xFFED1D24), // rojo marvel
        child: ListView(
        children: [
          const _DrawerHeader(),
          ListTile(
            title: const Text('Home',style: TextStyle(color: Colors.white)),
            leading: const ImageIcon(
              AssetImage("assets/icons/home_icon.png"),
              color: Color(0xFFFFFFFF),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('Heroes',style: TextStyle(color: Colors.white)
            ),
            leading: const ImageIcon(
              AssetImage("assets/icons/heroes_icon.png"),
              color: Color(0xFFFFFFFF),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'heroes');
            },
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text('Feedback',style: TextStyle(color: Colors.white)
            ),
            leading: const ImageIcon(
              AssetImage("assets/icons/heroes_icon.png"),
              color: Color(0xFFFFFFFF),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'feedback');
            },
          ),
          const Divider(height: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SwitchListTile.adaptive(
                  title: const Text('Dark mode',style: TextStyle(color: Colors.white)),
                  value: Preferences.darkmode,
                  onChanged: (value) {
                    setState(() {
                      Preferences.darkmode = value;
                      value ? currentTheme.setDark() : currentTheme.setLight();
                    } 
                    );
                  })
            ],
          )
        
      ],
      ),
      )
    );


  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
    child: Container(
      
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/marvel_logo.png'
            ),
            fit: BoxFit.contain,
          )
      ),
    ),
    );
  }
}