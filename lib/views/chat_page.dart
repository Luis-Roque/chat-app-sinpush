import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uicslp_chat/widgets/mensajes_chat.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<MensajesChat> _mensajes = [];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            CircleAvatar(
              child: Text('Lu',style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox(height: 3,),
            Text('Luis Roque', style: TextStyle(color: Colors.black54,
            fontSize: 12),)
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _mensajes.length,
                itemBuilder: (_,i)=> _mensajes[i],
                reverse: true,
                ) 
            ),
            Divider(height: 1),
            Container(
              color: Colors.white,
              child:_inputChat(),
            )
          ],
        ),
      )
    );
  }

 Widget _inputChat() {
   return SafeArea(
     child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit ,
                onChanged: (texto){
                  setState(() {
                    if (texto.trim().length > 0){
                      _estaEscribiendo= true;
                    } else{
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              )
              ),

              //BOTON ENVIAR
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: Platform.isIOS
                ? CupertinoButton(
                  child: Text('Enviar'), 
                  onPressed: _estaEscribiendo 
                        ? ()=> _handleSubmit(_textController.text.trim())
                        : null,
                  )
                  : Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                     data: IconThemeData(color: Colors.blue[400]) ,
                     child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(Icons.send), 
                        onPressed: _estaEscribiendo 
                        ? ()=> _handleSubmit(_textController.text.trim())
                        : null,
                        ),
                    ),
                  ),
              ),
          ],
        ),
     )
     );
 }

 _handleSubmit(String texto){
   if(texto.length == 0) return;
   print(texto);
   _textController.clear();
   _focusNode.requestFocus();

  final newMensaje = new MensajesChat(
    uid: '123', 
    texto: texto,
    animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 200)),
    );
  _mensajes.insert(0, newMensaje);
  newMensaje.animationController.forward();

   setState(() {
     _estaEscribiendo = false;
   });
 }
 @override
  void dispose() {
    // TODO: off del socket

    for( MensajesChat mensajes in _mensajes){
      mensajes.animationController.dispose();
    }
    super.dispose();
  }
}
