part of 'page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController fullnameController = TextEditingController();
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
              ),
              child: Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: fullnameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity),
                    labelText: 'Fullname',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Type your fullname',
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
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  Flushbar(
                    duration: const Duration(milliseconds: 3000),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Colors.green,
                    titleText: Text(
                      'Success SignUp',
                      style: whiteTextStyleInter.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    messageText: Text(
                      'Berhasil melakukan SignUp',
                      style: whiteTextStyleInter.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ).show(context);
                  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                  context.read<RoutesCubit>().emit(RoutesLoginPage());
                } else if (state is RegisterFailed) {
                  // print(state.message);

                  Flushbar(
                    duration: const Duration(milliseconds: 3000),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Colors.amber,
                    titleText: Text(
                      'Warning SignUp',
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
                  context.read<RoutesCubit>().emit(RoutesLoginPage());
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
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
                    if (fullnameController.text == "" ||
                        usernameController.text == "" ||
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
                      context.read<RegisterCubit>().registerGlobal(
                            passwordController.text.toString(),
                            fullnameController.text.toString(),
                            usernameController.text.toString(),
                          );
                    }
                  },
                  child: Text(
                    'Sign Up',
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
                    "Already have an account?",
                    style: blackTextStyleInter.copyWith(
                        fontSize: 16, fontWeight: medium),
                  )),
              GestureDetector(
                onTap: () {
                  context.read<RoutesCubit>().emit(RoutesLoginPage());
                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Text(
                      "Login",
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
