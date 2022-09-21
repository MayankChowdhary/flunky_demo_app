import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/cubit/internet_cubit.dart';
import '../../../utils/constants/strings.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/message_view.dart';
import '../../../controller/bloc/flunkey_list_bloc/flunkey_list_bloc.dart' as slb;
import 'flunkey_list_view.dart';

class SongDetailScreen extends StatefulWidget {
  static const routeName = Strings.songDetailsRoute;

  String username = "";
  String password = "";

  SongDetailScreen({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  _SongDetailsState createState() => _SongDetailsState();
}

class _SongDetailsState extends State<SongDetailScreen> {
  late SharedPreferences prefs;
  String username = "";
  String password = "";
  late TextEditingController _controller;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    print("SharedPreference initilized!");
    retrieveLogin();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void retrieveLogin() {
    username =
        prefs.getString('username') ?? ""; //Pass the key to retrieve saved data
    password = prefs.getString('password') ?? "";
    debugPrint("Username:" + username);
    debugPrint("Password:" + password);
    setState(() {
      _controller = new TextEditingController(text: username);
    });
  }

  @override
  Widget build(BuildContext context) {
    /* final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    String trackId  = args.arg1!;*/

    BlocProvider.of<slb.SongBloc>(context).add(slb.LoadSongListEvent());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Navigation Drawer',
        ),
        backgroundColor: const Color(0xff764abc),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(color: const Color(0xff764abc)),
              accountName: TextField(
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                controller: _controller,
                readOnly: true,
                decoration: new InputDecoration.collapsed(hintText: 'Username'),
              ),
              accountEmail: TextField(
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                controller: _controller,
                readOnly: true,
                decoration: new InputDecoration.collapsed(hintText: 'Username'),
              ),
              currentAccountPicture: Image.asset('assets/usericon.png'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body:
          BlocBuilder<InternetCubit, InternetState>(builder: (context, state) {
        if (state is InternetConnected) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<slb.SongBloc, slb.SongListState>(
                  builder: (context, state) {
                    if (state is slb.SongLoadingState) {
                      return loadingWidget();
                    } else if (state is slb.SongLoadedState) {
                      return SongListView(state.song);
                    } else if (state is slb.SongErrorState) {
                      return showMessageView(message: "Something Went wrong!");
                    } else {
                      return showMessageView();
                    }
                  },
                ),
              ],
            ),
          );
        } else if (state is InternetDisconnected) {
          return showMessageView(message: "No Internet Available");
        } else {
          return showMessageView();
        }
      }),
    );
  }
}
