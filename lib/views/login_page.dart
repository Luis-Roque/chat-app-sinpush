import 'package:flutter/material.dart';

import 'package:uicslp_chat/widgets/Labels_login.dart';
import 'package:uicslp_chat/widgets/btn_login.dart';
import 'package:uicslp_chat/widgets/custom_input.dart';
import 'package:uicslp_chat/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(titulo: 'UICSLP',),
                _Form(),
                Labels(pregunta: '¿No tienes cuenta?',mensaje: 'Registrate ahora!',ruta: 'registro'),
                Text('Términos y condiciones', style: TextStyle(fontWeight: FontWeight.w200),)

                ],
            ),
          ),
        ),
      )
    );
  }
}



class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}
class __FormState extends State<_Form> {

  final correoCtrl = TextEditingController();
   final contraCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo Institucional',
            keyboardType: TextInputType.emailAddress,
            textControler: correoCtrl,
          ),
           CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            isPassword: true,
            textControler: contraCtrl,
          ),

          btnIngresar(
            text: 'Ingresar',
            onPressed: (){
              print(correoCtrl);
              print(contraCtrl);
            },
            ),
        ],
      ),
    );
  }
}

