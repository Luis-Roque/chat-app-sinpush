import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:uicslp_chat/models/usuario.dart';
import 'package:uicslp_chat/services/auth_service.dart';

class UsuariosPage extends StatefulWidget {
  
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios=[
    Usuario(uid: '1', nombre: 'Luis A. Roque Hernández', email: 'Tlacuache98@gmail.com',online: true),
    Usuario(uid: '2', nombre: 'Raul', email: 'raul@gmail.com',online: false),
    Usuario(uid: '3', nombre: 'Lic. Adrián del Jobo Ponce', email: 'direccion.tmz@uicslp.edu.mx',online: false)
  ];

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    return Scaffold(
      appBar: AppBar(
        title: Text(usuario.nombre, style: TextStyle(color: Colors.black45),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app,color: Colors.black45), 
          onPressed: (){
            //TODO: desconcetar del socket server
            Navigator.pushReplacementNamed(context, 'login');
            AuthService.deleteToken();
          }
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.check_circle,color: Colors.blue[600]),
              //child: Icon(Icons.offline_bolt,color: Colors.red),

            )
          ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon(Icons.check_circle_outline, color: Colors.orange[400]),
          waterDropColor: Colors.orange[400],
        ),
        child: _listViewUsuarios(),
        )
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
        subtitle: Text(usuario.email),
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

  _cargarUsuarios()async{
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}