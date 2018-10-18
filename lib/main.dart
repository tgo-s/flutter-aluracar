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
      ),
    );
  }

// Third Version
  // Drawer _buildDrawer(BuildContext context) {
  //   return Drawer(
  //     child: ListView(
  //       children: <Widget>[
  //         DrawerHeader(
  //           child: Center(
  //             child: _buildAvatarPerfilDrawer(context, () {}),
  //           ),
  //         ),
  //         ListTile(
  //           title: Text("João da Silva", textAlign: TextAlign.center),
  //           subtitle: Text("joao@teste.com.br", textAlign: TextAlign.center),
  //         ),
  //         ListTile(
  //           title: RaisedButton(
  //             child: Text("Editar"),
  //             textColor: Colors.white,
  //             color: Colors.lightBlue,
  //             onPressed: () => Navigator.pop(context),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Second Version
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
        ListTile(
          title: _buildAvatarPerfilDrawer(context, () {}),
        ),
        Divider(),
        _labelPerfil("João Da Silva"),
        Divider(),
        _labelPerfil("joao@teste.com.br"),
        Divider(),
        _buildPerfilButton("Editar Perfil", () {}),
        _buildPerfilButton("Meus Agendamentos", () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CarListWidget()));
        }),
      ],
    );
  }

  // First Version
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

  Center _buildAvatarPerfilDrawer(
      BuildContext context, Function changeFotoFuncion) {
    return Center(
        child: Stack(
      children: <Widget>[
        Image.asset(
          'assets/img/avatar_perfil.png',
          height: 120.0,
          width: 120.0,
        ),
        IconButton(
          icon: Icon(
            Icons.add_a_photo,
            color: Colors.black54,
          ),
          onPressed: changeFotoFuncion,
        )
      ],
      alignment: Alignment(0.8, 1.4),
    ));
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
