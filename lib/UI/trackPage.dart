import 'package:trackme/Constants.dart';
import 'package:trackme/Model/trustModel.dart';
import 'package:flutter/material.dart';
import 'package:trackme/States/Management.dart';

class TrackPage extends StatefulWidget {
  TrackPage({Key key}) : super(key: key);

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<TrackPage> {
  int _selectedIndex = 0;

  void switchTabs(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _navBottom(BuildContext con) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: bottons,
      onTap: switchTabs,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.navigation),
          title: Text("Track"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group_add),
          title: Text('Trustees'),
        ),
      ],
    );
  }

  final tabs = List<Widget>();
  Me m = Me();
  Trustee tt = Trustee();

  @override
  void initState() {
    super.initState();
    tabs.add(m);
    tabs.add(tt);
  }

  @override
  Widget build(BuildContext con) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primary),
      backgroundColor: primary,
      bottomNavigationBar: _navBottom(con),
      body: tabs.elementAt(_selectedIndex),
    );
  }
}

class Me extends StatefulWidget {
  Me({Key key}) : super(key: key);

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  StateManagement sm;

  bool t;
  
  void tapped() {
    setState(() {
      t =!t;

     sm.setTrack(t);
    });
  }

  @override
  Widget build(BuildContext con) {
    double w = MediaQuery.of(con).size.width;
    double h = MediaQuery.of(con).size.height;

    return Center(
        child: Container(
      width: w - 100,
      height: h - 500,
      child: GestureDetector(
          onTap: () {
            tapped();
          },
          child: Card(
            color: sm.isTracked? Colors.green[400] : Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Center(child: Text("Track")),
          )),
    ));
  }
}

class Trustee extends StatefulWidget {
  Trustee({Key key}) : super(key: key);

  @override
  _TrusteeState createState() => _TrusteeState();
}

class _TrusteeState extends State<Trustee> {
  TrusteeModel tModel = TrusteeModel();

  @override
  Widget build(BuildContext con) {
    return Center(child: _buildList());
  }

  Widget _buildList() {
    return Container(
        child: StreamBuilder(
            stream: tModel.sc.stream,
            builder: (con, AsyncSnapshot<List<TrusteePerson>> snapshot) {
              if (snapshot.data == null) {
                  return Text("No Trustees added yet");
               }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (con, index) {
                    TrusteePerson tP = snapshot.data[index];
                     //return Text("No Trustees added yet");
                    return _listItem(context, tP);
                  });
            }));
  }

  Widget _listItem(BuildContext con, TrusteePerson tp) {
    String email = tp.emailAddress;
    final _gUrl = '''https://cdn.worldvectorlogo.com/logos/google-icon.svg''';
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(con, "/map");
        },
        child: Card(
            color: listItemColor,
            child: ListTile(
              leading: Image.network(_gUrl),
              title: Text('${email}'),
            )));
  }
}