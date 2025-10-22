import 'package:flutter/material.dart';
import 'package:ppkd_b4/constant/app_image.dart';
import 'package:ppkd_b4/day_17/models/buah_model.dart';
import 'package:ppkd_b4/extension/rupiah.dart';

class ListviewListModelWidgetDay17 extends StatefulWidget {
  const ListviewListModelWidgetDay17({super.key});

  @override
  State<ListviewListModelWidgetDay17> createState() =>
      _ListviewListModelWidgetDay17State();
}

class _ListviewListModelWidgetDay17State
    extends State<ListviewListModelWidgetDay17> {
  final List<BuahModel> namaBuah = [
    BuahModel(
      name: "Mangga",
      price: 5000,
      condition: "Segar",
      backgroundColor: Colors.amber.withOpacity(0.5),
      image: AppImages.mangga,
    ),
    BuahModel(
      name: "Apel",
      price: 5000,
      condition: "Segar",
      backgroundColor: Colors.red.withOpacity(0.5),
      image: AppImages.apell,
    ),
    BuahModel(
      name: "Jeruk",
      price: 15000,
      condition: "Segar",
      backgroundColor: Colors.orange.withOpacity(0.5),
      image: AppImages.jeruk,
    ),
    BuahModel(
      name: "Durian",
      price: 35000,
      condition: "Segar",
      backgroundColor: Colors.yellow.withOpacity(0.5),
      image: AppImages.durian,
    ),
    BuahModel(
      name: "Pisang",
      price: 2000,
      condition: "Segar",
      backgroundColor: Colors.yellowAccent.withOpacity(0.5),
      image: AppImages.pisang,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaBuah.length,
      itemBuilder: (BuildContext context, int index) {
        final item = namaBuah[index];
        return ListTile(
          onTap: () {
            //Versi 1
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: AppColor.army1,
            //     content: Text(
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            //     ),
            //   ),
            // );

            //Versi 2
            // Fluttertoast.showToast(
            //   backgroundColor: Colors.blue,
            //   msg:
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            // );

            //Versi 3
            // DelightToastBar(
            //   autoDismiss: true,
            //   snackbarDuration: Duration(milliseconds: 2000),
            //   builder: (context) => ToastCard(
            //     leading: Icon(Icons.flutter_dash, size: 28),
            //     title: Text(
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            //       style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            //     ),
            //   ),
            // ).show(context);
          },
          tileColor: item.backgroundColor,
          leading: Image.asset(item.image, width: 60),
          title: Text(item.name),
          subtitle: Text(item.price.toString().toRPCurrency()),
        );
      },
    );
  }
}
