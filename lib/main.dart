import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_suplier/views/pages/page.dart';
import 'cubit/api/auth_cubit/auth_cubit.dart';
import 'cubit/api/register_cubit/register_cubit.dart';
import 'cubit/routes/routes_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RoutesCubit(),
        ),
        BlocProvider(
          create: (_) => AuthCubit(),
        ),
        BlocProvider(
          create: (_) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: WrapperPage(),
      ),
    );
  }
}
