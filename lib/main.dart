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
        drawer: _buildDrawer(context),
        body: new CarListWidget(),
        bottomSheet: Container(
          child: Row(
            children: <Widget>[
              Text("COL 1"),
              Text("COL 2"),
              Text("COL 2"),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Perfil",
                ),
                Tab(
                  text: "Editar",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _buildPerfil(context),
              Container(
                child: Text("Editar"),
              )
            ],
          ),
        ),
        length: 2,
      ),
    );
  }

  ListView _buildPerfil(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildAvatarPerfilDrawer(),
        _labelPerfil("João Da Silva"),
        Divider(),
        _labelPerfil("joao@teste.com.br"),
        Divider(),
        _buildPerfilButton("Editar Perfil", () {}),
        Divider(),
        _buildPerfilButton("Meus Agendamentos", () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarListWidget()));
        }),
      ],
    );
  }

  // Drawer _buildDrawer() {
  //   return Drawer(
  //     child: ListView(
  //       children: <Widget>[
  //         _buildAvatarPerfilDrawer(),
  //         _labelPerfil("João Da Silva"),
  //         _labelPerfil("joao@teste.com.br"),
  //         _buildPerfilButton("Editar Perfil", () {}),
  //       ],
  //     ),
  //   );
  // }

  Container _buildPerfilButton(String label, Function onPressedFunction) {
    return Container(
      child: RaisedButton(
        child: Text(label),
        textColor: Colors.white,
        color: Colors.lightBlue,
        onPressed: onPressedFunction,
      ),
      padding: EdgeInsets.only(left: 45.0, right: 45.0),
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
      // decoration: BoxDecoration(color: Colors.white70, boxShadow: <BoxShadow>[
      //   BoxShadow(blurRadius: 5.0, color: Colors.grey)
      // ]),
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
      // decoration: BoxDecoration(
      //   border: Border(bottom: BorderSide(color: Colors.grey)),
      // ),
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
    );
  }
}

class CarListWidget extends StatelessWidget {
  const CarListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        return ListTile(
          title: Text("Carro " + i.toString()),
        );
      },
    );
  }
}
