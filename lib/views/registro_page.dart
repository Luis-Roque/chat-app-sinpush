import 'package:flutter/material.dart';

import 'package:uicslp_chat/widgets/Labels_login.dart';
import 'package:uicslp_chat/widgets/btn_login.dart';
import 'package:uicslp_chat/widgets/custom_input.dart';
import 'package:uicslp_chat/widgets/logo.dart';

class RegistroPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(titulo: 'Registro',),
                _Form(),
                Labels(pregunta: '¿ya estas registrado?',mensaje: 'Inicia sesión',ruta: 'login'),
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

  final nombreCtrl = TextEditingController();
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
            icon: Icons.person_outline,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textControler: nombreCtrl,
          ),
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

