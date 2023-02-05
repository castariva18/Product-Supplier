part of 'page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    _checkStatusPageToken();
    super.initState();
  }

  Future<void> _checkStatusPageToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    var duration = const Duration(milliseconds: 3000);
    if (token != null) {
      var duration = const Duration(milliseconds: 2000);
      Timer(duration, () {
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        context.read<RoutesCubit>().emit(RoutesDashboardPage());
      });
    } else {
      var duration = const Duration(milliseconds: 2000);
      Timer(duration, () {
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        context.read<RoutesCubit>().emit(RoutesLoginPage());
      });
    }
  }

  Widget content() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Icon(
                  Icons.token,
                  size: 48,
                  color: kTextOrangeColor,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Supply",
                    style: orangeTextStyleInter.copyWith(
                        fontSize: 32, fontWeight: bold),
                  )),
            ],
          ),
          Text(
            'Logistics Supplier',
            style: orangeTextStyleInter.copyWith(
              fontWeight: regular,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 100,
          ),
          const SpinKitThreeInOut(
            color: kTextOrangeColor,
            size: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: kPrimaryColor,
        ),
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  'assets/bg1.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        content(),
      ],
    ));
  }
}
