import 'package:flutter/material.dart';
import 'package:uicslp_chat/views/cargando_page.dart';
import 'package:uicslp_chat/views/chat_page.dart';
import 'package:uicslp_chat/views/login_page.dart';
import 'package:uicslp_chat/views/registro_page.dart';
import 'package:uicslp_chat/views/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes ={

   'login'   : ( _ )=> LoginPage(),
   'registro': ( _ )=> RegistroPage(),
   'cargando': ( _ )=> CargandoPage(),
   'usuarios': ( _ )=> UsuariosPage(),
   'chat'    : ( _ )=> ChatPage()
   
 };