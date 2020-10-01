import 'package:flutter/material.dart';

import 'package:uicslp_chat/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  //RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios=[
    Usuario(uid: '1', nombre: 'Luis A. Roque Hernández', correo: 'Tlacuache98@gmail.com',online: true),
    Usuario(uid: '2', nombre: 'Raul', correo: 'raul@gmail.com',online: false),
    Usuario(uid: '3', nombre: 'Lic. Adrián del Jobo Ponce', correo: 'direccion.tmz@uicslp.edu.mx',online: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre de usuario', style: TextStyle(color: Colors.black45),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app,color: Colors.black45), 
          onPressed: (){}
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.check_circle,color: Colors.blue[600]),
              //child: Icon(Icons.offline_bolt,color: Colors.red),

            )
          ],
      ),
      body: _listViewUsuarios()
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_,i) => _usuariosListTile(usuarios[i]), 
      separatorBuilder: (_,i) => Divider(), 
      itemCount: usuarios.length
      );
  }

  ListTile _usuariosListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.correo),
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0,2)),
          backgroundColor: Colors.blue[200],
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }
}