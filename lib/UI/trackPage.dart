import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackme/Constants.dart';
import 'package:trackme/Model/trustModel.dart';
import 'package:flutter/material.dart';
import 'package:trackme/States/Management.dart';
import 'package:trackme/Service/fireBase.dart';
import 'package:trackme/Model/trustModel.dart';

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
      t = !t;

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
            color: sm.isTracked ? Colors.green[400] : Colors.grey,
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
  FireBaseAPI api;

  @override
  void initState() {
    super.initState();
    api = FireBaseAPI();
  }

  @override
  Widget build(BuildContext con) {
    return Center(child: _buildList());
  }

  Widget _buildList() {
    return Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: api.collRef.snapshots(),
            builder: (con, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return _buildFromListSnapshots(con, snapshot.data.documents);
            }));
  }

  Widget _buildFromListSnapshots(BuildContext context, List<DocumentSnapshot> docs) {
    docs.forEach((item) {
      TrusteeModel trustee = TrusteeModel.fromDoc(item);
      return _buildItem(trustee.gmail);
    });
  }

  static Widget _buildItem(String name) {
    return Dismissible(
      key: ValueKey(name),
      background: Container(color: control),
      direction: DismissDirection.horizontal,
      child: SizedBox(
        height: 70,
        child: Column(children: <Widget>[
          Card(
            elevation: 6,
            color: listItemColor,
            child: ListTile(
              leading: CircleAvatar(),
              title: Text(name,
                  style: TextStyle(color: Colors.white, fontSize: 19)),
            ),
          ),
          Divider(),
        ]),
      ),
    );
  }
}
