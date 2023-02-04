part of 'page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget content() {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    style: blackTextStyleInter.copyWith(
                        fontSize: 32, fontWeight: bold),
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  top: defaultMargin,
                  bottom: defaultMargin),
              child: Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Type your username',
                    hintStyle: const TextStyle(
                      color: kSearchColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: defaultMargin),
              child: Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: _obscureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Type your password',
                    hintStyle: const TextStyle(
                      color: kSearchColor,
                      fontWeight: FontWeight.w400,
                    ),
                    suffix: InkWell(
                      onTap: _toggle,
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 22.0,
                      ),
                    ),
                  ),
                ),
              )),
          GestureDetector(
            onTap: () {
              context.read<RoutesCubit>().emit(RoutesMainPage(0));
            },
            child: Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 20),
              decoration: BoxDecoration(
                  color: kTextOrangeColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text("Login",
                      style: whiteTextStyleInter.copyWith(
                          fontSize: 16, fontWeight: bold),
                      textAlign: TextAlign.center)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Text(
                    "Don't have an account?",
                    style: blackTextStyleInter.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )),
              GestureDetector(
                onTap: () {
                  context.read<RoutesCubit>().emit(RoutesRegisterPage());
                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Text(
                      "Sign Up",
                      style: blackTextStyleInter.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: kPrimaryColor,
        ),
        SafeArea(child: content()),
      ]),
    );
  }
}
