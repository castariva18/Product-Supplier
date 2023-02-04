part of 'page.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutesCubit, RoutesState>(
        builder: (_, pageState) => (pageState is RoutesSplashScreenPage)
            ? SplashScreenPage()
            : (pageState is RoutesMainPage)
                ? MainPage(
                    initialPage: pageState.pageNumber,
                  )
                : (pageState is RoutesLoginPage)
                    ? LoginPage()
                    : (pageState is RoutesRegisterPage)
                        ? RegisterPage()
                        : (pageState is RoutesAddProductPage)
                            ? AddProductPage()
                            : (pageState is RoutesAddSuplierPage)
                                ? AddSuplierPage()
                                : Container());
  }
}
