
import 'package:batman_spash_screen/UI/pages/login_page.dart';
import 'package:batman_spash_screen/UI/widget/widget.dart';

import 'package:batman_spash_screen/models/user_model.dart';
import 'package:batman_spash_screen/service/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final UserList = Provider.of<RecursosProvider>(context);
    final List<User> usuarios = UserList.recursoList;
    // List usuarios = ['alberto', 'Cecilia', 'Teo', 'Enrrique'];

    
    return Scaffold(
      drawerScrimColor: Colors.brown.withOpacity(.2),
      endDrawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text('Gesion de Usuarios APP'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            DropdownButtonFormField(
                items: usuarios
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.nombreCompleto),
                        ))
                    .toList(),
                onChanged: (value) {
                  // ignore: avoid_print
                  print(value!.nombreCompleto);
                  if (value.nombreCompleto=='Orlando') {
                     isChecked  = true;
                     // ignore: avoid_print
                     print(isChecked);
                  }
                  else {
                    isChecked = false;
                  }
                 
                  setState(() {});
                }),
           
         !isChecked==true ?   const Text('hola amigos') : 


            Column(
              children: [
                ...usuarios.map((e) =>  CheckboxListTile(
               
                title: ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(e.image),),
                  title: Text('${e.nombreCompleto} ${e.apellido}', style: TextStyle(color: e.estatus == true ? Colors.black : Colors.red),),
                  subtitle: Text('${e.cargo}/${e.role}' ),
                  trailing: const FlutterLogo(),
                ),
                value: e.estatus,
                onChanged: (value) { 
                  // ignore: avoid_print
                  print('VALUE: $value');
                  // UserList.updateUSer(e);
                  e.estatus = value!; 
                  setState(() {});

                  // ignore: avoid_print
                  print('Estatus: ${e.estatus}');       
                  UserList.saveOrCreateProduct(e);
                },
                selected: isChecked,
                ),),

              ],
            ),

            const SizedBox(height: 150,),
            Center(
                child: IconButton(
              icon: const Icon(Icons.aspect_ratio),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
            )),
          ],
        ),
      ),
    );
  }
}
