part of 'page.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController hargaController = TextEditingController();
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController namaSupplierController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  Widget content() {
    return SingleChildScrollView(
      child: Container(
        height: MyUtility(context).height / 1,
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
                    controller: namaBarangController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.article),
                      labelText: 'Nama barang',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Type nama barang',
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
                ),
                child: Container(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: hargaController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.paid_outlined),
                      labelText: 'Harga barang',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Type harga barang',
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
                    keyboardType: TextInputType.number,
                    controller: stokController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_shopping_cart),
                      labelText: 'Stok barang',
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Type stok barang',
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
                    controller: namaSupplierController,
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
                    controller: alamatController,
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
                    controller: noTelpController,
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
              child: BlocConsumer<ProductCubit, ProductState>(
                listener: (context, state) {
                  if (state is ProductSuccess) {
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
                        'Berhasil tambah barang',
                        style: whiteTextStyleInter.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ).show(context);
                    context.read<RoutesCubit>().emit(RoutesMainPage(1));
                  } else if (state is ProductFailed) {
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
                  if (state is ProductLoading) {
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
                      if (namaBarangController.text == "" ||
                          hargaController.text == "" ||
                          stokController.text == "" ||
                          alamatController.text == "" ||
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
                        context.read<ProductCubit>().addProduct(
                              int.parse(hargaController.text),
                              0,
                              namaBarangController.text,
                              int.parse(stokController.text),
                              alamatController.text.toString(),
                              0,
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
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<RoutesCubit>().emit(RoutesMainPage(1));
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
