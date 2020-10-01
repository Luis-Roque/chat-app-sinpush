import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String pregunta;
  final String ruta;
  final String mensaje;

  const Labels({
    Key key, 
    @required this.ruta,
    @required this.pregunta,
    @required this.mensaje
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.pregunta,style: TextStyle(color: Colors.black54, fontSize:15, fontWeight: FontWeight.w300),),
          SizedBox(height: 10),
          GestureDetector(
            child: Text(this.mensaje, style: TextStyle(color:Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: (){
              Navigator.pushReplacementNamed(context, this.ruta);
            },
            )
        ],
      ),
    );
  }
}