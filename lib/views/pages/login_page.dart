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
          Container(
            width: double.infinity,
            height: 55,
            margin: const EdgeInsets.symmetric(
              horizontal: defaultMargin + 2,
            ),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Flushbar(
                    duration: const Duration(milliseconds: 3000),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Colors.green,
                    titleText: Text(
                      'Success Login',
                      style: whiteTextStyleInter.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    messageText: Text(
                      'Berhasil melakukan login',
                      style: whiteTextStyleInter.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ).show(context);
                  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                  context.read<RoutesCubit>().emit(RoutesMainPage(0));
                } else if (state is AuthFailed) {
                  // print(state.message);
                  Flushbar(
                    duration: const Duration(milliseconds: 3000),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Colors.red,
                    titleText: Text(
                      'Gagal Login',
                      style: whiteTextStyleInter.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    messageText: Text(
                      state.message,
                      style: whiteTextStyleInter.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ).show(context);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: SpinKitFadingCircle(
                      color: kPrimaryColor,
                      size: 50,
                    ),
                  );
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kTextOrangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: whiteTextStyleInter.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  onPressed: () async {
                    if (usernameController.text == "" ||
                        passwordController.text == "") {
                      Flushbar(
                        duration: const Duration(milliseconds: 3000),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Colors.red,
                        titleText: Text(
                          'Ada form kosong!',
                          style: whiteTextStyleInter.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        messageText: Text(
                          'Lakukan pengisian form dengan benar',
                          style: whiteTextStyleInter.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ).show(context);
                    } else {
                      context.read<AuthCubit>().loginGlobal(
                          usernameController.text.toString(),
                          passwordController.text.toString());
                    }
                  },
                  child: Text(
                    'Login',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 16,
                    ),
                  ),
                );
              },
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
