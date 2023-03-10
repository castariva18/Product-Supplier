import 'dart:async';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../cubit/api/auth_cubit/auth_cubit.dart';
import '../../cubit/api/product_cubit/product_cubit.dart';
import '../../cubit/api/register_cubit/register_cubit.dart';
import '../../cubit/api/supplier_cubit/supplier_cubit.dart';
import '../../cubit/routes/routes_cubit.dart';
import '../../shared/shared.dart';
import '../widget/widget.dart';

part 'register_page.dart';
part 'login_page.dart';
part 'product_page.dart';
part 'suplier_page.dart';
part 'splash_screen_page.dart';
part 'main_page.dart';
part 'add_product_page.dart';
part 'add_suplier_page.dart';
part 'edit_suplier_page.dart';
part 'edit_product_page.dart';
part 'wrapper.dart';
