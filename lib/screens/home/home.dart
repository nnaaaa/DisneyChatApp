import 'package:disneymobile/screens/home/widgets/appBar.dart';
import 'package:disneymobile/models/User.dart';
import 'package:disneymobile/screens/home/widgets/searchBox.dart';
import 'package:disneymobile/screens/loading/loading.dart';
import 'package:disneymobile/states/rootState.dart';
import 'package:disneymobile/states/slices/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart'
    show useSelector, useDispatch;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, StatefulHookWidget;

class HomeScreen extends StatefulHookWidget {
  static const route = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final user = useSelector<RootState, User?>((state) => state.user);
    //final dispatch = useDispatch<RootState>();

    // useEffect(() {
    //   UserAPI.getProfile().then(
    //     (value) {
    //       if (value == null) {
    //         return;
    //       }
    //       //   print('value ${value}');
    //       dispatch(AddUserAction(payload: value));
    //       setState(() {
    //         isLoading = false;
    //       });
    //     },
    //   ).catchError((error) {
    //     Navigator.of(context).pushReplacementNamed(AuthScreen.route);
    //     setState(() {
    //       isLoading = false;
    //     });
    //   });
    //   return () {};
    // }, []);

    //if (isLoading) return const LoadingScreen();

    return Scaffold(
        appBar: buildAppbar(user?.avatarUrl),
        endDrawer: const Drawer(
            child: Center(
          child: Text('Friends'),
        )),
        body: Column(
          children: [
            SearchBox(onChanged: (value) {}),
            Text(
              'Hello, World!',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ));
  }
}
