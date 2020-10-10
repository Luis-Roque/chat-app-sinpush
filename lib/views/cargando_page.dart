import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uicslp_chat/services/auth_service.dart';
import 'package:uicslp_chat/views/login_page.dart';
import 'package:uicslp_chat/views/usuarios_page.dart';

class CargandoPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: verificarLogin(context),
        builder: (context,  snapshot) { 
          return Center(
          child: Text('Espere...'),
        );
         },
         
      ),
    );
  }

  Future verificarLogin( BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if( autenticado){
      //TODO: conectar al socket service
      //Navigator.pushReplacementNamed(context, 'usuarios');
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (_,__,___)=> UsuariosPage(),
        transitionDuration: Duration(milliseconds: 0)
        )
        );
    } else {
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (_,__,___)=> LoginPage(),
        transitionDuration: Duration(milliseconds: 0)
        )
        );

    }

  }
}