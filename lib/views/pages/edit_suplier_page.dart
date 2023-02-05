part of 'page.dart';

class UpdateSupplierPage extends StatefulWidget {
  final int idSupplier;
  const UpdateSupplierPage({
    Key? key,
    required this.idSupplier,
  }) : super(key: key);

  @override
  State<UpdateSupplierPage> createState() => _UpdateSupplierPageState();
}

class _UpdateSupplierPageState extends State<UpdateSupplierPage> {
  @override
  void initState() {
    context.read<SupplierCubit>().getDetailSupplier(widget.idSupplier);
    super.initState();
  }

  TextEditingController hargaController = TextEditingController();
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController namaSupplierController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  Widget content() {
    return BlocBuilder<SupplierCubit, SupplierState>(
      builder: (context, state) {
        if (state is SupplierGetDetailSuccess) {
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
                          controller: namaSupplierController
                            ..text = (state.result.namaSupplier != "")
                                ? state.result.namaSupplier
                                : "",
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.diversity_3),
                            labelText: 'Nama supplier',
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Type nama supplier',
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
                          controller: alamatController
                            ..text = (state.result.alamat != "")
                                ? state.result.alamat
                                : "",
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.map),
                            labelText: 'Alamat supplier',
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Type alamat supplier',
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
                          keyboardType: TextInputType.number,
                          controller: noTelpController
                            ..text = (state.result.noTelp != "")
                                ? state.result.noTelp
                                : "",
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Nomor telpon',
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Type nomor telpon',
                            hintStyle: const TextStyle(
                              color: kSearchColor,
                              fontWeight: FontWeight.w400,
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
                    child: BlocConsumer<SupplierCubit, SupplierState>(
                      listener: (context, state) {
                        if (state is SupplierSuccess) {
                          Flushbar(
                            duration: const Duration(milliseconds: 3000),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Colors.green,
                            titleText: Text(
                              'Success',
                              style: whiteTextStyleInter.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            messageText: Text(
                              'Berhasil Update',
                              style: whiteTextStyleInter.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ).show(context);
                          context.read<RoutesCubit>().emit(RoutesMainPage(0));
                        } else if (state is SupplierFailed) {
                          // print(state.message);

                          Flushbar(
                            duration: const Duration(milliseconds: 3000),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Colors.amber,
                            titleText: Text(
                              'Warning',
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
                          context.read<RoutesCubit>().emit(RoutesMainPage(0));
                        }
                      },
                      builder: (context, state) {
                        if (state is SupplierLoading) {
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
                            if (alamatController.text == "" ||
                                namaSupplierController.text == "" ||
                                noTelpController.text == "") {
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
                              context.read<SupplierCubit>().updateSupplier(
                                    alamatController.text.toString(),
                                    1,
                                    namaSupplierController.text.toString(),
                                    noTelpController.text.toString(),
                                  );
                            }
                          },
                          child: Text(
                            'Simpan',
                            style: whiteTextStyleInter.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 55,
                      margin: const EdgeInsets.symmetric(
                          horizontal: defaultMargin + 2, vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kredColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textStyle: whiteTextStyleInter.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        onPressed: () async {
                          context.read<SupplierCubit>().deleteSupplierCubit(
                                widget.idSupplier,
                              );
                        },
                        child: Text(
                          'Delete',
                          style: whiteTextStyleInter.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ))
                ],
              ));
        } else if (state is SupplierGetDetailFailed) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<RoutesCubit>().emit(RoutesMainPage(0));
        return false;
      },
      child: Scaffold(
        body: Stack(children: [
          Container(
            color: kPrimaryColor,
          ),
          SafeArea(child: content()),
        ]),
      ),
    );
  }
}
