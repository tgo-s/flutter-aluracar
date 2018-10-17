import 'package:flutter/material.dart';

main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Car Test"),
        ),
        drawer: _buildDrawer(),
        body: ListView.builder(
          itemBuilder: (context, i){
            if(i.isOdd) return Divider();
            return ListTile(
              title: Text("Carro " + i.toString()),
              );
          },
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
        child: ListView(
          children: <Widget>[
            _buildAvatarPerfilDrawer(),
            _labelPerfil("João Da Silva"),
            _labelPerfil("joao@teste.com.br"),
            MaterialButton(
                child: Text("Editar Perfil"),
                textColor: Colors.lightBlue,
                onPressed: () {},
              ),
          ],
        ),
      );
  }

  Container _buildAvatarPerfilDrawer() {
    return Container(
      child: Image.asset(
        'assets/img/avatar_perfil.png',
        height: 120.0,
        width: 120.0,
      ),
      //color: Colors.grey,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Colors.white70, boxShadow: <BoxShadow>[
        BoxShadow(blurRadius: 5.0, color: Colors.grey)
      ]),
    );
  }

  Container _labelPerfil(String texto) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child: Text(
        texto,
        style: TextStyle(color: Colors.lightBlue),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
    );
  }
}
